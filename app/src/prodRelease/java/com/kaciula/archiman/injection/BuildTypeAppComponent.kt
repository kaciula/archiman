package com.kaciula.archiman.injection

import com.kaciula.archiman.infrastructure.util.ReleaseArchimanApplication

interface BuildTypeAppComponent : BaseAppComponent {

    fun inject(releaseApplication: ReleaseArchimanApplication)
}