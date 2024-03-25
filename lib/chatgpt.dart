import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:provider/provider.dart';

class ChatGptPage extends StatefulWidget {
  @override
  _ChatGptPageState createState() => _ChatGptPageState();
}

class ChatProvider extends ChangeNotifier {
  final String apiKey = 'YOUR_API_KEY'; // Replace with your OpenAI API key
  final String apiUrl =
      'https://api.openai.com/v1/engines/davinci-codex/completions';

  List<String> messages = [];
  bool isLoading = false;

  // Future<void> sendMessage(String text) async {
  //   messages.add('You: $text');
  //   isLoading = true;
  //   notifyListeners();
  //
  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: {
  //       'Authorization': 'Bearer $apiKey',
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'prompt': text,
  //       'max_tokens': 50, // Adjust as needed
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     final botMessage = data['choices'][0]['text'].toString();
  //     messages.add('ChatGPT: $botMessage');
  //   } else {
  //     messages.add('Error communicating with ChatGPT.');
  //   }
  //
  //   isLoading = false;
  //   notifyListeners();
  // }
}

class _ChatGptPageState extends State<ChatGptPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ChatGPT'),
      ),
      body: Column(
        children: <Widget>[
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: chatProvider.messages.length,
          //     itemBuilder: (context, index) {
          //       final message = chatProvider.messages[index];
          //       return ListTile(
          //         title: Text(message),
          //       );
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    final text = _textController.text.trim();
                    if (text.isNotEmpty) {
                      // await chatProvider.sendMessage(text);
                      // _textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
