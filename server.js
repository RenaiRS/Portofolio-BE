const express = require("express");
const bodyParser = require("body-parser");
const database = require("./Database");
const app = express();
const session = require("express-session");
const bcrypt = require("bcryptjs");

// app.use(express.static(path.join(__dirname, 'public')));

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

app.use(
    session({
        secret: "yourSecretKey",
        resave: false,
        saveUninitialized: true,
    })
);

app.use((req, res, next) => {
    res.locals.user = req.session.user || null;
    next();
});

// Function untuk parsing hasil database
function parseResult(result) {
    return Object.values(JSON.parse(JSON.stringify(result)));
}

// Middleware untuk memastikan user login
function requireLogin(req, res, next) {
    if (!req.session.user) {
        return res.redirect("/login");
    }
    next();
}

// Home Page
app.get('/', (req, res) => {
    if (req.session.user) {
        // Jika user sudah login, redirect ke halaman profile
        res.redirect('/profile');
    } else {
        // Jika belum login, render halaman index
        res.render('index', { title: 'Welcome to Specify' });
    }
});

// Rute Login
app.get('/login', (req, res) => {
    res.render('login', { error: null });
});

// Proses login pengguna
app.post('/login', (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
  
    const sql = `SELECT * FROM users WHERE username = ?`;
    database.query(sql, [username], async (err, results) => {
        if (err) {
            console.error("Error during login:", err);
            res.render('login', { error: "An error occurred. Please try again later." });
        } else if (results.length === 0) {
            console.log("User not found.");
            res.render('login', { error: "Invalid username or password." });
        } else {
            const user = results[0];
            try {
                const match = await bcrypt.compare(password, user.password_hash);
                if (match) {
                    req.session.user = { username: user.username, id: user.id };
                    console.log("Login successful!");
                    res.redirect('/');
                } else {
                    console.log("Invalid credentials.");
                    res.render('login', { error: "Invalid username or password." });
                }
            } catch (compareError) {
                console.error("Error during password comparison:", compareError);
                res.render('login', { error: "An error occurred. Please try again later." });
            }
        }
    });
});

// Rute Register
app.get("/register", (req, res) => {
    res.render("register", { error: null });
});

// Proses registrasi pengguna
app.post("/register", async (req, res) => {
    const username = req.body.username;
    const password = req.body.password;

    // Validasi username: hanya huruf, angka, dan underscore
    const usernameRegex = /^[a-zA-Z0-9_]+$/;
    if (!usernameRegex.test(username)) {
        return res.render("register", { error: "Username can only contain letters, numbers, and underscores." });
    }

    // Validasi password: minimal 5 karakter
    if (password.length < 5) {
        return res.render("register", { error: "Password must be at least 5 characters long." });
    }

    // Cek apakah username sudah ada
    const checkUsernameSql = `SELECT * FROM users WHERE username = ?`;
    database.query(checkUsernameSql, [username], async (err, results) => {
        if (err) {
            console.error("Error checking username:", err);
            return res.status(500).send("Internal server error.");
        }

        if (results.length > 0) {
            // Jika username sudah ada, beri pesan error
            return res.render("register", { error: "Username already taken. Please choose another one." });
        }

        // Jika username belum ada, lanjutkan dengan proses registrasi
        try {
            const hashedPassword = await bcrypt.hash(password, 10);
            const sql = `INSERT INTO users (username, password_hash) VALUES (?, ?)`;

            database.query(sql, [username, hashedPassword], (err, results) => {
                if (err) {
                    console.error("Error during registration:", err);
                    return res.status(500).send("Registration failed.");
                } else {
                    console.log("User registered successfully!");
                    return res.redirect('/login');
                }
            });
        } catch (err) {
            console.error("Error hashing password:", err);
            return res.status(500).send("Internal server error.");
        }
    });
});



// Rute ketika sudah login
app.get('/profile', requireLogin, (req, res) => {
    res.render('profile');
});

// Route Logout
app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            return res.status(500).send("Failed to log out");
        }
        res.redirect('/');
    });
});

// Search Bar
app.get('/search', function (req, res) {
    const query = req.query.query.trim();

    if (!query) {
        return res.status(400).send("No search query provided");
    }

    const sqlLaptop = `SELECT * FROM laptop WHERE brand LIKE ?`;
    const sqlPhone = `SELECT * FROM phone WHERE brand LIKE ?`;
    const searchQuery = `%${query}%`;

    database.query(sqlLaptop, [searchQuery], (err, laptopResults) => {
        if (err) {
            console.error('Error fetching laptops:', err);
            return res.status(500).send('Internal Server Error');
        }

        database.query(sqlPhone, [searchQuery], (err, phoneResults) => {
            if (err) {
                console.error('Error fetching phones:', err);
                return res.status(500).send('Internal Server Error');
            }
            res.render('searchbar', { 
                query: query,
                laptopResults: laptopResults,
                phoneResults: phoneResults
            });
        });
    });
});

// Rute Kategori 
// app.get('/Kategori', function(req, res){
//     const Kategori = [
//         { name: 'Phone', link: '/Phone' },
//         { name: 'Laptop', link: '/laptop' },
//         { name: 'Tab', link: '/Tab' }
//     ];
//     res.render('kategori', { Kategori });
// });

// Rute Phone
app.get('/Phone', (req, res) => {
    const sql = `SELECT * FROM phone`;
    database.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching phones:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.render('phone', { phones: results, selectedBrand: null });
    });
});

