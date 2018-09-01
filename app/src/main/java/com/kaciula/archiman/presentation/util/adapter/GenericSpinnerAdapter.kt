package com.kaciula.archiman.presentation.util.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView

import com.kaciula.archiman.R

class GenericSpinnerAdapter<T>(
    context: Context,
    private var items: List<T>
) : BindableAdapter<T>(context) {

    override fun getItem(position: Int): T {
        return items[position]
    }

    override fun newView(inflater: LayoutInflater, position: Int, container: ViewGroup): View {
        return inflater.inflate(R.layout.item_generic_spinner, container, false)
    }

    override fun getCount(): Int {
        return items.size
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun newDropDownView(
        inflater: LayoutInflater,
        position: Int,
        container: ViewGroup
    ): View {
        return inflater.inflate(android.R.layout.simple_spinner_dropdown_item, container, false)
    }

    override fun bindView(item: T, position: Int, view: View) {
        val tv = view.findViewById<TextView>(android.R.id.text1)
        tv.text = item.toString()
    }

    fun setItems(items: List<T>) {
        this.items = items
        notifyDataSetChanged()
    }
}
