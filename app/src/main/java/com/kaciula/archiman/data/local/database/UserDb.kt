package com.kaciula.archiman.data.local.database

import io.realm.RealmObject
import io.realm.annotations.PrimaryKey

open class UserDb : RealmObject() {
    @PrimaryKey
    var accountId: Long = 0
    var name: String? = null
}
