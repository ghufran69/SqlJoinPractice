    

-- DAY 1
--part 1 ,task 1.1 Display all records from the Libraries table
SELECT * FROM librarys;

--task 1.2 Display all records from the Members table
SELECT * FROM members;

--task 1.3 Display all records from the Books table
SELECT * FROM book;

--part 2 ,task 2.1
--Retrieve all columns from Library table
select libraryName, libLocation from librarys;

--task 2.2
-- Retrieve library name and location only from the Libraries table
select bookTitle,bookGener,price from book

--task 2.3
--Display member full name and email from the Members table
select MfullName,MemberEmail from members

--taak 2.4
--Display staff ID, full name, and position from the Staff table
select staffID,staffFullName,staffPosition from staff

--part3 ,task 3.1 Retrieve all books where the genre is non-fiction
select *from book where bookGener='non-fiction';

--task 3.2 Retrieve all libraries located in Seeb
select*from librarys where libLocation='Seeb';

--task 3.3 Retrieve all books that are currently available
select *from book where bookIsAvaibale=1;

--task 3.4 Retrieve all staff members whose position is Assistant
select * from staff where staffPosition = 'Assistant'

--task 3.5 Retrieve all loans that have an overdue status
select *from loans where loanStatuse='overdue';

--part 4: Comparison Operators
--task 4.1 Retrieve all books with a price greater than 10
select *from book where (price>10.00);

--task 4.2 Retrieve all libraries established before the year 2015
select*from librarys where establisYear<2015;

--task 4.3 Retrieve all payments where the amount is greater than or equal to 2
select*from Payments where Amount>=2

--task 4.4 Retrieve all books with a price less than or equal to 15
select*from book where price <=15

--task 4.5 Retrieve all reviews where the rating is not equal to 5
select*from reviews where rating !=5

--Part 5: Logical Operators (AND, OR, NOT)
--task 5.1 Retrieve all books that are non-fiction and currently available
select *from book where bookGener='non-fiction' and bookIsAvaibale=1 ; 

--task 5.2 Retrieve all books that are either non-fiction or children genre
select *from book where bookGener='non-fiction' or bookGener= 'children';

--task 5.3 Retrieve all libraries established after 2010 and located in Nizwa
select*from librarys where establisYear>2010 and libLocation= 'Nizwa';

--task 5.4 Retrieve all books with a price between 10 and 30
select*from book where price >= 10 AND price <= 30;

--task 5.5 Retrieve all loans where the status is not returned
 select *from loans where loanStatuse  <> 'returned';

 --task 6.1 Retrieve all books ordered by title in ascending order (A-Z)
 select *from book order by bookTitle

 --task 6.2 Retrieve all books ordered by price in descending order
 select*from book order by price DESC ;
  
 --task 6.3 Retrieve all members ordered by membership start date (newest first)
 select*from members order by MembershipStartDate DESC;

 --task 6.4 Retrieve all libraries ordered by establishment year in ascending order
 select*from librarys order by establisYear ASC;

 --task 6.5 Retrieve all reviews ordered by rating (highest first) and then by review date (oldest first)
 select *from reviews order by rating DESC ,reviewDate ASC ;

 --part 7
 --task 7.1 Retrieve all unique book genres from the Book table
select distinct bookGener from book;

--task 7.2  Retrieve all unique library locations from the Library table
select distinct libLocation from librarys;

--task 7.3 Retrieve all unique staff positions from the Staff table
select distinct staffPosition from staff;

-- task 7.4 Retrieve all unique loan statuses from the Loans table
select distinct loanStatuse from loans;

--part 8
--task 8.1 Retrieve the top 5 most expensive books ordered by price (highest first)
select top 5 *from book order by price DESC;

--task 8.2 Retrieve the first 10 members who joined ordered by membership start date (earliest first)
select top 10 * from members order by MembershipStartDate ASC;

--Task 8.3 Retrieve the 3 oldest libraries ordered by establishment year (earliest first)
select top 3 *from librarys order by establisYear ASC;

-- Task 8.4: Retrieve the top 5 highest-rated reviews ordered by rating (highest first)
select top 5 * from reviews order by rating DESC;

--part 9 
--task 9.1 Retrieve all books whose title starts with 'P'
select *from book where bookTitle like 'P%'

--task 9.2 Retrieve all members whose email contains 'gmail.com'
select *from members where MemberEmail like '%gmail.com%'

--task 9.3 Retrieve all libraries whose name ends with 'Library'
select *from librarys where libraryName like '%library'

