-- Practical evaluation – Database

--1. Create a database called LIBRARY.
CREATE DATABASE lybrary;

--2. Create a table called PUBLISHER, according to the data below:
--| Field      | Observations                        |
--|------------|-------------------------------------|
--| PublisherId | Integer, not null, primary key and auto increment |
--| Name       | Character, not null and unique      |

CREATE TABLE publisher (
	publisher_id serial NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT pk_publisher_publisher_id PRIMARY KEY (publisher_id),
	CONSTRAINT un_publisher_name UNIQUE (name)
);

--3. Insert the data below into the PUBLISHER table.
--| Name           |
--|----------------|
--| Bookman        |
--| Edgard Blusher |
--| Nova Terra     |
--| Brasport       |

INSERT INTO publisher (name)
VALUES
('Bookman'),
('Edgard Blusher'),
('Nova Terra'),
('Brasport');

--4. Create a table called CATEGORY, according to the data below:
--| Field       | Observations                        |
--|-------------|-------------------------------------|
--| CategoryId  | Integer, not null, primary key and auto increment |
--| Name        | Character, not null and unique      |

CREATE TABLE category(
	category_id serial NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT pk_category_category_id PRIMARY KEY (category_id),
	CONSTRAINT un_category_name UNIQUE (name)
);

--5. Insert the data below into the CATEGORY table.
--| Name           |
--|----------------|
--| Database       |
--| HTML           |
--| Java           |
--| PHP            |

INSERT INTO category (name)
VALUES
('Database'),
('HTML'),
('Java'),
('PHP');

--6. Create a table called AUTHOR, according to the data below:
--| Field    | Observations                        |
--|----------|-------------------------------------|
--| AuthorId | Integer, not null, primary key and auto increment |
--| Name     | Character and not null              |

CREATE TABLE author (
	author_id serial NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT pk_author_name PRIMARY KEY (author_id)
);

--7. Insert the data below into the AUTHOR table.
--| Name                      |
--|---------------------------|
--| Waldemar Setzer           |
--| Flávio Soares             |
--| John Watson               |
--| Rui Rossi dos Santos      |
--| Antonio Pereira de Resende|
--| Claudiney Calixto Lima    |
--| Evandro Carlos Teruel     |
--| Ian Graham                |
--| Fabrício Xavier           |
--| Pablo Dalloglio           |

INSERT INTO author (name)
VALUES
('Waldemar Setzer'),
('Flávio Soares'),
('John Watson'),
('Rui Rossi dos Santos'),
('Antonio Pereira de Resende'),
('Claudiney Calixto Lima'),
('Evandro Carlos Teruel '),
('Ian Graham '),
('Fabrício Xavier'),
('Pablo Dalloglio ');

--8. Create a table called BOOK, according to the data below:
--| Field        | Observations                                        |
--|--------------|-----------------------------------------------------|
--| BookId       | Integer, not null, primary key and auto increment   |
--| PublisherId  | Integer, not null and foreign key to PUBLISHER table |
--| CategoryId   | Integer, not null and foreign key to CATEGORY table  |
--| Name         | Character, not null and unique                      |

CREATE TABLE book (
	book_id serial NOT NULL,
	publisher_id integer NOT NULL,
	category_id integer NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT pk_book_book_id PRIMARY KEY (book_id),
	CONSTRAINT fk_book_publisher_id FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
	CONSTRAINT fk_book_category_id FOREIGN KEY (category_id) REFERENCES category (category_id),
	CONSTRAINT un_book_name UNIQUE (name)
);

--9. Insert the data below into the BOOK table.
--| PublisherId | CategoryId | Name                                       |
--|-------------|------------|--------------------------------------------|
--| Edgard Blusher | Database   | Database – 1st Edition                     |
--| Bookman     | Database   | Oracle Database 11G Administration         |
--| Nova Terra  | Java       | Computer Programming in Java               |
--| Brasport    | Java       | Aspect-Oriented Programming in Java        |
--| Brasport    | HTML       | HTML5 – Practical Guide                    |
--| Nova Terra  | HTML       | XHTML: Reference Guide for Web Development |
--| Bookman     | PHP        | PHP for Professional Development           |
--| Edgard Blusher | PHP        | PHP with Object-Oriented Programming       |

