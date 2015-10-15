package com.kaciula.archiman.injection;

import com.kaciula.archiman.util.ArchimanApplication;

public final class Modules {
    public static Object[] list(ArchimanApplication app) {
        return new Object[]{
                new ArchimanModule(app)
        };
    }

    private Modules() {
        // No instances.
    }
}
