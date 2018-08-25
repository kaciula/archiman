package com.kaciula.archiman.presentation.screens.home.view

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.screens.home.domain.HomeEvent
import com.kaciula.archiman.presentation.screens.home.domain.UserClicked
import com.kaciula.archiman.presentation.screens.home.domain.UserDetailsClicked
import com.spotify.mobius.functions.Consumer
import kotlinx.android.extensions.LayoutContainer
import kotlinx.android.synthetic.main.item_user.*

class UserAdapter(
    private var items: List<UserViewModel>,
    private val output: Consumer<HomeEvent>
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

    fun setItems(items: List<UserViewModel>) {
        this.items = items
        notifyDataSetChanged()
    }

    inner class ViewHolder(
        override val containerView: View
    ) : RecyclerView.ViewHolder(containerView), LayoutContainer {

        fun bind(user: UserViewModel) {
            tvUsername.text = user.name
            containerView.setOnClickListener {
                if (adapterPosition != RecyclerView.NO_POSITION) {
                    output.accept(UserClicked(items[adapterPosition]))
                }
            }
            btnDetails.setOnClickListener {
                if (adapterPosition != RecyclerView.NO_POSITION) {
                    output.accept(UserDetailsClicked(items[adapterPosition]))
                }
            }
        }
    }
}
