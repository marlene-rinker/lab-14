CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

ALTER TABLE books ADD COLUMN bookshelf_id INT;

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

ALTER TABLE books DROP COLUMN bookshelf;

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);

SELECT books.id, title, author, name FROM books INNER JOIN bookshelves ON books.bookshelf_id=bookshelves.id;