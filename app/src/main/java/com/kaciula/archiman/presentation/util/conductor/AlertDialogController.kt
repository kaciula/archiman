package com.kaciula.archiman.presentation.util.conductor

import android.app.Dialog
import android.os.Bundle
import android.support.v7.app.AlertDialog
import android.text.method.LinkMovementMethod
import android.widget.TextView

class AlertDialogController(args: Bundle) : DialogController(args) {

    constructor(title: CharSequence, description: CharSequence) : this(
        BundleBuilder(Bundle())
            .putCharSequence(KEY_TITLE, title)
            .putCharSequence(KEY_DESCRIPTION, description)
            .build()
    )

    override fun onCreateDialog(savedViewState: Bundle?): Dialog {
        val alertDialog = AlertDialog.Builder(activity!!)
            .setTitle(args.getCharSequence(KEY_TITLE))
            .setMessage(args.getCharSequence(KEY_DESCRIPTION))
            .setPositiveButton(android.R.string.ok, null)
            .create()

        alertDialog.setOnShowListener {
            val messageTextView = alertDialog.findViewById<TextView>(android.R.id.message)
            if (messageTextView != null) {
                //Make links clickable
                messageTextView.movementMethod = LinkMovementMethod.getInstance()
            }
        }

        return alertDialog
    }
}

private const val KEY_TITLE = "DialogController.title"
private const val KEY_DESCRIPTION = "DialogController.description"