package rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

/**
 * Created by slava on 2/27/14.
 */
@Path("/getData")
public class MainRest {

    @GET
    public String getSomething(){
        return "{\"name\":\"Stepa\", \"gender\": \"male\"}";
    }
}
