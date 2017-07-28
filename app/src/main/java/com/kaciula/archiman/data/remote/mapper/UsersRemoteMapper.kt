package com.kaciula.archiman.data.remote.mapper

import com.kaciula.archiman.data.remote.response.UsersRemote
import com.kaciula.archiman.domain.entity.User
import io.reactivex.functions.Function
import java.util.*

class UsersRemoteMapper : Function<UsersRemote, List<User>> {

    @Throws(Exception::class)
    override fun apply(usersRemote: UsersRemote): List<User> {
        val users = ArrayList<User>(usersRemote.items().size)
        for (userRemote in usersRemote.items()) {
            users.add(User(userRemote.accountId(), userRemote.displayName()))
        }
        return users
    }
}
