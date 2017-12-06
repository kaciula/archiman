package com.kaciula.archiman.presentation.screens.home

import android.annotation.SuppressLint
import io.mironov.smuggler.AutoParcelable

@SuppressLint("ParcelCreator")
data class UserViewModel(val name: String) : AutoParcelable
