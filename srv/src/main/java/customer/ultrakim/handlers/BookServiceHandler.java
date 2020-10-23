package customer.ultrakim.handlers;

import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.ServiceName;
import org.springframework.stereotype.Component;

import cds.gen.bookservice.AuthorSrv_;
import cds.gen.bookservice.BookService_;
import cds.gen.bookservice.BookSrv;
import cds.gen.bookservice.BookSrv_;

import java.util.stream.Stream;

import javax.naming.event.EventContext;

import com.sap.cds.services.cds.CdsService;



@Component 
@ServiceName(BookService_.CDS_NAME) 
public class BookServiceHandler implements EventHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    private static final Logger

    @After(event = CdsService.EVENT_READ, entity = {BookSrv_.CDS_NAME})
    public void discount(Stream<BookSrv> books){
        books.filter( b -> b.getStock() > 20)
            .forEach(b -> b.setTitle(b.getTitle() + "(over stock)")); // 
    }

    @Before(event = CdsService.EVNET_INSERT, entity = {AuthorSrv_.CDS_NAME})
    public void beforeInsertAuthor(EventContext req) {
        System.out.println("==== before insert author");

    }
}