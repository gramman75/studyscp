DROP VIEW IF EXISTS BookService_AuthorSrv;
DROP VIEW IF EXISTS BookService_BookSrv;
DROP VIEW IF EXISTS CatalogService_AuthorsSrv;
DROP VIEW IF EXISTS CatalogService_BooksSrv;
DROP VIEW IF EXISTS CatalogService_PhonesSrv;

DROP TABLE IF EXISTS my_Authors;
DROP TABLE IF EXISTS my_Books;
DROP TABLE IF EXISTS my_bookshop_Authors;
DROP TABLE IF EXISTS my_bookshop_Books;
DROP TABLE IF EXISTS my_bookshop_Phones;

CREATE TABLE my_Authors (
  ID INTEGER NOT NULL,
  name NVARCHAR(5000),
  PRIMARY KEY(ID)
);

CREATE TABLE my_Books (
  ID INTEGER NOT NULL,
  title NVARCHAR(5000),
  stock INTEGER,
  author_ID INTEGER,
  PRIMARY KEY(ID)
);

CREATE TABLE my_bookshop_Authors (
  ID INTEGER NOT NULL,
  name NVARCHAR(5000),
  PRIMARY KEY(ID)
);

CREATE TABLE my_bookshop_Books (
  ID INTEGER NOT NULL,
  title NVARCHAR(5000),
  stock INTEGER,
  attr1 NVARCHAR(5000),
  author_ID INTEGER,
  PRIMARY KEY(ID)
);

CREATE TABLE my_bookshop_Phones (
  Id INTEGER NOT NULL,
  phoneNumber NVARCHAR(5000),
  author_ID INTEGER,
  PRIMARY KEY(Id)
);

CREATE VIEW BookService_AuthorSrv AS SELECT
  Authors_0.ID,
  Authors_0.name
FROM my_Authors AS Authors_0;

CREATE VIEW BookService_BookSrv AS SELECT
  Books_0.ID,
  Books_0.title,
  Books_0.stock,
  Books_0.author_ID
FROM my_Books AS Books_0;

CREATE VIEW CatalogService_AuthorsSrv AS SELECT
  Authors_0.ID,
  Authors_0.name
FROM my_bookshop_Authors AS Authors_0;

CREATE VIEW CatalogService_BooksSrv AS SELECT
  Books_0.ID,
  Books_0.title,
  Books_0.stock,
  Books_0.author_ID
FROM my_bookshop_Books AS Books_0;

CREATE VIEW CatalogService_PhonesSrv AS SELECT
  Phones_0.Id,
  Phones_0.phoneNumber,
  Phones_0.author_ID
FROM my_bookshop_Phones AS Phones_0;

