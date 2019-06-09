package com.example.workspace.sample.pages.top

import android.support.v7.app.AppCompatActivity
import android.os.Bundle

import com.example.workspace.sample.R
import com.example.workspace.sample.util.FragmentUtil

class TopActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_top)

        val fragmentUtil = FragmentUtil(supportFragmentManager, R.id.top_container)
        fragmentUtil.openFragment(HomeFragment.createInstance())
    }
}
