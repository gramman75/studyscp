package customer.ultrakim.handlers;

import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.Result;
import com.sap.cds.ql.Select;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.services.EventContext;
import com.sap.cds.services.cds.CdsService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.catalogservice.CatalogService_;
import cds.gen.my.bookshop.Books;
import cds.gen.my.bookshop.Bookshop_;
import cds.gen.catalogservice.AuthorsSrv;
import cds.gen.catalogservice.BooksSrv;
import cds.gen.catalogservice.BooksSrv_;

@Component
@ServiceName(CatalogService_.CDS_NAME)
// or @ServiceName("CatalogService")
public class CatalogServiceHandler implements EventHandler {

    @Autowired
    PersistenceService db;


    @On(event = CdsService.EVENT_READ, entity = "CatalogService.BooksSrv")
    public Result onBooks(EventContext req) {          
        CqnSelect query =  Select.from(Bookshop_.BOOKS).where(o ->o.ID().eq(1));
        return db.run(query);        
    }


    @After(event = CdsService.EVENT_READ, entity = {"CatalogService.BooksSrv"})
	public void discountBooks(Stream<BooksSrv> books) {
		books.filter(b -> b.getTitle() != null && b.getStock() != null)
		.filter(b -> b.getStock() > 200)
		.forEach(b -> b.setTitle(b.getTitle() + " (discounted)"));
    }
    
    
    
    
    @After(event = CdsService.EVENT_READ, entity = {"CatalogService.AuthorsSrv"})
    public void modifyAuthors(Stream<AuthorsSrv> authors) {
        authors.filter(a -> a.getName().equals("kim"))
            .forEach(a -> a.setName(a.getName() + "김"));
    }



}