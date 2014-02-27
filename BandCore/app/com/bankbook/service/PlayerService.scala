package com.bankbook.service

import com.bankbook.domain.Player
import java.util.Date
import com.bankbook.domain.dao.{PlayerDatabaseAdapter, Persisted}
import org.springframework.context.ApplicationContext
import org.springframework.context.annotation.AnnotationConfigApplicationContext
import config.MongoConfig
import org.springframework.data.mongodb.core.MongoOperations
import org.springframework.stereotype.Component

/**
 * Created by slava on 1/23/14.
 */
@Component
class PlayerService {

  implicit def toDatabaseAdapter(player: Player) = new PlayerDatabaseAdapter {
    def update: Unit = ???

    def delete: Unit = ???

    def retrieve(id: Int): Unit = ???

    def create: Unit = {
      val ctx: ApplicationContext = new AnnotationConfigApplicationContext(classOf[MongoConfig])
      val mongoOps: MongoOperations = ctx.getBean("mongoTemplate").asInstanceOf[MongoOperations]
      mongoOps.save(player)
    }
  }


  def create(name: String){
    val player = new Player(name, new Date)
    player.create
  }
}
