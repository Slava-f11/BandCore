package controllers

import play.api.mvc._
import com.mongodb.casbah.Imports._
import play.libs.Json
import com.fasterxml.jackson.databind.node.ObjectNode

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