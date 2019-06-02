package com.example.workspace.sample.pages;

public interface ViewModel<T extends BaseView> {

    void init(T view);
}
