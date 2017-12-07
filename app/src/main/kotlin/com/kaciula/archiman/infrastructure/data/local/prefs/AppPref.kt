package com.kaciula.archiman.infrastructure.data.local.prefs

import com.chibatching.kotpref.KotprefModel

object AppPref : KotprefModel() {
    var isFirstTime by booleanPref(true)
    var versionCode by intPref(0)
}