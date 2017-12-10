package com.kaciula.archiman.presentation.screens.home

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import butterknife.BindView
import butterknife.ButterKnife
import butterknife.OnClick
import com.kaciula.archiman.R

class UserAdapter(var items: List<UserViewModel>, private val presenter: HomeContract.Presenter)
    : RecyclerView.Adapter<UserAdapter.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val convertView = LayoutInflater.from(parent.context).inflate(R.layout.item_user, parent, false)
        return ViewHolder(convertView)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val user = items[position]
        holder.tvUsername.text = user.name
        holder.view.setOnClickListener(holder)
    }

    override fun getItemCount(): Int = items.size

    inner class ViewHolder(val view: View) : RecyclerView.ViewHolder(view), View.OnClickListener {

        @BindView(R.id.tv_username) lateinit var tvUsername: TextView

        init {
            ButterKnife.bind(this, view)
        }

        override fun onClick(view: View) {
            if (adapterPosition != RecyclerView.NO_POSITION) {
                presenter.onClickUser(items[adapterPosition])
            }
        }

        @OnClick(R.id.btn_details)
        fun onClickDetails() {
            if (adapterPosition != RecyclerView.NO_POSITION) {
                presenter.onClickUserDetails(items[adapterPosition])
            }
        }
    }
}
