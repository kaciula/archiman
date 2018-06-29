package com.kaciula.archiman.domain.model

import org.junit.Assert
import org.junit.Test

class AppTest {

    @Test
    fun bumpVersionFirstTime() {
        val app = App(true, 1)
        val currentVersionCode = 2

        app.bumpVersion(currentVersionCode)

        Assert.assertEquals(false, app.isFirstTime)
        Assert.assertEquals(currentVersionCode, app.versionCode)
    }

    @Test
    fun bumpVersionAfterFirstTime() {
        val app = App(false, 2)
        val currentVersionCode = 3

        app.bumpVersion(currentVersionCode)

        Assert.assertEquals(false, app.isFirstTime)
        Assert.assertEquals(currentVersionCode, app.versionCode)
    }

    @Test
    fun shouldBumpVersionWhenVersionCodeLarger() {
        val app = App(true, 1)
        val currentVersionCode = 2

        val shouldBump = app.shouldBumpVersion(currentVersionCode)

        Assert.assertEquals(true, shouldBump)
    }

    @Test
    fun shouldBumpVersionWhenVersionCodeTheSame() {
        val app = App(false, 2)
        val currentVersionCode = 2

        val shouldBump = app.shouldBumpVersion(currentVersionCode)

        Assert.assertEquals(false, shouldBump)
    }
}