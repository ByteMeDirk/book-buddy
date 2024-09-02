const db = require('../util/database');

module.exports = class User {
    constructor(username, email, password_hash) {
        this.username = username;
        this.email = email;
        this.password_hash = password_hash
    }  

    static find(email) {
        return db.execute(
            'SELECT * FROM USER WHERE email = ?', [email]
        );
    }
    
    static save(user){
        return db.execute(
            'INSERT INTO USER(username, email, password_hash, registration_date) VALUES (?, ?, ?, CURDATE())', 
            [user.username, user.email, user.password_hash]
        );
    }
};
