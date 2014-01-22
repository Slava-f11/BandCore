package config

import org.springframework.data.mongodb.config.AbstractMongoConfiguration
import com.mongodb.Mongo
import org.springframework.context.annotation.Configuration

/**
 * Created by slava on 1/19/14.
 */
@Configuration
class MongoConfig extends AbstractMongoConfiguration {


  def getDatabaseName: String = "bands"

  def mongo(): Mongo = new Mongo("192.168.33.12")
}
