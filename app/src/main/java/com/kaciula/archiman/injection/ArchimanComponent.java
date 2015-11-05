package com.kaciula.archiman.injection;

import com.kaciula.archiman.net.NetModule;
import com.kaciula.archiman.persistence.PrefsModule;
import com.kaciula.archiman.screen.main.MainMixer;
import com.kaciula.archiman.util.ArchimanApplication;
import com.kaciula.archiman.util.GlobalStateManager;

import dagger.Component;

@ApplicationScope
@Component(
        modules = {
                ArchimanModule.class,
                PrefsModule.class,
                NetModule.class,
                MixerModule.class
        }
)
public interface ArchimanComponent {

    void inject(ArchimanApplication application);

    void inject(GlobalStateManager globalStateManager);

    MainMixer getMainMixer();
}
