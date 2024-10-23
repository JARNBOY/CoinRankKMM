package com.example.coinrankkmm.android.ui.coordinators

import androidx.compose.runtime.Composable
import com.example.coinrankkmm.android.ui.navigation.Navigator

sealed class AppCoordinatorAction : CoordinatorAction {

}

class AppCoordinator() : RootCoordinator {
    override val navigator: Navigator
        get() = TODO("Not yet implemented")

    @Composable
    override fun start(action: AppCoordinatorAction) {
        TODO("Not yet implemented")
    }

    override val parent: Coordinator?
        get() = TODO("Not yet implemented")

    @Composable
    override fun handle(action: CoordinatorAction) {
        TODO("Not yet implemented")
    }

    override val activeCoordinator: Coordinator?
        get() = TODO("Not yet implemented")

}