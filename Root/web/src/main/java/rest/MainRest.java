package rest;

import org.gradle.sample.impl.PersonList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

/**
 * Created by slava on 2/27/14.
 */
@Path("/getData")
public class MainRest {

    @GET
    public String getSomething(){
        PersonList personList = new PersonList();
        return "{\"name\":\"" + personList.getName("Fomin") + "\", \"gender\": \"male\"}";
    }
}
