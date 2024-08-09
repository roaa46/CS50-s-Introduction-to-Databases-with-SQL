-- Create the Authors table
CREATE TABLE Authors (
    author_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

-- Create the Categories table
CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

-- Create the Books table
CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    author_id INTEGER,
    isbn TEXT UNIQUE,
    published_date DATE,
    category_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create the Members table
CREATE TABLE Members (
    member_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

-- Create the Borrow table
CREATE TABLE Borrow (
    borrow_id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER,
    member_id INTEGER,
    borrow_date DATE NOT NULL,
    return_date DATE, -- Make sure this allows NULL
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Create indexes for better performance
CREATE INDEX idx_author_id ON Books(author_id);
CREATE INDEX idx_category_id ON Books(category_id);

-- Create a view to list all books with their authors and categories
CREATE VIEW BookDetails AS
SELECT
    b.title,
    a.name AS author,
    c.name AS category,
    b.isbn,
    b.published_date
FROM
    Books b
JOIN
    Authors a ON b.author_id = a.author_id
JOIN
    Categories c ON b.category_id = c.category_id;
