package com.kaciula.archiman.infrastructure.log

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.kaciula.archiman.R
import io.palaima.debugdrawer.base.DebugModule

class TimberModule : DebugModule {

    override fun onCreateView(inflater: LayoutInflater, parent: ViewGroup): View {
        val view = inflater.inflate(R.layout.dd_debug_drawer_module_log, parent, false)

        view.findViewById(R.id.dd_button_log)
                .setOnClickListener { LogDialog(parent.context).show() }

        return view
    }

    override fun onOpened() {}

    override fun onClosed() {}

    override fun onResume() {}

    override fun onPause() {}

    override fun onStart() {}

    override fun onStop() {}
}
