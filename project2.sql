      

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

--Task 3.6: Find books that have NEVER been reviewed.
--Columns needed: Book Title, Genre, Price
--Hint: LEFT JOIN with WHERE R.ReviewID IS NULL

select bookTitle,bookGener,price from book left join ReviewBook on bookID=BookNum where ReviewBook.ReviewID is null


--Task 3.7: Show ALL books with member names who reviewed them (if reviewed).
--Columns needed: Book Title, Member FullName, Rating, Comments
--Challenge: This needs a three-table join: Book LEFT JOIN Review LEFT JOIN Member

select bookTitle,MfullName,rating,comments from book left join ReviewBook on bookID=BookNum
left join reviews on ReviewBook.ReviewID=reviews.ReviewID 
left join members on ReviewBook.personNum = members.memberID;

--Practice Tasks - RIGHT JOIN

--Task 4.1: Rewrite Task 3.1 using RIGHT JOIN instead of LEFT JOIN.
--Original (LEFT JOIN): Book LEFT JOIN Review
--Rewrite (RIGHT JOIN): Review RIGHT JOIN Book
select book.bookTitle, book.bookGener, reviews.rating, reviews.comments FROM reviews
right join ReviewBook on reviews.ReviewID = ReviewBook.ReviewID
right join book on ReviewBook.BookNum = book.bookID;

--Task 4.2: Show ALL members with their loans using RIGHT JOIN.
--Hint: FROM Loan L RIGHT JOIN Member M

--Task 4.3: Display ALL books using RIGHT JOIN with Library table.
--Columns needed: Library Name, Book Title, Genre
select libraryName,bookTitle,bookGener from librarys right join book on libraryID=librID

--Task 4.4: Compare the results: Write the same query using both LEFT JOIN and RIGHT JOIN.
--Goal: Show all staff with library names
--left join
select staff.staffFullName, staff.staffPosition, librarys.libraryName from staff
left join librarys on staff.libID = librarys.libraryID;
--right join
select staff.staffFullName, staff.staffPosition, librarys.libraryName from librarys
right join staff on staff.libID = librarys.libraryID;

--Session 5: FULL OUTER JOIN
--Task 5.1: Show ALL books and ALL reviews (whether matched or not).
--Columns needed: Book Title, Rating, Comments
select bookTitle,rating,comments from book full outer join ReviewBook on bookID=BookNum 
full outer join reviews on reviews.ReviewID=ReviewBook.ReviewID

--task 5.3 Show complete data: ALL members and ALL books (through loans).
--Challenge: This requires multiple FULL OUTER JOINs
select members.MfullName,
       book.bookTitle,
       loans.loanDate,
       loans.DueDate,
       loans.loanStatuse
from members
full outer join Borrowings
on members.memberID = Borrowings.personID
full outer join loans
on Borrowings.Loandat = loans.loanDate
full outer join book
on Borrowings.bookSSN = book.bookID;

--Session 6: Combining Multiple JOIN Types
--task 6.1: Show all ACTIVE loans (INNER JOIN) with member info and payment info (LEFT JOIN for payments).
--Columns: Member FullName, LoanDate, DueDate, Status, PaymentDate, Amount
--Logic: INNER JOIN Member (only show actual loans), LEFT JOIN Payment (show payment if exists)
select members.MfullName,
       loanDate,DueDate,loanStatuse,
       PaymentDate,Amount
from loans inner join Borrowings on loans.loanDate = Borrowings.Loandat
inner join members on Borrowings.personID = members.memberID
left join Payments on loans.loanDate = Payments.LoanDa;
-- Used inner join to get actual loans with members,
-- and left join to include payment information if available.

--Task 6.2: Display all books (INNER JOIN Library) and their reviews (LEFT JOIN Review).
--Columns: Library Name, Book Title, Genre, Rating, Comments
select librarys.libraryName,book.bookTitle,  book.bookGener,reviews.rating, reviews.comments 
from book inner join librarys on book.librID = librarys.libraryID
left join ReviewBook on book.bookID = ReviewBook.BookNum
left join reviews on ReviewBook.ReviewID = reviews.ReviewID;

