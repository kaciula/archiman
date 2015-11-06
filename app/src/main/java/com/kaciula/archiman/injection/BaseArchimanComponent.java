package com.kaciula.archiman.injection;

import com.kaciula.archiman.screen.main.MainMixer;
import com.kaciula.archiman.util.ArchimanApplication;
import com.kaciula.archiman.util.GlobalStateManager;

public interface BaseArchimanComponent {

    void inject(ArchimanApplication application);

    void inject(GlobalStateManager globalStateManager);

    MainMixer getMainMixer();
}
