import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final websocket = WebSocket();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: StreamBuilder(
          stream: websocket.channel.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
              children: [
                TextButton(
                  onPressed: () {
                    websocket.sendMessage();
                  },
                  child: const Text("Test"),
                ),
                TextButton(
                  onPressed: () {
                    websocket.disconnect();
                  },
                  child: const Text("Disconnect"),
                ),
                Text(snapshot.hasData ? '${snapshot.data}' : ''),
              ],
            );
          },
        ),
      ),
    );
  }
}

class WebSocket {
  WebSocketChannel channel =  WebSocketChannel.connect(
      Uri.parse(
        'wss://s0jchta3dj.execute-api.ap-south-1.amazonaws.com/Prod?token=2590f98a-cce7-4820-8f78-dd856d626aa8',
      ),
    );

  void sendMessage() {
    channel.sink.add(json.encode({
      "action": "message",
      "message": "test",
      "token": "2590f98a-cce7-4820-8f78-dd856d626aa8"
    }));
  }

  void disconnect() {
    channel.sink.close();
  }
}
