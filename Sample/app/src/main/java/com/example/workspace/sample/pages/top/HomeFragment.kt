package com.example.workspace.sample.pages.top

import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

import com.example.workspace.sample.R
import com.example.workspace.sample.databinding.FragmentHomeBinding

class HomeFragment : Fragment(), HomeView {
    private var viewModel: HomeViewModel? = null
    private var binding: FragmentHomeBinding? = null

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_home, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding = FragmentHomeBinding.bind(view)
        viewModel = HomeViewModelImpl()
        viewModel!!.init(this)
        binding!!.viewModel = viewModel
    }

    companion object {

        fun createInstance(): HomeFragment {
            return HomeFragment()
        }
    }
}
