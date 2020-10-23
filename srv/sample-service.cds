using { my } from '../db/sample';  // Entity 모델을 Import함.

service BookService { // 노출할 서비스를 업무 성격에 따라서 묶음.
    entity AuthorSrv as projection on my.Authors; // Entity 컬럼 전체를 외부로 노출   
    entity BookSrv as select from my.Books { * }; // * 대신 컬럼을 선택적으로 노출할 수 있음.
}