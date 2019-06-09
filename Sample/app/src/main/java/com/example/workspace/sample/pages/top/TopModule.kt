package com.example.workspace.sample.pages.top

import dagger.Binds
import dagger.Module

@Module
abstract class TopModule {

    @Binds
    internal abstract fun bindHomeViewModel(viewModel: HomeViewModelImpl): HomeViewModel
}
