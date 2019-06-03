package com.example.workspace.sample.util;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;

public class FragmentUtil {
    private final FragmentManager fragmentManager;
    private final int containerViewId;

    public FragmentUtil(FragmentManager manager, int containerViewId) {
        this.fragmentManager = manager;
        this.containerViewId = containerViewId;
    }

    public void openFragment(Fragment fragment) {
        FragmentTransaction transaction = fragmentManager.beginTransaction();
        transaction.replace(containerViewId, fragment).addToBackStack(null).commit();
    }
}
