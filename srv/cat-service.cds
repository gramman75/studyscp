using my.bookshop as my from '../db/data-model';

service CatalogService {
    entity BooksSrv as select from my.Books { * } excluding {attr1};
    entity AuthorsSrv as projection on my.Authors;
    entity PhonesSrv as projection on my.Phones;
}