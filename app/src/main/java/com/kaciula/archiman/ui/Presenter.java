package com.kaciula.archiman.ui;

import android.view.View;

public interface Presenter {

    void setView(View view);

    void onInit();

    void onAttached();

    void onResume();

    void onPause();

    void onDetached();
}
