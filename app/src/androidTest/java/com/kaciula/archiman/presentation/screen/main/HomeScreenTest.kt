package com.kaciula.archiman.presentation.screen.main

import android.support.test.filters.SmallTest
import android.support.test.rule.ActivityTestRule
import android.support.test.runner.AndroidJUnit4
import com.kaciula.archiman.TestUtils
import org.junit.Before
import org.junit.ClassRule
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import tools.fastlane.screengrab.Screengrab
import tools.fastlane.screengrab.UiAutomatorScreenshotStrategy
import tools.fastlane.screengrab.locale.LocaleTestRule

@RunWith(AndroidJUnit4::class)
@SmallTest
class HomeScreenTest {

    @Rule var activityTestRule = ActivityTestRule(MainActivity::class.java)

    @Before
    fun setup() {
        Screengrab.setDefaultScreenshotStrategy(UiAutomatorScreenshotStrategy())
    }

    @Test
    fun screenshot() {
        // Comment this out until the fastlane guys fix the Android 7 issue with MODE_WORLD_READABLE
        TestUtils.rotateToPortrait(activityTestRule.activity)
        //    Screengrab.screenshot("main_screen");
        TestUtils.rotateToLandscape(activityTestRule.activity)
        //    Screengrab.screenshot("main_screen");
    }

    companion object {

        @ClassRule val localeTestRule = LocaleTestRule()
    }
}
