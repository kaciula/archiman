package com.kaciula.archiman.data.remote.response

import com.google.gson.annotations.SerializedName

data class UserRemote(@SerializedName("account_id") val accountId: Long,
                      @SerializedName("display_name") val displayName: String)

