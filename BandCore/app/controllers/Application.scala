package controllers

import play.api.mvc._
import com.mongodb.casbah.Imports._

object Application extends Controller {

  def index = Action {
    Ok(views.html.index("Your new application is ready."))
  }

  def something(i: Int) = Action {
    val mongoClient: MongoClient = MongoClient("192.168.33.12", 27017)
    val db = mongoClient("test")
    val coll = db.getCollection("test")
    val obj = MongoDBObject("Slava" -> "Fomin")
    coll.insert(obj)
    Ok(coll.findOne(obj).toString)
  }
}