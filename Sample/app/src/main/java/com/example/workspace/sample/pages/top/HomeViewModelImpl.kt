package com.example.workspace.sample.pages.top

import android.view.View

class HomeViewModelImpl : HomeViewModel() {
    private var homeView: HomeView? = null

    override fun init(view: HomeView) {
        this.homeView = view
    }

    override fun onClick(view: View) {
        view.scaleX = 2f
        view.scaleY = 2f
    }
}
