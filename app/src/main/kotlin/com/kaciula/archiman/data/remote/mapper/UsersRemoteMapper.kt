package com.kaciula.archiman.data.remote.mapper

import com.kaciula.archiman.data.remote.response.UsersRemote
import com.kaciula.archiman.domain.entity.User
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
