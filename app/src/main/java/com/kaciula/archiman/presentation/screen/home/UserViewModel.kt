package com.kaciula.archiman.presentation.screen.home

import android.annotation.SuppressLint
import io.mironov.smuggler.AutoParcelable

@SuppressLint("ParcelCreator")
data class UserViewModel(val name: String) : AutoParcelable