INSERT INTO book (publisher_id, category_id, name)
VALUES 
(2, 1, 'Database – 1st Edition'),
(1, 1, 'Oracle Database 11G Administration'),
(3, 3, 'Computer Programming in Java'),
(4, 3, 'Aspect-Oriented Programming in Java'),
(4, 2, 'HTML5 – Practical Guide'),
(3, 2, 'XHTML: Reference Guide for Web Development'),
(1, 4, 'PHP for Professional Development'),
(2, 4, 'PHP with Object-Oriented Programming');

--10. Create a table called BOOK_AUTHOR, according to the data below:
--| Field     | Observations                                          |
--|-----------|-------------------------------------------------------|
--| BookId    | Integer, not null and foreign key to BOOK table       |
--| AuthorId  | Integer, not null and foreign key to AUTHOR table     |
--| Composite primary key with fields BookId and AuthorId  

CREATE TABLE book_author (
	book_id integer NOT NULL,
	author_id integer NOT NULL,
	CONSTRAINT fk_book_author_book_id FOREIGN KEY (book_id) REFERENCES book (book_id),
	CONSTRAINT fk_book_author_author_id FOREIGN KEY (author_id) REFERENCES author (author_id),
	CONSTRAINT pk_book_author_book_id_author_id PRIMARY KEY (book_id, author_id)
);

--|11. Insert the data below into the BOOK_AUTHOR table.
--| BookId                           | AuthorId                |
--|----------------------------------|-------------------------|
--| Database – 1st Edition           | Waldemar Setzer         |
--| Database – 1st Edition           | Flávio Soares           |
--| Oracle Database 11G Administration | John Watson             |
--| Computer Programming in Java     | Rui Rossi dos Santos    |
--| Aspect-Oriented Programming in Java | Antonio Pereira de Resende |
--| Aspect-Oriented Programming in Java | Claudiney Calixto Lima  |
--| HTML5 – Practical Guide          | Evandro Carlos Teruel   |
--| XHTML: Reference Guide for Web Development | Ian Graham    |
--| PHP for Professional Development | Fabrício Xavier         |
--| PHP with Object-Oriented Programming | Pablo Dalloglio      |

INSERT INTO book_author (book_id, author_id)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10);

SELECT * FROM book_author;

--12. Create a table called STUDENT, according to the data below:
--| Field     | Observations                                        |
--|-----------|-----------------------------------------------------|
--| StudentId | Integer, not null, primary key and auto increment   |
--| Name      | Character and not null                              |

CREATE TABLE student (
	student_id serial NOT NULL,
	name varchar(50) NOT NULL,
	CONSTRAINT pk_student_student_id PRIMARY KEY (student_id)
);

--13. Insert the data below into the STUDENT table.
--| Name   |
--|--------|
--| Mario  |
--| João   |
--| Paulo  |
--| Pedro  |
--| Maria  |

INSERT INTO student (name)
VALUES
('Mario'),
('João'),
('Paulo'),
('Pedro'),
('Maria');

--14. Create a table called LOAN, according to the data below:
--| Field          | Observations                                        |
--|----------------|-----------------------------------------------------|
--| LoanId         | Integer, not null, primary key and auto increment   |
--| StudentId      | Integer, not null and foreign key to STUDENT table  |
--| Loan_Date      | Date, not null and default value with system current date |
--| Return_Date    | Date and not null                                   |
--| Value          | Decimal and not null                                |
--| Returned       | Character and not null (only one character)         |

CREATE TABLE loan (
	loan_id serial NOT NULL,
	student_id integer NOT NULL,
	loan_date date NOT NULL DEFAULT current_date,
	return_date date NOT NULL,
	value numeric(10,2) NOT NULL,
	returned char(1) NOT NULL,
	CONSTRAINT pk_loan_loan_id PRIMARY KEY (loan_id),
	CONSTRAINT fk_loan_student_id FOREIGN KEY (student_id) REFERENCES student (student_id)
);

