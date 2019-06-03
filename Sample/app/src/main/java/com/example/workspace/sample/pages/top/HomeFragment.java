package com.example.workspace.sample.pages.top;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.example.workspace.sample.R;
import com.example.workspace.sample.databinding.FragmentHomeBinding;

public class HomeFragment extends Fragment implements HomeView {
    private HomeViewModel viewModel;
    private FragmentHomeBinding binding;

    public static HomeFragment createInstance() {
        return new HomeFragment();
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_home, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        binding = FragmentHomeBinding.bind(view);
        viewModel = new HomeViewModelImpl();
        viewModel.init(this);
        binding.setViewModel(viewModel);
    }

    @Override
    public Context getContext() {
        return getActivity().getApplicationContext();
    }
}
