package com.kaciula.archiman.presentation.util.conductor

import android.app.Dialog
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.bluelinelabs.conductor.RestoreViewOnCreateController
import com.bluelinelabs.conductor.Router
import com.bluelinelabs.conductor.RouterTransaction
import com.bluelinelabs.conductor.changehandler.SimpleSwapChangeHandler

/**
 * A controller that displays a dialog window, floating on top of its activity's window.
 * This is a wrapper over [Dialog] object like [android.app.DialogFragment].
 *
 * Implementations should override this class and implement [.onCreateDialog] to create a custom dialog, such as an [android.app.AlertDialog]
 */
abstract class DialogController(args: Bundle?) : RestoreViewOnCreateController(args) {

    protected var dialog: Dialog? = null
        private set
    private var dismissed: Boolean = false

    /**
     * Convenience constructor for use when no arguments are needed.
     */
    protected constructor() : this(null)

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup,
        savedViewState: Bundle?
    ): View {
        dialog = onCreateDialog(savedViewState)

        dialog!!.ownerActivity = activity!!
        dialog!!.setOnDismissListener { dismissDialog() }
        if (savedViewState != null) {
            val dialogState = savedViewState.getBundle(SAVED_DIALOG_STATE_TAG)
            if (dialogState != null) {
                dialog!!.onRestoreInstanceState(dialogState)
            }
        }
        dialog!!.setOnCancelListener { this@DialogController.onCancel() }
        return View(activity)//stub view
    }

    override fun onSaveViewState(view: View, outState: Bundle) {
        super.onSaveViewState(view, outState)
        val dialogState = dialog!!.onSaveInstanceState()
        outState.putBundle(SAVED_DIALOG_STATE_TAG, dialogState)
    }

    override fun onAttach(view: View) {
        super.onAttach(view)
        dialog!!.show()
    }

    override fun onDetach(view: View) {
        super.onDetach(view)
        dialog!!.hide()
    }

    override fun onDestroyView(view: View) {
        super.onDestroyView(view)
        dialog!!.setOnDismissListener(null)
        dialog!!.dismiss()
        dialog = null
    }

    /**
     * Display the dialog, create a transaction and pushing the controller.
     *
     * @param router The router on which the transaction will be applied
     * @param tag    The tag for this controller
     */
    fun showDialog(router: Router, tag: String?) {
        dismissed = false
        router.pushController(
            RouterTransaction.with(this)
                .pushChangeHandler(SimpleSwapChangeHandler(false))
                .popChangeHandler(SimpleSwapChangeHandler(false))
                .tag(tag)
        )
    }

    /**
     * Dismiss the dialog and pop this controller
     */
    fun dismissDialog() {
        if (dismissed) {
            return
        }
        router.popController(this)
        dismissed = true
    }

    protected open fun onCancel() {}

    /**
     * Build your own custom Dialog container such as an [android.app.AlertDialog]
     *
     * @param savedViewState A bundle for the view's state, which would have been created in [.onSaveViewState] or `null` if no saved state exists.
     * @return Return a new Dialog instance to be displayed by the Controller
     */
    protected abstract fun onCreateDialog(savedViewState: Bundle?): Dialog
}

private const val SAVED_DIALOG_STATE_TAG = "android:savedDialogState"