// Route untuk mendapatkan phone berdasarkan ID
app.get('/phone/:id', (req, res) => {
    const phoneId = req.params.id;

    const queryPhone = 'SELECT * FROM phone WHERE id = ?';
    database.query(queryPhone, [phoneId], (err, phoneResult) => {
        if (err) {
            console.error('Error fetching phone details:', err);
            return res.status(500).send('Internal Server Error');
        }
        if (phoneResult.length === 0) {
            return res.status(404).send('Phone not found');
        }

        const queryReviews = 'SELECT reviews.review_text, users.username FROM reviews JOIN users ON reviews.user_id = users.id WHERE phone_id = ?';
        database.query(queryReviews, [phoneId], (err, reviewResults) => {
            if (err) {
                console.error('Error fetching reviews:', err);
                return res.status(500).send('Internal Server Error');
            }
            const phone = phoneResult[0];
            const phoneImage = phone.phone_image;  // Menggunakan atribut phone_image

            res.render('PhoneDetail', { phone: phone, reviews: reviewResults, phoneImage: phoneImage });
        });
    });
});


// Rute untuk kategori ponsel
app.get('/phone/category/:brand', (req, res) => {
    const brand = req.params.brand;
    const query = 'SELECT * FROM phone WHERE brand = ?';

    database.query(query, [brand], (err, results) => {
        if (err) {
            console.error('Error fetching phones by category:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.render('phone', { phones: results, selectedBrand: brand });
    });
});

// Rute Memanggil review
app.post('/phone/:id/review', requireLogin, (req, res) => {
    const phoneId = req.params.id;
    const userId = req.session.user.id;
    const reviewText = req.body.review_text;

    const queryInsertReview = 'INSERT INTO reviews (phone_id, user_id, review_text) VALUES (?, ?, ?)';
    database.query(queryInsertReview, [phoneId, userId, reviewText], (err) => {
        if (err) {
            console.error('Error saving review:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.redirect(`/phone/${phoneId}`);
    });
});

// Rute Laptop
app.get('/Laptop', (req, res) => {
    const sql = `SELECT * FROM laptop`;
    
    database.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching laptop:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.render('laptop', { laptop: results, selectedBrand: null });
    });
});
// Route untuk mendapatkan laptop berdasarkan ID
app.get('/laptop/:id', (req, res) => {
    const laptopId = req.params.id;

    const queryLaptop = 'SELECT * FROM laptop WHERE id = ?';
    database.query(queryLaptop, [laptopId], (err, laptopResult) => {
        if (err) {
            console.error('Error fetching laptop details:', err);
            return res.status(500).send('Internal Server Error');
        }
        if (laptopResult.length === 0) {
            return res.status(404).send('Laptop not found');
        }

        const queryReviews = 'SELECT reviews.review_text, users.username FROM reviews JOIN users ON reviews.user_id = users.id WHERE laptop_id = ?';
        database.query(queryReviews, [laptopId], (err, reviewResults) => {
            if (err) {
                console.error('Error fetching reviews:', err);
                return res.status(500).send('Internal Server Error');
            }
            
            const laptop = laptopResult[0];
            const laptopImage = laptop.laptop_image;
            res.render('LaptopDetail', { laptop: laptop, reviews: reviewResults, laptopImage: laptopImage });
        });
    });
});


// Route untuk kategori laptop
app.get('/laptop/category/:brand', (req, res) => {
    const brand = req.params.brand;
    const query = 'SELECT * FROM laptop WHERE brand = ?';

    database.query(query, [brand], (err, results) => {
        if (err) {
            console.error('Error fetching laptops by category:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.render('laptop', { laptop: results, selectedBrand: brand });
    });
});
// Rute Memanggil Review Laptop 
app.post('/laptop/:id/review', requireLogin, (req, res) => {
    const laptopId = req.params.id;
    const userId = req.session.user.id;
    const reviewText = req.body.review_text;

    const queryInsertReview = 'INSERT INTO reviews (laptop_id, user_id, review_text) VALUES (?, ?, ?)';
    database.query(queryInsertReview, [laptopId, userId, reviewText], (err) => {
        if (err) {
            console.error('Error saving review:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.redirect(`/laptop/${laptopId}`);
    });
});

// Rute Komparasi
app.get('/compare', (req, res) => {
    const selectedDevices = req.query.devices || [];
    const category = req.query.category || 'Phone';

    if (!selectedDevices.length) {
        return res.render('compare', {
            devices: [],
            category,
            notification: 'You must select at least one device to compare.'
        });
    }
    if (selectedDevices.length < 2) {
        return res.render('compare', {
            devices: [],
            category,
            notification: 'You must select at least two devices to compare.'
        });
    }
    const validCategories = ['Phone', 'Laptop'];
    if (!validCategories.includes(category)) {
        return res.status(400).send('Invalid category.');
    }

    const query = `SELECT * FROM ${database.escapeId(category)} WHERE id IN (?)`;
    database.query(query, [selectedDevices], (err, devices) => {
        if (err) {
            console.error('Error fetching devices for comparison:', err);
            return res.status(500).send('Internal Server Error');
        }

        res.render('compare', { 
            devices,
            category,
            notification: null // Tidak ada notifikasi jika tidak ada error
        });
    });
});



app.listen(3001, function() {
    console.log("Listening to http://localhost:3001");
    console.log("Bisa Bang GG")
});
