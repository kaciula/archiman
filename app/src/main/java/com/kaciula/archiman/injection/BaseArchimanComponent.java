package com.kaciula.archiman.injection;

import com.kaciula.archiman.component.ArchimanApplication;
import com.kaciula.archiman.screen.main.MainMixer;
import com.kaciula.archiman.util.AppManager;

public interface BaseArchimanComponent {

    void inject(ArchimanApplication application);

    void inject(AppManager appManager);

    MainMixer getMainMixer();
}