--task 6.3
select members.MfullName, book.bookTitle,librarys.libraryName,loans.loanDate, loans.returnDate
from members
inner join Borrowings on members.memberID = Borrowings.personID
inner join loans on Borrowings.Loandat = loans.loanDate
inner join book on Borrowings.bookSSN = book.bookID
inner join librarys on book.librID = librarys.libraryID;

part 7:
--Session 7: Real-World Challenge Queries
--These challenges combine everything you've learned. Read each requirement
--carefully and determine which JOIN type(s) to use.
--Challenge 7.1: Library Performance Report
--Create a report showing: Library Name, Total Books, Total Staff, Total Loans
--Hint: You'll need to JOIN multiple tables and use COUNT
 --library--book--staff--loans
 select libraryName ,
 COUNT(distinct book.bookID) as totalbook,
 COUNT(distinct staff.staffID) as totalStaff,
 COUNT(distinct loans.loanDate) as totalLoans
 from librarys 
 left join book on librarys.libraryID=book.librID
 left join staff on librarys.libraryID=staff.libID
 left join Borrowings on book.bookID = Borrowings.bookSSN
 left join loans on Borrowings.Loandat = loans.loanDate
 group by librarys.libraryName;
 -- Used LEFT JOIN and COUNT to generate a library performance report
-- showing total books, staff, and loans per library.

 --Challenge 7.2: Member Activity Summary
--Show ALL members with: FullName, Email, Total Loans, Total Reviews Written
--Hint: LEFT JOIN to include members with zero loans/reviews
select MfullName,MemberEmail ,
count(distinct loans.loanDate) as totalLoans,
count(distinct reviews.ReviewID) as totalReview 
from members left join Borrowings on members.memberId=Borrowings.personID

left join  loans on Borrowings.Loandat=loans.loanDate
left join ReviewBook on ReviewBook.personNum=members.memberId
left join reviews on ReviewBook.ReviewID=reviews.ReviewID
group by members.MfullName,members.MemberEmail 
-- Used LEFT JOIN and COUNT to show all members with total loans and total reviews.

--Challenge 7.3: Book Popularity Analysis
--Display: Book Title, Library Name, Times Borrowed, Average Rating, Total Reviews
--Hint: Need Book, Library, Loan (count), Review (avg and count)
select book.bookTitle,
librarys.libraryName,
COUNT(DISTINCT Borrowings.Loandat) as TimesBorrowed,
AVG(reviews.rating) as AverageRating,
COUNT(DISTINCT reviews.ReviewID) as TotalReviews
from book
left join librarys on book.librID = librarys.libraryID
left join Borrowings on book.bookID = Borrowings.bookSSN
left join ReviewBook on book.bookID = ReviewBook.BookNum
left join reviews on ReviewBook.ReviewID = reviews.ReviewID
group by book.bookTitle, librarys.libraryName;

--Challenge 7.4: Overdue Books Report
--Show all overdue loans with: Member Name, Email, Book Title, Library Name, Days Overdue, Fine Paid (if any)
---- For testing the overdue report, I updated one loan status to 'overdue'
-- so the query would return results and verify the report logic.
update loans
set loanStatuse = 'overdue'
where loanDate = '2024-02-01';
SELECT members.MfullName,
members.MemberEmail,
book.bookTitle,
librarys.libraryName,
DATEDIFF(day, loans.DueDate, GETDATE()) AS DaysOverdue,
Payments.Amount AS FinePaid
FROM loans
INNER JOIN Borrowings ON loans.loanDate = Borrowings.Loandat
INNER JOIN members ON Borrowings.personID = members.memberID
INNER JOIN book ON Borrowings.bookSSN = book.bookID
INNER JOIN librarys ON book.librID = librarys.libraryID
LEFT JOIN Payments ON loans.loanDate = Payments.LoanDa
WHERE loans.loanStatuse = 'overdue';

-- used inner join to get overdue loans and left join to include payment information if available

