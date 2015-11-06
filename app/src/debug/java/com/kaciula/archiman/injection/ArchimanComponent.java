package com.kaciula.archiman.injection;

import com.kaciula.archiman.net.NetModule;
import com.kaciula.archiman.persistence.PrefsModule;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(
        modules = {
                ArchimanModule.class,
                PrefsModule.class,
                NetModule.class,
                MixerModule.class
        }
)
public interface ArchimanComponent extends BaseArchimanComponent {
}
