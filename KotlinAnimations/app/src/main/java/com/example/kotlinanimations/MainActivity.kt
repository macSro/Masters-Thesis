package com.example.kotlinanimations

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.animation.animateContentSize
import androidx.compose.animation.core.FastOutSlowInEasing
import androidx.compose.animation.core.LinearEasing
import androidx.compose.animation.core.RepeatMode
import androidx.compose.animation.core.animateFloat
import androidx.compose.animation.core.infiniteRepeatable
import androidx.compose.animation.core.rememberInfiniteTransition
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.example.kotlinanimations.ui.theme.KotlinAnimationsTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            KotlinAnimationsTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    Content()
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun Content() {
    Scaffold(
        topBar = { TopAppBar( title = { Text("Research scenario #2") }) }
    ) {
        Box(modifier = Modifier
            .padding(it)
            .fillMaxSize()){
            Column(
                modifier = Modifier
                    .verticalScroll(rememberScrollState())
                    .fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Row (horizontalArrangement = Arrangement.SpaceEvenly) {
                    RotatingComponent(1000)
                    RotatingComponent(1000)
                    RotatingComponent(1000)
                    RotatingComponent(1000)
                }
                Row (horizontalArrangement = Arrangement.SpaceEvenly) {
                    RotatingComponent(200, inverse = true)
                    RotatingComponent(200, inverse = true)
                    RotatingComponent(200, inverse = true)
                    RotatingComponent(200, inverse = true)
                }
                Row (horizontalArrangement = Arrangement.SpaceEvenly) {
                    RotatingComponent(300)
                    RotatingComponent(600)
                    RotatingComponent(900)
                    RotatingComponent(1200)
                }
                Row (horizontalArrangement = Arrangement.SpaceEvenly) {
                    RotatingComponent(500, inverse = true, reverse = true)
                    RotatingComponent(500, inverse = true, reverse = true)
                    RotatingComponent(500, inverse = true, reverse = true)
                    RotatingComponent(500, inverse = true, reverse = true)
                }
                Row (
                    horizontalArrangement = Arrangement.SpaceEvenly,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    RotatingComponent(500, reverse = true)
                    RotatingComponent(250, reverse = true)
                    RotatingComponent(1000, reverse = true)
                    RotatingComponent(750, reverse = true)
                }
                Row (
                    modifier = Modifier.height(180.dp),
                    horizontalArrangement = Arrangement.SpaceEvenly,
                    verticalAlignment = Alignment.CenterVertically
                ){
                    GrowingComponent(duration = 1000, maxSize = 200F)
                    GrowingComponent(duration = 700, maxSize = 90F)
                    GrowingComponent(duration = 400, maxSize = 130F)
                }
                Row (
                    modifier = Modifier.height(160.dp),
                    horizontalArrangement = Arrangement.SpaceEvenly,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    GrowingComponent(duration = 250, maxSize = 180F)
                    GrowingComponent(duration = 550, maxSize = 60F)
                    GrowingComponent(duration = 850, maxSize = 100F)
                }
            }
        }
    }
}

@Composable
fun RotatingComponent(
    duration: Int,
    reverse: Boolean = false,
    inverse: Boolean = false
) {
    val infiniteTransition = rememberInfiniteTransition()
    val angle by infiniteTransition.animateFloat(
        initialValue = 0F,
        targetValue = 360F,
        animationSpec = infiniteRepeatable(
            animation = tween(duration, easing = LinearEasing),
            repeatMode = if(inverse) RepeatMode.Reverse else RepeatMode.Restart
        )
    )
    val rotatedAngle = if (reverse) -angle else angle
    Icon(
        Icons.Default.Favorite,
        contentDescription = "Rotating Image",
        modifier = Modifier
            .size(64.dp)
            .graphicsLayer {
                rotationZ = rotatedAngle
            }
    )
}

@Composable
fun GrowingComponent(
    duration: Int,
    maxSize: Float,
    reverse: Boolean = false
) {
    val infiniteTransition = rememberInfiniteTransition()
    val size by infiniteTransition.animateFloat(
        initialValue = 0F,
        targetValue = maxSize,
        animationSpec = infiniteRepeatable(
            animation = tween(duration, easing = FastOutSlowInEasing),
            repeatMode = if(reverse) RepeatMode.Reverse else RepeatMode.Restart
        )
    )

    Icon(
        Icons.Default.Favorite,
        contentDescription = "Growing Image",
        modifier = Modifier
            .size(size.dp)
    )
}