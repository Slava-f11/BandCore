package com.bankbook.domain

import java.util.Date
import org.springframework.data.mongodb.core.mapping.Document

/**
 * Created by slava on 1/19/14.
 */
@Document
case class Player(name: String, dateBirth: Date)
