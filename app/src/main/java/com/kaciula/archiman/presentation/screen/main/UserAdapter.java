package com.kaciula.archiman.presentation.screen.main;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.kaciula.archiman.R;
import com.kaciula.archiman.domain.model.User;
import com.kaciula.archiman.presentation.util.GenericRecyclerAdapter;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class UserAdapter extends GenericRecyclerAdapter<User, UserAdapter.ViewHolder> {

    private final MainContract.Presenter presenter;

    public UserAdapter(Context ctx, List<User> items, MainContract.Presenter presenter) {
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
        User user = getItem(position);
        holder.username.setText(user.name());
        holder.view.setOnClickListener(holder);
    }

    class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        @BindView(R.id.username)
        TextView username;

        View view;

        public ViewHolder(View view) {
            super(view);
            this.view = view;
            ButterKnife.bind(this, view);
        }

        @Override
        public void onClick(View view) {
            int adapterPosition = getAdapterPosition();
            if (adapterPosition != RecyclerView.NO_POSITION) {
                User user = getItem(adapterPosition);
                presenter.onClickUser(user);
            }
        }
    }
}
