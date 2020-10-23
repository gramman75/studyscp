namespace my.bookshop;

entity Books {
  key ID : Integer;
  title  : String;
  stock  : Integer;
  attr1 : String;
  author : Association to Authors ;
}

entity Authors {
    key ID : Integer;
    name : String;
    book : Composition of many Books on book.author = $self;
    phone : Association to many Phones on phone.author = $self;
}

entity Phones {
    key Id : Integer;
    phoneNumber : String;
    author: Association to Authors;
}