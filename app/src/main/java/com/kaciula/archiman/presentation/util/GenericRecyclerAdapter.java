package com.kaciula.archiman.presentation.util;

import android.content.Context;
import android.content.res.Resources;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;

import java.util.List;

public abstract class GenericRecyclerAdapter<T, S extends RecyclerView.ViewHolder> extends
        RecyclerView.Adapter<S> {

    protected List<T> items;
    protected LayoutInflater inflater;
    protected Resources res;

    public GenericRecyclerAdapter(Context context, List<T> items) {
        this.items = items;
        inflater = LayoutInflater.from(context);
        res = context.getResources();
    }

    public T getItem(int position) {
        return items.get(position);
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    public void setItems(List<T> items) {
        this.items = items;
        notifyDataSetChanged();
    }

    public List<T> getItems() {
        return items;
    }
}
