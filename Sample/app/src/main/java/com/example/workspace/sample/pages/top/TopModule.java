package com.example.workspace.sample.pages.top;

import dagger.Binds;
import dagger.Module;

@Module
public abstract class TopModule {

    @Binds
    abstract HomeViewModel bindHomeViewModel(HomeViewModelImpl viewModel);
}


