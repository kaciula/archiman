package com.kaciula.archiman.ui;

import android.content.Context;
import android.content.res.Resources;
import android.view.LayoutInflater;

import java.util.List;

public abstract class GenericListAdapter<T> extends BindableAdapter {

    protected List<T> items;
    protected LayoutInflater inflater;
    protected Resources res;

    public GenericListAdapter(Context context, List<T> items) {
        super(context);
        this.items = items;
        inflater = LayoutInflater.from(context);
        res = context.getResources();
    }

    @Override
    public T getItem(int position) {
        return items.get(position);
    }

    @Override
    public int getCount() {
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