--Challenge 7.5: Complete Member Loan History
--Create a detailed view: Member Name, Book Title, Genre, Library Location, Loan Date,
--Return Date, Days Borrowed, Rating Given (if reviewed)
--Challenge: This requires joining 5+ tables with mixed JOIN types!
SELECT members.MfullName, book.bookTitle,book.bookGener,librarys.libLocation,loans.loanDate,loans.returnDate,
DATEDIFF(day, loans.loanDate, loans.returnDate) AS DaysBorrowed,
reviews.rating
FROM members
INNER JOIN Borrowings ON members.memberID = Borrowings.personID
INNER JOIN loans ON Borrowings.Loandat = loans.loanDate
INNER JOIN book ON Borrowings.bookSSN = book.bookID
INNER JOIN librarys ON book.librID = librarys.libraryID
LEFT JOIN ReviewBook ON book.bookID = ReviewBook.BookNum
LEFT JOIN reviews ON ReviewBook.ReviewID = reviews.ReviewID;

--Challenge 7.6: Books Never Borrowed
--Find books that exist but have NEVER been borrowed. Show: Book Title, Genre, Price,
--Library Name
--Hint: Book LEFT JOIN Loan WHERE LoanID IS NULL

-- Added a new book without a borrowing record to test the query
-- for books that have never been borrowed.

INSERT INTO book (bookISBN, bookTitle, bookGener, bookShelfLocation, price, librID, memID)
VALUES ('9781111111199','Test Book Never Borrowed','fiction','Z1',4.500,1,NULL);

select bookID,bookTitle,bookGener,price,libraryName from book
left join Borrowings on Borrowings.bookSSN =book.bookID 
left join librarys on book.librID=librarys.libraryID where Borrowings.bookSSN is null

--Challenge 7.7: Members With No Activity
--Find members who have NEVER borrowed a book AND NEVER written a review.
--Hint: Need two LEFT JOINs with WHERE both are NULL
--add member
INSERT INTO members (MfullName, MemberEmail, MemberPhonNum, MembershipStartDate)
VALUES ('Test Member 2','test2@gmail.com','90000001','2024-02-01');

 select memberId,MemberEmail from members 
 left join Borrowings on members.memberId=Borrowings.personID  
 left join ReviewBook on ReviewBook.personNum=members.memberId where Borrowings.personID is null and ReviewBook.personNum is null

 --Challenge 7.8: Staff Workload Analysis
--Show: Staff Name, Position, Library Name, Number of Books in Library, Number of Active Loans
--Complex: Requires grouping and counting across multiple joins
select staff.staffFullName,staff.staffPosition,librarys.libraryName,

count(DISTINCT book.bookID)as NumbersOfBook,
count(DISTINCT loans.loanDate )as ActiveLoans
from staff
left join librarys on staff.libID=librarys.libraryID 
left join book on librarys.libraryID =book.librID
left join Borrowings on Borrowings.bookSSN=book.bookID
left join loans on loans.loanDate= Borrowings.Loandat and loans.loanStatuse='issued'
group by staff.staffFullName,staff.staffPosition,librarys.libraryName



--SQL Aggregation Functions, GROUP BY & HAVING

--Task 1.1: Count the total number of books in the Book table.
select count(*) as tatalNoBook from book

--Task 1.2: Count how many members are registered in the system.
--Table: Member
select count(*) as TotalMembers from members;

--Task 1.3: Find the total sum of all book prices combined.
--Column to sum: Price in the Book table
--Function to use: SUM
select sum(price) as totalSumPrice from book

--Task 1.4: Calculate the average price of all books.
--Function to use: AVG
select avg(Price) as AvgBookPrice from Book;

--Task 1.5: Find the cheapest book price AND the most expensive book price — both in the same single query.
--Functions to use: MIN and MAX together
--Expected result: 1 row — two columns side by side
--Hint: You can write multiple aggregation functions in one SELECT: SELECT MIN(col) AS ..., MAX(col) AS
select min(Price) as CheapestPrice, max(Price) as MostExpensivePrice from Book;


--Task 1.6: Count how many loans currently have Status = 'Overdue'.
--Hint: Add a WHERE clause to filter only the rows where Status = 'Overdue', then count them
select count(*)as OverdueLoans from loans where loanStatuse='Overdue'

--Task 1.7: Find the highest rating ever given in the Review table.
--Column to use: Rating
select max(rating) as HighestRating from reviews

--Task 1.8: Find the lowest rating ever given in the Review table
select min(rating) as lowestRating from reviews

--Task 1.9: Calculate the total amount of all fines collected — the sum of every payment ever made.
--Table: Payment
--Column: Amount
select sum(Amount) as TotalAmount from Payments

