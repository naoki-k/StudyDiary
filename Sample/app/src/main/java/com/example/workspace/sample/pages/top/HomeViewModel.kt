package com.example.workspace.sample.pages.top

import android.databinding.BaseObservable
import android.view.View

import com.example.workspace.sample.pages.ViewModel

abstract class HomeViewModel : BaseObservable(), ViewModel<HomeView> {

    abstract fun onClick(view: View)
}
