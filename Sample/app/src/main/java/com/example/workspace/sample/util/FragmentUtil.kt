package com.example.workspace.sample.util

import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import android.support.v4.app.FragmentTransaction

class FragmentUtil(private val fragmentManager: FragmentManager, private val containerViewId: Int) {

    fun openFragment(fragment: Fragment) {
        val transaction = fragmentManager.beginTransaction()
        transaction.replace(containerViewId, fragment).addToBackStack(null).commit()
    }
}