--Task 1.10: Count how many loans have already been returned (meaning ReturnDate is NOT NULL).
--Key concept: COUNT(column) skips NULL values. If you write COUNT(ReturnDate), rows
--where ReturnDate is NULL will not be counted
select count(returnDate) as ReturnedLoans from loans

--Section 2 — GROUP BY
--Task 2.1: Count how many books belong to each Genre.
--Expected result: Four rows — one for Fiction, Non-fiction, Reference, Children \Columns in SELECT: Genre and COUNT(*)
select bookGener ,count(*) as BookCount from book
group by bookGener

--Task 2.2: Count how many staff members work in each Library. Group by LibraryID.
--Table: Staff
select libID ,count(*)as staffCount from staff
group by libID

--Task 2.3: Count how many loans exist for each loan Status (Issued, Returned, Overdue).
select loanStatuse, count(*) as loanCount from loans
group by loanStatuse

--Task 2.4: Calculate the average book price for each Genre.
--Function to use: AVG(Price)
select bookGener ,avg(price) as AvgBookPrice from book
group by bookGener

--Task 2.5: Find the total price (SUM) of all books in each Genre.
select bookGener , sum(price) as totalPrice from book 
group by bookGener 

--Task 2.6: Find the most expensive book price (MAX) within each Genre.
select bookGener, max(price) as MaxPrice from book
group by bookGener

--Task 2.7: Count how many reviews each rating value has received.
--Table: Review
--Group by: Rating
--Expected result: One row per rating value (1, 2, 3, 4, 5) — showing how many times each was given
select rating, count(*) as reviewCount  from reviews 
group by rating

--Task 2.8: Count how many books each Library owns. Group by LibraryID.
--Table: Book
select librID, count(*) as totalBook from book group by librID 

--Task 2.9: Count how many loans each Member has made. Group by MemberID.
--Table: Loan
select personID, count(*) as LoanCount
from Borrowings
group by personID;


--Task 2.10: Find the cheapest book (MIN Price) in each Genre
select bookGener, min(Price) as MinPrice from book
group by bookGener;

--Part 2-B — GROUP BY with ORDER BY
--Task 2.11: Count books per Genre, ordered from the genre with the most books down to the fewest.
--Hint: Add ORDER BY after GROUP BY and reference your alias
select bookGener,count(*) as bookCount from book 
group by bookGener 
order by bookCount desc;

--Task 2.12: Show the average price per Genre, ordered from cheapest average to most expensive
select bookGener,avg(price) as AVGPrice from book 
group by bookGener 
order by AVGPrice asc

--Task 2.13: Count loans per Status and order the results alphabetically by Status name
select loanStatuse, count(*) as LoanCount from loans 
group by loanStatuse 
order by loanStatuse  asc

--Task 2.14: Show the total payment amount collected per PaymentMethod, ordered from the highest total to the lowest.
select Method,sum(Amount)as totalPayment from Payments 
group by Method  
order by totalPayment desc

--Task 2.15: Count how many reviews each book has received (group by BookID),
--ordered so the most-reviewed book appears first.
--Table: Review
select BookNum,count(*) as ReviewCount from ReviewBook
group by BookNum 
order by ReviewCount desc


--Section 3 — HAVING
--Part 3-A — Simple HAVING Tasks
--Task 3.1: Show only the genres that have MORE THAN 3 books.
--Hint: GROUP BY Genre, then HAVING COUNT(*) > 3
select bookGener ,count(*) as bookCount from book group by bookGener
having count(*)>3

--Task 3.2: Show only the libraries that have AT LEAST 1 staff members.
--Table: Staff — group by LibraryID
select libID,count(*) as staffcount from staff group by libID
having count(*)>=1

--Task 3.3: Show only the members (by MemberID) who have borrowed MORE THAN 0 book.
--Table: Loan — group by MemberID
select personID,count(*) as borrowcount from Borrowings group by personID
having count(*)>0

--Task 3.4: Show only the genres where the average book price is MORE THAN 30.
--Hint: HAVING AVG(Price) > 10
select bookGener,count(*) as AvgPrice from book group by bookGener 
having Avg(price)>10

--Task 3.5: Find books (by BookID) that have received AT LEAST 1 reviews.
--Table: Review — group by BookID
select BookNum, count(*) as ReviewCount from ReviewBook
group by BookNum
having count(*) >= 1;

