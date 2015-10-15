package com.kaciula.archiman.injection;

import dagger.Module;

@Module(
        addsTo = ArchimanModule.class,
        complete = false,
        library = true,
        includes = {
        },
        injects = {
        },
        overrides = true
)
public final class DebugArchimanModule {
}
