//package com.example.web_socket_chat
//
//import io.flutter.app.FlutterApplication
//import io.flutter.plugin.common.PluginRegistry
//import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
//import io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin
//import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService.setPluginRegistrant
//
//class Application : FlutterApplication(), PluginRegistrantCallback {
//
//    @override
//    fun onCreate() {
//        super.onCreate()
//        setPluginRegistrant(this)
//
//    }
//
//    @override
//    fun registerWith(registry: PluginRegistry?) {
//        FirebaseMessagingPlugin.registerWith(registry?.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"));
//    }
//}