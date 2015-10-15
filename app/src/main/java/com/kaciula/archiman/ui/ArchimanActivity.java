package com.kaciula.archiman.ui;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.kaciula.archiman.util.ArchimanApplication;

import dagger.ObjectGraph;

public abstract class ArchimanActivity extends AppCompatActivity {

    private ObjectGraph graph;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        buildGraphAndInject();
    }

    @Override
    protected void onDestroy() {
        // Eagerly clear the reference to the activity graph to allow it to be garbage collected as
        // soon as possible.
        graph = null;
        super.onDestroy();
    }

    protected void buildGraphAndInject() {
        ObjectGraph og = ArchimanApplication.get().getObjectGraph();
        graph = og.plus(getModule());
        graph.inject(this);
    }

    public void inject(Object object) {
        graph.inject(object);
    }

    public abstract Object getModule();
}
