-- Users table
CREATE TABLE users (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(100) UNIQUE NOT NULL,
    password    VARCHAR(255) NOT NULL,
    role        ENUM('admin', 'user') DEFAULT 'user',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Circulars table
CREATE TABLE circulars (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    title       VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    posted_by   INTEGER NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deadline    DATE,
    FOREIGN KEY (posted_by) REFERENCES users(id) ON DELETE CASCADE
);

-- Applications table
CREATE TABLE applications (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id       INTEGER NOT NULL,
    circular_id   INTEGER NOT NULL,
    status        ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    applied_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (circular_id) REFERENCES circulars(id) ON DELETE CASCADE,
    UNIQUE(user_id, circular_id)
);
