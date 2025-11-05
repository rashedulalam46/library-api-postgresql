-- ================================================
-- Create Database: Library
-- ================================================
CREATE DATABASE library;

-- Switch to Library database (run separately in psql or client)
\c library;

-- ================================================
-- Table: Authors
-- ================================================
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100),
    country CHAR(2),
    address VARCHAR(250),
    phone VARCHAR(20),
    email VARCHAR(200),
    create_date TIMESTAMP,
    active BOOLEAN NOT NULL
);

-- ================================================
-- Table: Categories
-- ================================================
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100),
    description VARCHAR(250),
    create_date TIMESTAMP,
    active BOOLEAN NOT NULL
);

-- ================================================
-- Table: Publishers
-- ================================================
CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY,
    publisher_name VARCHAR(100),
    address VARCHAR(250),
    phone VARCHAR(20),
    email VARCHAR(200),
    create_date TIMESTAMP,
    active BOOLEAN NOT NULL
);

-- ================================================
-- Table: Books
-- ================================================
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    description VARCHAR(250),
    author_id INT REFERENCES authors(author_id) ON DELETE SET NULL,
    category_id INT REFERENCES categories(category_id) ON DELETE SET NULL,
    publisher_id INT REFERENCES publishers(publisher_id) ON DELETE SET NULL,
    publish_date TIMESTAMP,
    isbn VARCHAR(20),
    price DECIMAL(18,2),
    create_date TIMESTAMP,
    active BOOLEAN
);

-- ================================================
-- Table: Members
-- ================================================
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    member_name VARCHAR(100),
    address VARCHAR(250),
    phone VARCHAR(20),
    email VARCHAR(200),
    join_date TIMESTAMP,
    active BOOLEAN NOT NULL
);

-- ================================================
-- Table: Borrowings
-- ================================================
CREATE TABLE borrowings (
    borrowing_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id) ON DELETE CASCADE,
    member_id INT REFERENCES members(member_id) ON DELETE CASCADE,
    borrow_date TIMESTAMP NOT NULL,
    return_date TIMESTAMP,
    returned BOOLEAN DEFAULT FALSE
);

-- ================================================
-- Indexes (optional, PostgreSQL auto-creates for PK/FK)
-- ================================================
-- Example of adding a specific index:
-- CREATE INDEX idx_books_author_id ON books(author_id);



