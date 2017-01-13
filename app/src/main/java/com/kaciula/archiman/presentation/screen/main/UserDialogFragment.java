package com.kaciula.archiman.presentation.screen.main;

import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatDialogFragment;
import android.view.View;
import android.widget.TextView;
import butterknife.BindView;
import butterknife.ButterKnife;
import com.kaciula.archiman.R;
import com.kaciula.archiman.presentation.screen.home.HomeContract;
import com.kaciula.archiman.presentation.screen.home.UserViewModel;

public class UserDialogFragment extends AppCompatDialogFragment {

  private static final String EXTRA_USER = "user";

  HomeContract.Presenter presenter;

  @BindView(R.id.tv_user_name) TextView tvUserName;

  public static UserDialogFragment newInstance(UserViewModel user) {
    UserDialogFragment fragment = new UserDialogFragment();
    Bundle args = new Bundle();
    args.putParcelable(EXTRA_USER, user);
    fragment.setArguments(args);
    return fragment;
  }

  @Override
  public void onActivityCreated(Bundle savedInstanceState) {
    super.onActivityCreated(savedInstanceState);
  }

  @NonNull
  @Override
  public Dialog onCreateDialog(Bundle savedInstanceState) {
    AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
    builder.setTitle(user().name());

    View view = View.inflate(getActivity(), R.layout.dialog_user, null);
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
    tvUserName.setText(user().name());
  }

  private UserViewModel user() {
    return getArguments().getParcelable(EXTRA_USER);
  }
}
