-- Step 1: Create the authors table
CREATE TABLE authors (
    author_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE
);

-- Step 2: Create the books table
CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    publication_year INTEGER CHECK (publication_year <= EXTRACT(YEAR FROM CURRENT_DATE)),
    author_id INTEGER,
    genre TEXT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Step 3: Insert valid data into the authors table
INSERT INTO authors (author_id, first_name, last_name, email)
VALUES 
(1, 'J.K.', 'Rowling', 'jk.rowling@hogwarts.ac.uk'),
(2, 'George', 'Orwell', 'george.orwell@allisbad.co.uk'),
(3, 'Tamar', 'Bornstein-Lazar', 'tamarblazar@revivim.co.il');

-- Step 4: Insert valid data into the books table
INSERT INTO books (book_id, title, publication_year, author_id, genre)
VALUES 
(1, 'Harry Potter and the Sorcerer''s Stone', 1997, 1, 'Fantasy'),
(2, '1984', 1949, 2, 'Dystopian'),
(3, 'Kofiko', 1957, 3, 'Fiction');

-- Step 5: Try inserting a record with NULL email in authors table (invalid)
INSERT INTO authors (author_id, first_name, last_name, email)
VALUES (4, 'Meir', 'Shalev', NULL);  -- This will fail due to the unique constraint on email.

-- Step 6: Try inserting a duplicate email in the authors table (invalid)
INSERT INTO authors (author_id, first_name, last_name, email)
VALUES (5, 'Margaret', 'Atwood', 'george.orwell@allisbad.co.uk');  -- This will fail due to the unique constraint.

-- Step 7: Try inserting a book with a future publication year (invalid)
INSERT INTO books (book_id, title, publication_year, author_id, genre)
VALUES (4, 'The matrix movie came true', 2029, NULL, 'Sci-Fi');  -- This will fail due to the CHECK constraint.

-- Step 8: Try inserting a book with an invalid author_id (foreign key violation)
INSERT INTO books (book_id, title, publication_year, author_id, genre)
VALUES (5, 'One Thousand and One Nights', 801, 999, 'Fiction');  -- This will fail due to foreign key violation.

-- Step 9: Drop the NOT NULL constraint on the email column in authors table
ALTER TABLE authors
ALTER COLUMN email DROP NOT NULL;  -- Removes the NOT NULL constraint.

-- Step 10: Try inserting a record with NULL email after removing the NOT NULL constraint
INSERT INTO authors (author_id, first_name, last_name, email)
VALUES (6, 'Mark', 'Twain', NULL);  -- This will succeed as the NOT NULL constraint was removed.

-- Step 11: Add a CHECK constraint on the email column to ensure it is valid (contains '@' and '.')
ALTER TABLE authors
ADD CONSTRAINT email_check CHECK (email LIKE '%@%' AND email LIKE '%.%');

-- Step 12: Test the new CHECK constraint
-- Valid email
INSERT INTO authors (author_id, first_name, last_name, email)
VALUES (7, 'Andrew', 'Ng', 'andrew.ng@example.com');  -- This will succeed.

-- Invalid email
INSERT INTO authors (author_id, first_name, last_name, email)
VALUES (8, 'Etgar', 'Keret', 'invalid-email');  -- This will fail due to the CHECK constraint.

-- Step 13: Try deleting an author (author_id = 1) who has associated books (foreign key violation)
DELETE FROM authors WHERE author_id = 1;  -- This will fail due to foreign key violation.

-- Step 14: Drop the foreign key constraint between the books and authors tables
ALTER TABLE books
DROP CONSTRAINT books_author_id_fkey;  -- Replace with the actual name of the foreign key constraint.

-- Step 15: Insert the first author (J.K. Rowling) back into the authors table
INSERT INTO authors (author_id, first_name, last_name, email)
VALUES (1, 'J.K.', 'Rowling', 'jk.rowling@hogwarts.ac.uk');

-- Step 16: Add the foreign key constraint with ON DELETE CASCADE
ALTER TABLE books
ADD CONSTRAINT books_author_id_fkey
FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE;

-- Step 17: Try deleting the author (author_id = 1) and check the books table
DELETE FROM authors WHERE author_id = 1;  -- This will delete the author and the associated books due to CASCADE.
