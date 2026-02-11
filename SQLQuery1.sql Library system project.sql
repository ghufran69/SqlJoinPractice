create database librarySystem
use librarySystem

create table librarys (
libraryID int primary key identity(1,1),
libraryName varchar(50) not null,
libLocation varchar(50) not null,
LibContactNum varchar(20) not null,
establisYear int 
);

create table members(
memberId int primary key identity(1,1),
MfullName varchar(50),
MemberEmail varchar(50) unique not null,
MemberPhonNum varchar(50),
MembershipStartDate Date not null
)

create table staff(
staffID int primary key identity(1,1),
staffFullName varchar(50),
staffPosition varchar(50),
staffContactNum varchar(50),
libID int,
)
alter table staff
add CONSTRAINT FK_staff_library
foreign key(libID) references librarys(libraryID)
ON DELETE CASCADE
ON UPDATE CASCADE;


create table book(
bookID int primary key identity(1,1),
bookISBN varchar(100) unique not null,
bookTitle varchar(100) not null,
bookGener varchar(100) not null ,
check(bookGener in ( 'fiction','non-fiction', 'reference','children')),
bookShelfLocation varchar(100) not null,
bookIsAvaibale bit DEFAULT 1 ,
price decimal(7,3)  check(price>0),
memID int,
librID int,
foreign key(librID) references librarys(libraryID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

alter table book
ADD CONSTRAINT FK_book_members
FOREIGN KEY (memID) references members(memberID)
ON DELETE CASCADE
ON UPDATE CASCADE;


create table loans(
loanDate Date primary key not null,
DueDate Date not null,
returnDate Date not null,
loanStatuse varchar(25) DEFAULT 'issued'  not null,
check (loanStatuse in('issued','returned','overdue')),
 check (returnDate >= loanDate)
 );

 create table Payments(
 PaymentDate Date not null,
 Amount decimal(7,3) check(Amount >0) not null,
 Method varchar(30),
 LoanDa Date not null ,
 primary key (LoanDa, PaymentDate),
 foreign key(LoanDa) references loans(loanDate)
 on DELETE CASCADE
 on UPDATE CASCADE
 );

 create table reviews(
 reviewDate DATE primary key,
 rating int not null,
 comments varchar(300) DEFAULT 'no comments',

 check (rating between 1 and 5)
)

create table Borrowings(
bookSSN int not null,
personID int not null,
Loandat Date not null,
primary key(bookSSN,personID,Loandat),
foreign key(bookSSN) references book(bookID)
ON DELETE CASCADE
ON UPDATE CASCADE,
foreign key(personID) references members(memberId),
foreign key (Loandat)references loans(loanDate)

)

create table ReviewBook(
BookNum int ,
personNum int ,
feedbackDate date,
primary key (BookNum,personNum,feedbackDate),
foreign key(BookNum)references book(bookID),
foreign key(personNum)references members(memberId),
foreign key(feedbackDate)references reviews(reviewDate)
ON DELETE CASCADE
ON UPDATE CASCADE,
);

insert into librarys (libraryName, libLocation, LibContactNum, establisYear)
VALUES
('Muscat Library','Seeb','22334411',2010),
('Nizwa Library','Nizwa','22334412',2012),
('Sohar Library','Sohar','22334413',2015),
('Salalah Library','Salalah','22334414',2011),
('Sur Library','Sur','22334415',2014),
('Barka Library','Barka','22334416',2016),
('Ibri Library','Ibri','22334417',2013),
('Rustaq Library','Rustaq','22334418',2017),
('Khasab Library','Khasab','22334419',2018),
('Ibra Library','Ibra','22334420',2019);


insert into members (MfullName, MemberEmail, MemberPhonNum, MembershipStartDate)
values
('Ahmed Ali','ahmed1@gmail.com','91234561','2024-01-01'),
('Sara Said','sara2@gmail.com','91234562','2024-01-02'),
('Salim Mohammed','salim3@gmail.com','91234563','2024-01-03'),
('Fatma Khalid','fatma4@gmail.com','91234564','2024-01-04'),
('Hamad Rashid','hamad5@gmail.com','91234565','2024-01-05'),
('Noor Ahmed','noor6@gmail.com','91234566','2024-01-06'),
('Ali Hassan','ali7@gmail.com','91234567','2024-01-07'),
('Mona Saleh','mona8@gmail.com','91234568','2024-01-08'),
('Yousef Omar','yousef9@gmail.com','91234569','2024-01-09'),
('Laila Nasser','laila10@gmail.com','91234570','2024-01-10');

insert into staff (staffFullName, staffPosition, staffContactNum, libID)
values
('Ali Said','Manager','90011111',1),
('Hamad Ali','Assistant','90011112',2),
('Fatma Noor','Clerk','90011113',3),
('Sara Khalid','Assistant','90011114',4),
('Salim Ahmed','Manager','90011115',5),
('Mona Saleh','Clerk','90011116',6),
('Noor Hassan','Assistant','90011117',7),
('Yousef Ali','Manager','90011118',8),
('Ahmed Rashid','Clerk','90011119',9),
('Laila Omar','Assistant','90011120',10);

insert into book (bookISBN, bookTitle, bookGener, bookShelfLocation, price, librID, memID)
VALUES
('9781111111111','Database Systems','reference','A1',10.500,1,1),
('9781111111112','Networking Basics','non-fiction','A2',12.000,2,2),
('9781111111113','English Grammar','children','A3',8.500,3,3),
('9781111111114','Programming C++','reference','A4',15.000,4,4),
('9781111111115','Math Basics','children','A5',7.500,5,5),
('9781111111116','History of Oman','non-fiction','A6',9.000,6,6),
('9781111111117','Science World','reference','A7',11.200,7,7),
('9781111111118','Physics Intro','reference','A8',13.000,8,8),
('9781111111119','Chemistry Guide','reference','A9',14.000,9,9),
('9781111111120','Geography Basics','children','A10',6.800,10,10);

insert loans (loanDate, DueDate, returnDate, loanStatuse)
values
('2024-02-01','2024-02-10','2024-02-08','returned'),
('2024-02-02','2024-02-11','2024-02-09','returned'),
('2024-02-03','2024-02-12','2024-02-11','returned'),
('2024-02-04','2024-02-13','2024-02-12','returned'),
('2024-02-05','2024-02-14','2024-02-13','returned'),
('2024-02-06','2024-02-15','2024-02-14','returned'),
('2024-02-07','2024-02-16','2024-02-15','returned'),
('2024-02-08','2024-02-17','2024-02-16','returned'),
('2024-02-09','2024-02-18','2024-02-17','returned'),
('2024-02-10','2024-02-19','2024-02-18','returned');

insert into Payments (PaymentDate, Amount, Method, LoanDa)
VALUES
('2024-02-08',2.000,'Cash','2024-02-01'),
('2024-02-09',1.500,'Card','2024-02-02'),
('2024-02-11',2.000,'Cash','2024-02-03'),
('2024-02-12',1.800,'Card','2024-02-04'),
('2024-02-13',2.100,'Cash','2024-02-05');

insert into reviews (reviewDate, rating, comments)
values
('2024-03-01',5,'Excellent'),
('2024-03-02',4,'Good'),
('2024-03-03',3,'Average'),
('2024-03-04',5,'Very helpful'),
('2024-03-05',4,'Nice book'),
('2024-03-06',3,'Okay'),
('2024-03-07',5,'Great'),
('2024-03-08',4,'Useful'),
('2024-03-09',3,'Normal'),
('2024-03-10',5,'Perfect');

insert into Borrowings (bookSSN, personID, Loandat)
values
(1,1,'2024-02-01'),
(2,2,'2024-02-02'),
(3,3,'2024-02-03'),
(4,4,'2024-02-04'),
(5,5,'2024-02-05'),
(6,6,'2024-02-06'),
(7,7,'2024-02-07'),
(8,8,'2024-02-08'),
(9,9,'2024-02-09'),
(10,10,'2024-02-10');

insert into ReviewBook (BookNum, personNum, feedbackDate)
values
(1,1,'2024-03-01'),
(2,2,'2024-03-02'),
(3,3,'2024-03-03'),
(4,4,'2024-03-04'),
(5,5,'2024-03-05');


SELECT * FROM librarys;
SELECT * FROM members;
SELECT * FROM staff;
SELECT * FROM book;
SELECT * FROM loans;
SELECT * FROM Payments;
SELECT * FROM reviews;
SELECT * FROM Borrowings;
SELECT * FROM ReviewBook;



select*from librarys
















alter table staff
drop CONSTRAINT FK__staff__libID__619B8048;

alter table book
drop CONSTRAINT FK__book__memID__73BA3083

drop table Payments
drop table loans
drop table Borrowings;
DELETE FROM members;
DELETE FROM book;
DELETE FROM librarys;


DROP TABLE ReviewBook;
DROP TABLE Borrowings;
DROP TABLE Payments;
DROP TABLE reviews;
DROP TABLE loans;
DROP TABLE book;
DROP TABLE staff;
DROP TABLE members;
DROP TABLE librarys;