--Task 3.6: Show genres where the total sum of all book prices is MORE THAN 50.
--Hint: HAVING SUM(Price) > 50
select bookGener,sum(price) as totalPrice from book group by bookGener having sum(price)>50

--Task 3.7: Find payment methods where the total collected amount is MORE THAN 5.
--Table: Payment — group by PaymentMethod
select Method, sum(Amount) as TotalAmount from Payments group by Method
having sum(Amount) > 5;

--Task 3.8: Show loan statuses that appear MORE THAN 3 times in the Loan table
select loanStatuse, count(*) as LoanCount from loans group by loanStatuse
having count(*) > 3;

--Task 3.9: Show members (by MemberID) who have written AT LEAST 1 reviews.
--Table: Review — group by MemberID
select personNum, count(*) as ReviewCount from ReviewBook group by personNum
having count(*) >= 1;

--Task 3.10: Find libraries (by LibraryID) that own MORE THAN 1 books.
select librID, count(*) as BookCount from book group by librID having count(*) > 1;

--Part 3-B — WHERE and HAVING Together
--Task 3.11: Count available books per genre (available means IsAvailable = 1). Show
--only genres that have more than 1 available book.
--Structure: WHERE filters rows → GROUP BY groups → HAVING filters groups
  select bookGener,count(*) as AvailablebookCount from book where bookIsAvaibale =1
  group by bookGener
  having count(*)>1

  --Task 3.12: Among Fiction and Children books only, show genres where the average price is above 15.
--Hint: Use WHERE Genre IN ('Fiction', 'Children') then GROUP BY then HAVING AVG(Price) > 5
select bookGener,avg(price) as avgPrice from book where  bookGener in ('fiction','children')
group by bookGener 
having  avg(price)>5

--Task 3.13: Among Overdue and Issued loans only, count per member and show members with 1 active loan.
--Hint: WHERE Status IN ('Overdue', 'Issued')
select B.personID, count(*) as ActiveLoans from Borrowings B
join loans L on B.Loandat = L.loanDate where L.loanStatuse in ('overdue','issued')
group by B.personID
having count(*) = 1;
-- Count active loans (overdue or issued) per member
-- using join between Borrowings and loans,
-- showing only members with more than one active loan.

--Task 3.14: Look only at reviews with Rating >= 3. Group by book and show books that
--have at least 1 good reviews
select RB.BookNum, count(*) as GoodReviews from ReviewBook RB
join reviews R on RB.ReviewID = R.ReviewID where R.rating >= 3
group by RB.BookNum
having count(*) >= 1;

--Task 3.15: Find genres that have more than 1 book priced below 20.
--Hint: WHERE Price < 20 first, then group, then HAVING
select bookGener, count(*) as CheapBooks from book where price < 20
group by bookGener
having count(*) > 1;


--Section 4 — Aggregation with JOIN
--ask 4.1: Show each library name alongside the number of books it owns.
--Tables needed: Library and Book
--Join condition: Library.LibraryID = Book.LibraryID
--Hint: JOIN first, then GROUP BY LIB.LibraryID, LIB.Name, then COUNT(B.BookID)
select L.libraryName, count(*) as BookCount from librarys L
join book B on L.libraryID = B.librID
group by L.libraryID, L.libraryName;

--Task 4.2: Show each member's full name alongside their total number of loans.
--Tables needed: Member and Loan
--Join condition: Member.MemberID = Loan.MemberID
select M.MfullName, count(*) as LoanCount
from members M
join Borrowings B on M.memberId = B.personID
group by M.memberId, M.MfullName;

--Show each book's title alongside the number of times it has been borrowed.
Tables needed: Book and Loan
--Join condition: Book.BookID = Loan.BookID
select B.bookTitle, count(*) as BorrowCount from book B
join Borrowings BR on B.bookID = BR.bookSSN
group by B.bookID, B.bookTitle;

--Show each book's title alongside its average review rating.
Tables needed: Book and Review
--Function: AVG(R.Rating)
--Hint: Cast the rating for a cleaner decimal: AVG(CAST(R.Rating AS DECIMAL(3,2)))
select B.bookTitle, avg(R.rating) as AvgRating from book B
join ReviewBook RB on B.bookID = RB.BookNum
join reviews R on RB.ReviewID = R.ReviewID
group by B.bookID, B.bookTitle;

