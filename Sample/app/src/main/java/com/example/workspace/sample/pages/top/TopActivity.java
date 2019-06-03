package com.example.workspace.sample.pages.top;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.example.workspace.sample.R;
import com.example.workspace.sample.util.FragmentUtil;

public class TopActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_top);

        FragmentUtil fragmentUtil = new FragmentUtil(getSupportFragmentManager(), R.id.top_container);
        fragmentUtil.openFragment(HomeFragment.createInstance());
    }
}
