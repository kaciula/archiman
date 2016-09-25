package com.kaciula.archiman.screen.main;

import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatDialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;

import com.kaciula.archiman.R;
import com.kaciula.archiman.data.model.User;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;

public class UserDialogFragment extends AppCompatDialogFragment {

    private static String EXTRA_USER = "user";

    @Inject
    MainContract.Presenter presenter;

    @BindView(R.id.tv_user_name)
    TextView tvUserName;

    public static UserDialogFragment newInstance(User user) {
        UserDialogFragment fragment = new UserDialogFragment();
        Bundle args = new Bundle();
        args.putParcelable(EXTRA_USER, user);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        ((MainActivity) getActivity()).component().inject(this);
    }

    @NonNull
    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setTitle(user().username());

        LayoutInflater inflater = getActivity().getLayoutInflater();
        View view = inflater.inflate(R.layout.dialog_user, null, false);
        ButterKnife.bind(this, view);
        setup();
        builder.setView(view);
        builder.setPositiveButton(R.string.all_ok, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                presenter.onClickOkUserDialog(user());
            }
        });
        return builder.create();
    }

    private void setup() {
        tvUserName.setText(user().username());
    }

    private User user() {
        return getArguments().getParcelable(EXTRA_USER);
    }
}
