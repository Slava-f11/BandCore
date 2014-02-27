package com.bankbook.domain.dao

import org.springframework.context.ApplicationContext
import org.springframework.data.mongodb.core.MongoOperations
import org.springframework.context.annotation.AnnotationConfigApplicationContext
import config.MongoConfig

/**
 * Created by slava on 1/23/14.
 */
trait Persisted[-A] {
  def save(entity: A): Unit = {
    val ctx: ApplicationContext = new AnnotationConfigApplicationContext(classOf[MongoConfig])
    val mongoOps: MongoOperations = ctx.getBean("mongoTemplate").asInstanceOf[MongoOperations]
    mongoOps.save(entity)
  }
}

trait PlayerDatabaseAdapter {
  def create
  def retrieve(id: Int)
  def update
  def delete
}

