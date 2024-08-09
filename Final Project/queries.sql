-- Find all borrow records for a member named 'Roaa Mohamed'
SELECT *
FROM Borrow
WHERE member_id IN (
    SELECT member_id
    FROM Members
    WHERE name = 'Roaa Mohamed'
);

-- Find all borrow records for books in the 'Arabic Literature' category
SELECT *
FROM Borrow
WHERE book_id IN (
    SELECT book_id
    FROM Books
    WHERE category_id = (
        SELECT category_id
        FROM Categories
        WHERE name = 'Arabic Literature'
    )
);

-- Insert Egyptian authors
INSERT OR IGNORE INTO Authors (name) VALUES
('Naguib Mahfouz'),
('Ahmed Khaled Towfik'),
('Alaa Al Aswany'),
('Taha Hussein'),
('Gamal El-Ghitani'),
('Hala El Badry');

-- Insert categories
INSERT OR IGNORE INTO Categories (name) VALUES
('Arabic Literature'),
('Historical Fiction'),
('Science Fiction'),
('Classic Literature'),
('Modern Fiction'),
('Drama');

-- Insert books by Egyptian authors in Arabic
INSERT OR IGNORE INTO Books (title, author_id, isbn, published_date, category_id) VALUES
('Children of the Alley', 1, '9789770921375', '1967-01-01', 1),
('Zayni Barakat', 5, '9789770921955', '1995-01-01', 2),
('The Secret of the Nile', 6, '9789770918756', '2007-01-01', 3),
('The Days', 4, '9789772320722', '1929-01-01', 4);

-- Insert members
INSERT OR IGNORE INTO Members (name, email, join_date) VALUES
('Roaa Mohamed', 'roaa.mohamed@gmail.com', '2024-01-15'),
('Sameh Mohamed', 'sam.mohamed@gmail.com', '2024-02-20'),
('Eman Deyab', 'eman.deyab@gmail.com', '2024-03-10'),
('Hana Shaker', 'hanaz.shaker@gmail.com', '2024-04-05');


