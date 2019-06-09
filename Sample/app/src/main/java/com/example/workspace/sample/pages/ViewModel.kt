package com.example.workspace.sample.pages

interface ViewModel<T : BaseView> {

    fun init(view: T)
}