--15. Insert the data below into the LOAN table.
--| StudentId | Loan_Date | Return_Date | Value | Returned |
--|-----------|-----------|-------------|-------|----------|
--| Mario     | 2012-05-02 | 2012-05-12  | 10.00 | Y        |
--| Mario     | 2012-04-23 | 2012-05-03  | 5.00  | N        |
--| João      | 2012-05-10 | 2012-05-20  | 12.00 | N        |
--| Paulo     | 2012-05-10 | 2012-05-20  | 8.00  | Y        |
--| Pedro     | 2012-05-05 | 2012-05-15  | 15.00 | N        |
--| Pedro     | 2012-05-07 | 2012-05-17  | 20.00 | Y        |
--| Pedro     | 2012-05-08 | 2012-05-18  | 5.00  | Y        |

INSERT INTO loan (student_id, loan_date, return_date, value, returned)
VALUES
(1, '2012-05-02', '2012-05-12', 10.00, 'Y'),
(1, '2012-04-23', '2012-05-03', 5.00, 'N'),
(2, '2012-05-10', '2012-05-20', 12.00, 'N'),
(3, '2012-05-10', '2012-05-20', 8.00, 'Y'),
(4, '2012-05-05', '2012-05-15', 15.00, 'N'),
(4, '2012-05-07', '2012-05-17', 20.00, 'Y'),
(4, '2012-05-08', '2012-05-18', 5.00, 'Y');

--16. Create a table called LOAN_BOOK, according to the data below:
--| Field       | Observations                                          |
--|-------------|-------------------------------------------------------|
--| LoanId      | Integer, not null, foreign key to LOAN table          |
--| BookId      | Integer, not null and foreign key to BOOK table       |
--| Composite primary key with fields LoanId and BookId    |

CREATE TABLE loan_book (
	loan_id integer NOT NULL,
	book_id integer NOT NULL,
	CONSTRAINT pk_loan_book_loan_id_book_id PRIMARY KEY (loan_id, book_id)
);

--17. Insert the data below into the LOAN_BOOK table.
--| LoanId                    | BookId                                  |
--|---------------------------|-----------------------------------------|
--| Mario's first loan        | Database – 1st Edition                  |
--| Mario's second loan       | Aspect-Oriented Programming in Java     |
--| Mario's second loan       | Computer Programming in Java            |
--| João's loan               | Oracle Database 11G Administration      |
--| João's loan               | PHP for Professional Development        |
--| Paulo's loan              | HTML5 – Practical Guide                 |
--| Pedro's first loan        | Aspect-Oriented Programming in Java     |
--| Pedro's second loan       | XHTML: Reference Guide for Web Development |
--| Pedro's second loan       | Database – 1st Edition                  |
--| Pedro's third loan        | PHP with Object-Oriented Programming    |

INSERT INTO loan_book (loan_id, book_id)
VALUES
(1, 1),
(2, 4),
(2, 3),
(3, 2),
(4, 7),
(5, 5),
(6, 4),
(7, 6),
(7, 1),
(8, 8);

--18. Create the following indexes:
--| Table   | Field        |
--|---------|--------------|
--| Loan    | Loan_Date    |
--| Loan    | Return_Date  |

CREATE INDEX idx_loan_loan_date ON loan (loan_date);
CREATE INDEX idx_loan_return_date ON loan (return_date);

--SIMPLE QUERIES

--19. Names of authors in alphabetical order.
SELECT name FROM author ORDER BY name ASC;

--20. Names of students that start with the letter P.
SELECT name FROM student WHERE name LIKE 'P%';

--21. Names of books in the Database (1) or Java (3) category.
SELECT
	name,
FROM book WHERE category_id IN (1, 3);

--22. Names of books from the Bookman publisher.
SELECT
	name
FROM book WHERE publisher_id = 1;

--23. Loans made between 05/05/2012 and 10/05/2012.
SELECT * FROM loan WHERE loan_date BETWEEN '2012-05-05' AND '2012-05-10';

--24. Loans that were not made between 05/05/2012 and 10/05/2012.
SELECT * FROM loan WHERE loan_date NOT BETWEEN '2012-05-05' AND '2012-05-10';

--25. Loans where books have already been returned.
SELECT * FROM loan WHERE returned LIKE 'Y';

--SIMPLE AGGREGATION QUERIES

--26. Number of books.
SELECT count(book_id) FROM book;

--27. Sum of loan values.
SELECT sum(value) FROM loan;

--28. Average loan value.
SELECT avg(value) FROM loan;

