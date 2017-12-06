package com.kaciula.archiman.infrastructure.data.remote.mapper

import com.kaciula.archiman.domain.model.User
import com.kaciula.archiman.infrastructure.data.remote.response.UsersRemote
import io.reactivex.functions.Function
import java.util.*

class UsersRemoteMapper : Function<UsersRemote, List<User>> {

    @Throws(Exception::class)
    override fun apply(usersRemote: UsersRemote): List<User> {
        val users = ArrayList<User>(usersRemote.items.size)
        usersRemote.items.mapTo(users) { User(it.accountId, it.displayName) }
        return users
    }
}
