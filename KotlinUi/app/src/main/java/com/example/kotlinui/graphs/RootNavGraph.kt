package com.example.kotlinui.graphs

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.example.kotlinui.ControlsPage
import com.example.kotlinui.ExternalPage
import com.example.kotlinui.FormPage

@Composable
fun RootNavigationGraph(navController: NavHostController){
    NavHost(
        navController = navController,
        startDestination = "controls"
    ){
        composable(route = "controls"){
            ControlsPage(navController)
        }
        composable(route = "form"){
            FormPage()
        }
        composable(route = "external"){
            ExternalPage(navController)
        }
    }
}