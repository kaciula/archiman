package com.kaciula.archiman.presentation.screen.home;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import com.kaciula.archiman.R;
import com.kaciula.archiman.presentation.util.GenericRecyclerAdapter;
import java.util.List;

class UserAdapter extends GenericRecyclerAdapter<UserViewModel, UserAdapter.ViewHolder> {

  private final HomeContract.Presenter presenter;

  UserAdapter(Context ctx, List<UserViewModel> items, HomeContract.Presenter presenter) {
    super(ctx, items);
    this.presenter = presenter;
  }

  @Override
  public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
    View convertView = inflater.inflate(R.layout.item_user, parent, false);
    return new ViewHolder(convertView);
  }

  @Override
  public void onBindViewHolder(ViewHolder holder, int position) {
    UserViewModel user = getItem(position);
    holder.username.setText(user.name());
    holder.view.setOnClickListener(holder);
  }

  class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
    @BindView(R.id.tv_username) TextView username;

    View view;

    ViewHolder(View view) {
      super(view);
      this.view = view;
      ButterKnife.bind(this, view);
    }

    @Override
    public void onClick(View view) {
      int adapterPosition = getAdapterPosition();
      if (adapterPosition != RecyclerView.NO_POSITION) {
        UserViewModel user = getItem(adapterPosition);
        presenter.onClickUser(user);
      }
    }

    @OnClick(R.id.btn_details)
    void onClickDetails() {
      int adapterPosition = getAdapterPosition();
      if (adapterPosition != RecyclerView.NO_POSITION) {
        UserViewModel user = getItem(adapterPosition);
        presenter.onClickUserDetails(user);
      }
    }
  }
}