-- Task 9.4: Retrieve all books whose title contains the word 'Basics'
select * from book where bookTitle like '%Basics%';

-- task 9.5: Retrieve all staff members whose names start with 'A'
select *from staff where staffFullName like 'A%';

-- Part 10
-- Task 10.1: Retrieve all loans that have not been returned yet (returnDate is null)
select * from loans where returnDate is null;

-- task 10.2: retrieve all loans that have been returned (returndate is not null)
select * from loans where returndate is not null;

-- task 10.3: display reviews where comments is null or equals 'no comments'
select * from reviews where comments is null  or comments = 'no comments';


--part 11
--part 11.1 find all children books that are available and cost less than 25, ordered by price
select * from book where bookgener = 'children' and bookisavaibale = 1 and price < 25 order by price asc;

-- task 11.2 retrieve the top 5 most recent returned loans ordered by duedate descending
select top 5 * from loans where loanstatuse = 'returned' order by duedate desc;

-- task 11.3: show all libraries in new Seeb or Nizwa established after 2005 ordered by name
select * from librarys where (liblocation = 'Seeb' or liblocation = 'Nizwa') and establisyear > 2005 order by libraryname asc;

-- task 11.4 find books with fiction or children genre, price between 10 and 30, currently available
select * from book where (bookgener = 'reference' or bookgener = 'children') and price between 10 and 30 and bookisavaibale = 1;


-- task 11.5: display members who joined in 2023 or 2024, with gmail accounts, ordered by membership start date
select * from members where (year(membershipstartdate) = 2023 or year(membershipstartdate) = 2024) and memberemail 
like '%gmail.com%'
order by membershipstartdate asc;

--part 12
-- task 12.1: find the 10 most expensive available books in fiction or non-fiction genres
select top 10 * from book where (bookgener = 'fiction' or bookgener = 'non-fiction')
and bookisavaibale = 1 order by price desc;

-- task 12.2: find all loans issued in 2024 that are still returned ordered by loan date
select * from loans where year(loandate) = 2024 and returndate is not null order by loandate asc;

-- task 12.3: show staff working at libraries established before 2010 with position librarian or assistant

-- task 12.3: show staff working at libraries established before 2015 with position assistant or clerk
select * from staff s
join librarys l on s.libid = l.libraryid
where l.establisyear < 2015
and (s.staffposition = 'Assistant' or s.staffposition = 'Clerk');

-- task 12.4: display all books that have never been reviewed
select b.* from book b
left join reviewbook r on b.bookid = r.booknum
where r.booknum is null;


--Practice Tasks - INNER JOIN
--Part A
--task 2.1
--I already linked the relationship in one table

--task 2.2
select staffFullName,staffPosition,libLocation
from staff inner join librarys on libID=libraryID ;

--Task 2.3: Display all books with their library information.
--Columns needed: Book Title, Genre, Price, Library Name, Library Location

select bookTitle,bookGener,price,libraryName,libLocation 
from book inner join librarys on librID=libraryID;


--Task 2.4: Show all reviews with member names.
--Columns needed: Member FullName, Rating, Comments, ReviewDate
--I already linked the relationship in one table

--Task 2.5: Display all reviews with book titles.
--Columns needed: Book Title, Rating, Comments, ReviewDate
--I already linked the relationship in one table

--Task 2.6: Show all payments with loan information.
--Columns needed: LoanID, PaymentDate, Amount, PaymentMethod, Loan Status
select PaymentDate,Amount,Method,loanStatuse from Payments inner join loans on LoanDa=loanDate;

--Part B: Three-Table INNER JOINs

--Task 2.7: Show member names, book titles, and loan dates together.
--Columns needed: Member FullName, Book Title, LoanDate, DueDate, Status
--Hint: You need Member, Loan, and Book tables. Join Member to Loan, then Loan to Book

-- Goal: Show member names, book titles, and loan details.
-- In my database design, there is no direct relationship between members and loans.
-- Therefore, I used the Borrowings table as a junction table because:
-- personID links to members
-- Loandat links to loans
-- bookSSN links to book
-- I used INNER JOIN to return only the records that have matching data in all tables.

select MfullName,bookTitle,loanDate,DueDate,loanStatuse from members inner join Borrowings on memberId=personID
inner join loans on loanDate=Loandat
inner join book on bookID=bookSSN;


-- Task 2.8
-- In my database design, the required data (member, book, and review)
-- is already combined using the ReviewBook table.
-- This table links members, books, and reviews together,
-- so the relationship has already been implemented during database design.
-- Therefore, no additional restructuring was needed; only retrieval queries are required.

