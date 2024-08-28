-- Create USER table
CREATE TABLE USER
(
    user_id            INT AUTO_INCREMENT PRIMARY KEY,
    username           VARCHAR(50)  NOT NULL UNIQUE,
    email              VARCHAR(100) NOT NULL UNIQUE,
    password_hash      VARCHAR(255) NOT NULL,
    registration_date  DATE         NOT NULL,
    last_login         DATETIME     DEFAULT NULL,
    status             ENUM('active', 'inactive', 'suspended') DEFAULT 'active',
    profile_picture    VARCHAR(255) DEFAULT NULL,
    two_factor_enabled BOOLEAN      DEFAULT FALSE,
    roles              VARCHAR(255) DEFAULT NULL
);

-- Create BOOK_CLUB table
CREATE TABLE BOOK_CLUB
(
    club_id       INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    description   TEXT,
    creator_id    INT,
    creation_date DATE         NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES USER (user_id)
);

-- Create BOOK table
CREATE TABLE BOOK
(
    book_id          INT AUTO_INCREMENT PRIMARY KEY,
    title            VARCHAR(255) NOT NULL,
    author           VARCHAR(100) NOT NULL,
    isbn             VARCHAR(13),
    publication_date DATE,
    added_by         INT,
    FOREIGN KEY (added_by) REFERENCES USER (user_id)
);

-- Create MEETING table
CREATE TABLE MEETING
(
    meeting_id   INT AUTO_INCREMENT PRIMARY KEY,
    club_id      INT,
    book_id      INT,
    meeting_time DATETIME NOT NULL,
    location     VARCHAR(255),
    FOREIGN KEY (club_id) REFERENCES BOOK_CLUB (club_id),
    FOREIGN KEY (book_id) REFERENCES BOOK (book_id)
);

-- Create DISCUSSION table
CREATE TABLE DISCUSSION
(
    discussion_id INT AUTO_INCREMENT PRIMARY KEY,
    club_id       INT,
    book_id       INT,
    user_id       INT,
    title         VARCHAR(255) NOT NULL,
    content       TEXT,
    created_at    DATETIME     NOT NULL,
    FOREIGN KEY (club_id) REFERENCES BOOK_CLUB (club_id),
    FOREIGN KEY (book_id) REFERENCES BOOK (book_id),
    FOREIGN KEY (user_id) REFERENCES USER (user_id)
);

-- Create READING_LIST table
CREATE TABLE READING_LIST
(
    list_id    INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT,
    book_id    INT,
    progress   INT,
    added_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES USER (user_id),
    FOREIGN KEY (book_id) REFERENCES BOOK (book_id)
);

-- Create REVIEW table
CREATE TABLE REVIEW
(
    review_id   INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT,
    book_id     INT,
    rating      INT,
    review_text TEXT,
    review_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES USER (user_id),
    FOREIGN KEY (book_id) REFERENCES BOOK (book_id)
);