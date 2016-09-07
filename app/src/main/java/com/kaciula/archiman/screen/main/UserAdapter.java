package com.kaciula.archiman.screen.main;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.kaciula.archiman.R;
import com.kaciula.archiman.model.User;
import com.kaciula.archiman.ui.GenericListAdapter;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class UserAdapter extends GenericListAdapter<User> {

    public UserAdapter(Context ctx, List<User> items) {
        super(ctx, items);
    }

    @Override
    public View newView(LayoutInflater inflater, int position, ViewGroup container) {
        View row = inflater.inflate(R.layout.row_user, container, false);
        ViewHolder holder = new ViewHolder(row);
        row.setTag(holder);
        return row;
    }

    @Override
    public void bindView(Object item, int position, View view) {
        ViewHolder holder = (ViewHolder) view.getTag();
        User user = getItem(position);
        holder.username.setText(user.username);
    }

    static class ViewHolder {
        @BindView(R.id.username)
        TextView username;

        public ViewHolder(View view) {
            ButterKnife.bind(this, view);
        }
    }
}
