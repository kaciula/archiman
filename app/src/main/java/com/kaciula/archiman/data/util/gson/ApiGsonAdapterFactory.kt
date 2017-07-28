package com.kaciula.archiman.data.util.gson

import com.google.gson.TypeAdapterFactory
import com.ryanharter.auto.value.gson.GsonTypeAdapterFactory

@GsonTypeAdapterFactory
abstract class ApiGsonAdapterFactory : TypeAdapterFactory {
    companion object {

        fun create(): ApiGsonAdapterFactory {
            return AutoValueGson_ApiGsonAdapterFactory()
        }
    }
}