package com.kaciula.archiman.domain.util

object Strings {

    fun isBlank(charSequence: CharSequence?): Boolean {
        return charSequence?.isBlank() ?: true
    }
}
