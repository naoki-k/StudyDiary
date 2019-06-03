package com.example.workspace.sample.pages.top;

import android.databinding.BaseObservable;
import android.databinding.Bindable;
import android.view.View;

import com.example.workspace.sample.pages.ViewModel;

public abstract class HomeViewModel extends BaseObservable implements ViewModel<HomeView> {

    public abstract void onClick(View view);
}
