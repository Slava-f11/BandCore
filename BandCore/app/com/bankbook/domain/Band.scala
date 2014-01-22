package com.bankbook.domain

import java.util.Date
import org.springframework.data.mongodb.core.mapping.{Document, DBRef}

/**
 * Created by slava on 1/19/14.
 */
@Document
case class Band (name: String, dateCreation: Date, @DBRef stuff: Array[Player])
