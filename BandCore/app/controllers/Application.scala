package controllers

import play.api.mvc._
import play.libs.Json
import com.fasterxml.jackson.databind.node.ObjectNode
import com.bankbook.domain.{Band, Player}
import java.util.Date
import org.springframework.data.mongodb.core.query.{Criteria, Query}
import org.springframework.context.ApplicationContext
import org.springframework.context.annotation.AnnotationConfigApplicationContext
import config.MongoConfig
import org.springframework.data.mongodb.core.MongoOperations
import com.bankbook.service.PlayerService
import org.springframework.beans.factory.annotation.Autowired

object Application extends Controller {

  @Autowired
  var privateService: PlayerService = _

  def index = Action {
    Ok(views.html.index("Your new application is ready."))
  }

  def home = Action {
    Ok(views.html.home())
  }

  def something(i: Int) = Action {
    val ctx: ApplicationContext = new AnnotationConfigApplicationContext(classOf[MongoConfig])
    val mongoOps: MongoOperations = ctx.getBean("mongoTemplate").asInstanceOf[MongoOperations]
    val xs: Player = Player("Slava", new Date)
    val players: Array[Player] = Array(xs, Player("Dima", new Date), Player("Vetal", new Date))
    val passionMark: Band = Band("Passion Mark", new Date, players)
    mongoOps.save(passionMark, "bands")
    val query: Query = new Query(Criteria where "name" is "Passion Mark")
    val band: Band = mongoOps.findOne(query, classOf[Band], "bands")
    privateService.create("Slavabbb")
    Ok(band.toString)
  }

  def getData() = Action {
    val json: ObjectNode = Json.newObject()
    json.put("name", "Stepa")
    json.put("gender", "male")
    Ok(json.toString)
  }
}

object enum extends Enumeration {
  val A, B, C = Value
}