--Task 2.9: Show books with their library name and location.
--Columns needed: Book Title, Genre, Library Name, Library Location, Library ContactNumber

select bookTitle,bookGener,libraryName,libLocation,LibContactNum from book inner join Librarys on librID=libraryID

--Task 2.10: Display complete loan information: member name, book title, loan dates, and status.
--Columns needed: Member FullName, Email, Book Title, Genre, LoanDate, DueDate, ReturnDate, Status
-- Used Borrowings to link members, books, and loans using INNER JOIN.
select MfullName,MemberEmail,bookTitle,bookGener,loanDate,DueDate,returnDate,loanStatuse from Borrowings
inner join members on personID = memberID
inner join loans on Loandat = loanDate
inner join book on bookSSN = bookID;

--Practice Tasks - LEFT JOIN
--Task 3.1: Show ALL books and their reviews (if any). Books without reviews should still appear.
--Columns needed: Book Title, Genre, Rating, Comments
--Expected: All 18 books should appear, even if some have no reviews
--book-ReviewBook-reviewes
select bookTitle,bookGener,rating,comments from book left join ReviewBook on bookID=BookNum
left join reviews on feedbackDate=reviewDate

--Task 3.2: Display ALL members with their loan information (if they have any loans).
-- Columns needed: Member FullName, Email, LoanDate, DueDate, Status
--member-Borrowings-loans
-- Used left join to show all members and their loan information, using Borrowings to link members and loans.

select MfullName,MemberEmail,loanDate,DueDate,loanStatuse from members left join Borrowings on memberId=personID
left join loans on loanDate=Loandat

--Task 3.3: Show ALL loans with payment information (if any). Loans without payments should appear.
--Columns needed: LoanID, LoanDate, Status, PaymentDate, Amount
select loans.loanDate, loans.loanStatuse, Payments.PaymentDate, Payments.Amount
from loans LEFT JOIN Payments on loans.loanDate = Payments.LoanDa;

--Task 3.4: Display ALL libraries with their staff (if any).
--Columns needed: Library Name, Location, Staff FullName, Position

select libraryName,libLocation,staffFullName, staffPosition from librarys left join staff on librarys.libraryID=staff.libID

--Task 3.5: Find members who have NEVER borrowed a book (using LEFT JOIN with WHERE clause).
--Hint: Use LEFT JOIN, then add WHERE L.LoanID IS NULL
select members.MfullName, members.MemberEmail
from members left join Borrowings on members.memberID = Borrowings.personID
where Borrowings.personID is null;
-- No results appeared because all members have borrowing records in the current dataset.

-- I modified the database design by adding ReviewID as the primary key
-- and updated ReviewBook to reference ReviewID instead of reviewDate.
-- This makes the relationship more reliable and easier to join.

EXEC sp_help 'ReviewBook';
ALTER TABLE ReviewBook
DROP CONSTRAINT FK__ReviewBoo__feedb__4B7734FF;

EXEC sp_help 'reviews';
ALTER TABLE reviews
DROP CONSTRAINT PK__reviews__A951659B1FE56372;

ALTER TABLE reviews
ADD ReviewID INT IDENTITY(1,1) NOT NULL;
SELECT * FROM reviews;

ALTER TABLE reviews
ADD CONSTRAINT PK_reviews PRIMARY KEY (ReviewID);

ALTER TABLE ReviewBook
ADD ReviewID INT;

UPDATE ReviewBook
SET ReviewID = reviews.ReviewID
FROM ReviewBook
JOIN reviews ON ReviewBook.feedbackDate = reviews.reviewDate;

ALTER TABLE ReviewBook
ADD CONSTRAINT FK_ReviewBook_ReviewID
FOREIGN KEY (ReviewID) REFERENCES reviews(ReviewID);

ALTER TABLE ReviewBook
DROP COLUMN feedbackDate;

ALTER TABLE ReviewBook
DROP CONSTRAINT PK__ReviewBo__189E2AE233A1CAE0;

ALTER TABLE ReviewBook
ADD CONSTRAINT PK_ReviewBook
PRIMARY KEY (BookNum, personNum, ReviewID);

ALTER TABLE ReviewBook
ALTER COLUMN ReviewID INT NOT NULL;

ALTER TABLE ReviewBook
ADD CONSTRAINT PK_ReviewBook
PRIMARY KEY (BookNum, personNum, ReviewID);

ALTER TABLE ReviewBook
DROP COLUMN feedbackDate;












