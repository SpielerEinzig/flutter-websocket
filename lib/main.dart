import 'package:flutter/material.dart';
import 'package:flutter_websocket/screens/home.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        channel: IOWebSocketChannel.connect(
          "wss://demo.piesocket.com/v3/channel_1?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self", //"ws://echo.websocket.org",
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
