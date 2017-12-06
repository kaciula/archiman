package com.kaciula.archiman.data.remote.response

import com.squareup.moshi.Json

data class UserRemote(@field:Json(name = "account_id") val accountId: Long,
                      @field:Json(name = "display_name") val displayName: String)