--29. Maximum loan value.
SELECT max(value) FROM loan;

--30. Minimum loan value.
SELECT min(value) FROM loan;

--31. Sum of loan values that are between 05/05/2012 and 10/05/2012.
SELECT sum(value) FROM loan WHERE loan_date BETWEEN '2012-05-05' AND '2012-10-05';

--32. Number of loans that are between 01/05/2012 and 05/05/2012.
SELECT count(loan_id) FROM loan WHERE loan_date BETWEEN '2012-05-05' AND '2012-10-05';

--JOIN QUERIES

--33. Book name, category and publisher (BOOK) – create a view.
CREATE VIEW book_category_publisher as
SELECT
	bok.name AS name,
	cat.name AS category,
	pub.name AS publisher
FROM book bok
LEFT JOIN category cat ON cat.category_id = bok.category_id
LEFT JOIN publisher pub ON pub.publisher_id = bok.publisher_id;

SELECT * FROM book_category_publisher;

--34. Book name and author name (BOOK_AUTHOR) – create a view.
CREATE VIEW book_author_name as
SELECT
	bok.name AS book_name,
	aut.name AS author_name
FROM book_author bka
LEFT JOIN book bok ON bok.book_id = bka.book_id
LEFT JOIN author aut ON aut.author_id = bka.author_id;

SELECT * FROM book_author_name;

--35. Names of books by author Ian Graham (BOOK_AUTHOR).
CREATE VIEW book_author_ian_graham as
SELECT
	bok.name AS book_name,
	aut.name AS author_name
FROM book_author bka
INNER JOIN book bok ON bok.book_id = bka.book_id
INNER JOIN author aut ON aut.author_id = bka.author_id
AND bka.author_id = 8;

SELECT * FROM book_author_ian_graham;

--36. Student name, loan date and return date (LOAN).
SELECT
	stu.name AS student_name,
	loa.loan_date,
	loa.return_date
FROM loan loa
LEFT JOIN student stu ON stu.student_id = loa.student_id;

--37. Names of all books that were loaned (LOAN_BOOK).
SElECT
	bok.name AS book_name,
	lob.loan_id
FROM loan_book lob
LEFT JOIN book bok ON bok.book_id = lob.book_id;

--AGGREGATION + JOIN QUERIES
--
--38. Publisher name and number of books from each publisher (BOOK).
SELECT
	pub.name AS publisher_name,
	count(boo.book_id) AS number_book
FROM book boo
LEFT JOIN publisher pub ON pub.publisher_id = boo.publisher_id
GROUP BY pub.name;

--39. Category name and number of books in each category (BOOK).
SELECT 
	cat.name AS category_name,
	count(bok.category_id) AS count_category
FROM book bok
LEFT JOIN category cat ON cat.category_id = bok.category_id
GROUP BY cat.category_id;

--40. Author name and number of books by each author (BOOK_AUTHOR).
SELECT * FROM book_author;
SELECT * FROM book;

--41. Student name and number of loans per student (LOAN_BOOK).
SELECT * FROM student;
SELECT * FROM loan_book;
SELECT * FROM loan;

SELECT 
	std.name AS student_name,
	count(loa.loan_id) AS count_loan
FROM student std
LEFT JOIN loan loa ON std.student_id  = loa.student_id
GROUP BY std.name;

--42. Student name and sum of total loan value per student (LOAN).
SELECT
	std.name AS student,
	sum(loa.value) AS sum_value
FROM student std
LEFT JOIN loan loa ON loa.student_id = std.student_id 
GROUP BY std.name;

--43. Student name and sum of total loan value per student only for those where the sum is greater than 7.00 (LOAN).
--
--MISCELLANEOUS COMMAND QUERIES
--
--44. Names of all students in descending order and in uppercase.
--45. Loans that were made in month 04 of 2012.
--46. All loan fields. If already returned, show message "Return complete", otherwise "Overdue".
--47. Only characters 5 to 10 of author names.
--48. Loan value and only the month of the loan date. Write "January", "February", etc.
--
--SUBQUERIES
--
--49. Loan date and value of loans where value is greater than the average of all loans.
--50. Loan date and value of loans that have more than one book.
--51. Loan date and value of loans where value is less than the sum of all loans.
--
--
