package com.example.kotlinfile

import android.content.Context
import android.net.Uri
import androidx.compose.runtime.*
import android.os.Bundle
import android.os.Environment
import android.util.Log
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.compose.setContent
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import coil.annotation.ExperimentalCoilApi
import coil.compose.rememberImagePainter
import com.example.kotlinfile.ui.theme.KotlinFileTheme
import java.io.File
import java.io.FileOutputStream
import java.io.IOException

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            KotlinFileTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    AppContent(LocalContext.current)
                }
            }
        }
    }
}

@OptIn(ExperimentalCoilApi::class)
@Composable
fun AppContent(context: Context) {
    var selectImages by remember { mutableStateOf(listOf<Uri>()) }

    val galleryLauncher =
        rememberLauncherForActivityResult(ActivityResultContracts.GetMultipleContents()) {
            selectImages = selectImages + it
        }

    Column(
        Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Button(
            onClick = {
                writeTextData()
                // displaying a toast message
                Toast.makeText(context, "File saved.", Toast.LENGTH_SHORT).show()
            },
            modifier = Modifier
                .wrapContentSize()
                .padding(10.dp)
        ) {
            Text(text = "Save a 20MB text file")
        }

        Button(
            onClick = { galleryLauncher.launch("image/*") },
            modifier = Modifier
                .wrapContentSize()
                .padding(10.dp)
        ) {
            Text(text = "Pick images from the library")
        }

        LazyVerticalGrid(columns = GridCells.Fixed(2)) {
            items(selectImages) { uri ->
                Image(
                    painter = rememberImagePainter(uri),
                    contentScale = ContentScale.Fit,
                    contentDescription = null,
                    modifier = Modifier
                        .padding(8.dp)
                        .size(100.dp)
                )
            }
        }

    }

}

private fun writeTextData() {
    val start = System.nanoTime();
    val folder: File =
        Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
    // Storing the data in file with name as geeksData.txt
    val file = File(folder, "kotlinFile.txt")
    var fileOutputStream: FileOutputStream? = null
    try {
        fileOutputStream = FileOutputStream(file)
        fileOutputStream.write(longText.toByteArray())
        val end = System.nanoTime() - start;
        Log.d("saveTime", "${end / 1_000_000}")
    } catch (e: Exception) {
        e.printStackTrace()
    } finally {
        if (fileOutputStream != null) {
            try {
                fileOutputStream.close()
            } catch (e: IOException) {
                e.printStackTrace()
            }
        }
    }
}