--Task 4.5: Show each library name alongside the total value (SUM of Price) of all the books it owns.
--Tables needed: Library and Book
select L.libraryName, sum(B.price) as TotalValue from librarys L
join book B on L.libraryID = B.librID
group by L.libraryID, L.libraryName;

--Task 4.6: Show each library name alongside the number of staff who work there.
--Tables needed: Library and Staff
select L.libraryName, count(*) as StaffCount from librarys L
join staff S on L.libraryID = S.libID
group by L.libraryID, L.libraryName;

--Task 4.7: Show each member's full name alongside the total fine amount they have paid.
--Tables needed: Member, Loan, and Payment — three tables
--Hint: JOIN Member to Loan, then JOIN Loan to Payment, then GROUP BY member, then SUM(P.Amount)
select M.MfullName, sum(P.Amount) as TotalFines
from members M join Borrowings B on M.memberId = B.personID
join loans L on B.Loandat = L.loanDate
join Payments P on L.loanDate = P.LoanDa
group by M.memberId, M.MfullName;

--Task 4.8: Show each genre and the number of DISTINCT members who have borrowed books in that genre.
--Tables needed: Book and Loan
--Hint: COUNT(DISTINCT L.MemberID) — this avoids counting the same member twice if they borrowed multiple books in the same genre

select B.bookGener, count(distinct BR.personID) as MemberCount from book B
join Borrowings BR on B.bookID = BR.bookSSN
group by B.bookGener;

--Task 4.9: Show each book's title, how many times it was borrowed, and its average rating — all in one query.
--Tables needed: Book, Loan, and Review
--Hint: Use LEFT JOIN so that books with no loans and books with no reviews still appear in the result
--Two aggregations: COUNT(DISTINCT L.LoanID) for borrows, AVG(CAST(R.Rating AS DECIMAL(3,2))) for rating
select B.bookTitle,
count(distinct BR.Loandat) as BorrowCount,
avg(R.rating) as AvgRating
from book B
left join Borrowings BR on B.bookID = BR.bookSSN
left join ReviewBook RB on B.bookID = RB.BookNum
left join reviews R on RB.ReviewID = R.ReviewID
group by B.bookID, B.bookTitle;

--Task 4.10: Show each genre with three pieces of information: total number of books, number of available books, and average price.
--Table: Book only — no JOIN needed for this one
--Hint for available count: Use a CASE expression inside SUM: SUM(CASE WHEN IsAvailable = 1 THEN 1 ELSE 0 END)
--book.Tbookid,book is available,
select bookGener,count(*) as totalBook ,
sum(case when bookIsAvaibale = 1 then 1 else 0 end ) as AvailableBooks,
avg(price) as AvgPrice
from book
group by bookGener

--Task 4.11: Show only the library names that own MORE THAN 1 books.
--Tables: Library and Book
select libraryName, count(*) as BookCount
from librarys
join book  on libraryID = librID
group by libraryID, libraryName
having count(*) > 1;

--Task 4.12: Show only the members' full names who have borrowed MORE THAN 0 book.
--Tables: Member and Loan
select MfullName, count(*) as BorrowCount
from members 
join Borrowings on memberId = personID
group by memberId, MfullName
having count(*) > 0;

--Task 4.13: Show only the book titles that have an average rating ABOVE 4.
--Tables: Book and Review
select bookTitle,avg(rating) as avgRating 
from book 
join ReviewBook on ReviewBook.BookNum=book.bookID
join reviews on ReviewBook.ReviewID=reviews.ReviewID
group by bookTitle,
having avg(rating)>4

--Task 4.14: Show only the genres where more than 3 loans have been made in total.
--Tables: Book and Loan
select bookGener,count(*) as TotalLoans from book
join Borrowings on Borrowings.bookSSN=book.bookID
group by bookGener
having count(*)>3

--Task 4.15: Show only the libraries where the total fines collected from their books are MORE THAN 1.500.
--Tables: Library, Book, Loan, and Payment — four tables
--Hint: Join all four in a chain: Library → Book → Loan → Payment

