package com.example.workspace.sample.pages.top;

import android.util.Log;
import android.view.View;

import com.example.workspace.sample.R;

public class HomeViewModelImpl extends HomeViewModel {
    private HomeView homeView;

    @Override
    public void init(HomeView view) {
        this.homeView = view;
    }

    @Override
    public void onClick(View view) {
    }
}
