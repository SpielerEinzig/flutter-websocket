import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  final WebSocketChannel channel;
  const HomePage({Key? key, required this.channel}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _sendMessageController = TextEditingController();

  _sendMessage() {
    if (_sendMessageController.text.isNotEmpty) {
      widget.channel.sink.add(_sendMessageController.text);
      setState(() {
        _sendMessageController.text = "";
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.channel.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Web Socket Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextField(
              controller: _sendMessageController,
              label: "Send a message",
              onSubmitted: (value) {
                print(value);
              },
            ),
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: snapshot.hasData
                      ? Text("${snapshot.data}")
                      : const Text("Unable to fetch data"),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        child: const Icon(Icons.send),
      ),
    );
  }
}