select libraryID ,sum(Amount) as totalFine 
from librarys 
join  book on book.librID=librarys.libraryID
join Borrowings on Borrowings.bookSSN=book.bookID
join loans on loans.loanDate=Borrowings.Loandat
join Payments on Payments.LoanDa=loans.loanDate
group by libraryID
having sum(Amount)>1.500


--Section 5 — Putting It All Together
--Task 5.1: Count available books (WHERE IsAvailable = 1) per genre. Show only
--genres with more than 1 available book. Order the results from most available books to fewest.
--Clauses needed: FROM → WHERE → GROUP BY → HAVING → ORDER BY

select bookGener, count(*) as AvailableCount from book
where bookIsAvaibale=1
group by bookGener having count(*)>1 
order by AvailableCount desc


--Task 5.2: For each library, show the library name and the total number of loans ever
--made from its books. Show only libraries that have had more than 1 loans. Order by loan count from highest to lowest.
--Tables: Library, Book, Loan
--Clauses needed: FROM → JOIN → JOIN → GROUP BY → HAVING → ORDER BY
select libraryName , count(*) as LoanCount from librarys
join book on librarys.libraryID=book.librID
join Borrowings on Borrowings.bookSSN=book.bookID
join loans on loans.loanDate=Borrowings.Loandat
group by libraryName having count(*)>0
order by LoanCount desc

--Task 5.3: Show each member's name and how many overdue loans they have (Status = 'Overdue').
--Show only members who have at least 1 overdue loan. Order alphabetically by name.
--Tables: Member and Loan
--Hint: WHERE filters to Overdue rows first, then you group and count
--member-borrowing-loans
select MfullName, count(*) as loansCount from members 
join Borrowings on members.memberId=Borrowings.personID
join loans on Borrowings.Loandat=loans.loanDate
where loanStatuse ='Overdue'
group by MfullName
having count(*)>=1
order by MfullName asc

--Task 5.4: For each book, show the title, total number of borrows, and average review
--rating. Show only books that have been borrowed at least once AND have an average
--rating above 3. Order by average rating from highest to lowest.
--Tables: Book, Loan, Review
--Hint: Use LEFT JOIN so books with no reviews still appear — then HAVING filters them out
--Two conditions in HAVING: HAVING COUNT(...) >= 0 AND AVG(...) > 3
select bookID ,bookTitle ,count(distinct Loandat) as borrowCount ,
avg(rating) as avgReviews 
from book 
join Borrowings on book.bookID=Borrowings.bookSSN
join ReviewBook on book.bookID=ReviewBook.BookNum
join reviews on ReviewBook.ReviewID=reviews.ReviewID
group by bookID ,bookTitle
having count(distinct Loandat) >0 and avg(rating)>3
order by avgReviews desc

--Task 5.5: For each genre, show the total number of books, the average price, and the
--cheapest price. Show only genres where the average price is between 15 and 50. Order
--by average price from lowest to highest.
--Hint: HAVING AVG(Price) BETWEEN 15 AND 50
select bookID,bookGener, count(*) as bookCount ,
avg(price) as AvgPrice ,
min(price) as minPrice from book
group by bookID,bookGener 
having avg(price) between 15 and 50
order by AvgPrice asc


--Task 5.6 — Challenge: Build a complete library summary report. For each library
--show: library name, city (Location), total number of books, total number of staff, total
--number of loans ever made, and total fines collected. Show only libraries that have had
--at least one loan. Order by total loans from highest to lowest.
--Tables needed: Library, Book, Staff, Loan, Payment — five tables
--Hint: Use LEFT JOIN for all joins so libraries with missing data still appear
--Hint: Use COUNT(DISTINCT ...) for books, staff, and loans to avoid inflated counts from multiple joins
--Note: This is the hardest query in the workbook — think through each join carefully before writing
select libraryName ,libLocation,
count(distinct bookID) as totalbook ,
count(distinct staffID) as totalstaff,
count(distinct loanDate) as totalloans ,
sum(Amount) as totalAmount
from librarys
left join book on librID=librarys.libraryID
left join Borrowings on book.bookID=Borrowings.bookSSN
left join staff on librarys.libraryID =staff.libID
left join Payments on Payments.LoanDa=Borrowings.Loandat
left join loans on loans.DueDate=Borrowings.Loandat
group by libraryName ,libLocation
having count(loanDate)<=1
order by totalloans desc




















