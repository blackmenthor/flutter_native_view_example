package com.example.flutter_native_platform

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

internal class AndroidNativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        val content = creationParams?.let { it["content"] as String? ?: ""  } ?: ""

        textView = TextView(context)
        textView.textAlignment = View.TEXT_ALIGNMENT_CENTER
        textView.textSize = 16f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        textView.text = "Rendered on a native Android view. Content: $content"
    }
}