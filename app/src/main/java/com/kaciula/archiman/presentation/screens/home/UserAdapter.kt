package com.kaciula.archiman.presentation.screens.home

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.kaciula.archiman.R
import kotlinx.android.extensions.LayoutContainer
import kotlinx.android.synthetic.main.item_user.*

class UserAdapter(
    var items: List<UserViewModel>,
    private val presenter: HomeContract.Presenter
) : RecyclerView.Adapter<UserAdapter.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val convertView =
            LayoutInflater.from(parent.context).inflate(R.layout.item_user, parent, false)
        return ViewHolder(convertView)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val user = items[position]
        holder.bind(user)
    }

    override fun getItemCount(): Int = items.size

    inner class ViewHolder(
        override val containerView: View
    ) : RecyclerView.ViewHolder(containerView), LayoutContainer {

        fun bind(user: UserViewModel) {
            tvUsername.text = user.name
            containerView.setOnClickListener {
                if (adapterPosition != RecyclerView.NO_POSITION) {
                    presenter.onClickUser(items[adapterPosition])
                }
            }
            btnDetails.setOnClickListener {
                if (adapterPosition != RecyclerView.NO_POSITION) {
                    presenter.onClickUserDetails(items[adapterPosition])
                }
            }
        }
    }
}
