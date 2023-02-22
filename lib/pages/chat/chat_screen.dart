import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:taskmaster/pages/chat/chatmessage.dart';
import 'package:taskmaster/pages/chat/form.dart';
import 'package:taskmaster/pages/chat/threedots.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [
    const ChatMessage(
        text:
            'Hey User, I am Task Master your AI Powered Personalised Learning Partner ;)\n\nPlease Fill the Form So, I can Help you...',
        sender: 'Task Master'),
  ];
  late OpenAI? chatGPT;
  bool _isImageSearch = false;

  bool _isTyping = false;
  String promt = '';
  void _onPressed(String promt) {
    setState(() {
      this.promt = promt;
      _sendMessage();
    });
  }

  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
        token: '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',
        baseOption: HttpSetup(receiveTimeout: 60000));
    super.initState();
  }

  @override
  void dispose() {
    chatGPT?.close();
    chatGPT?.genImgClose();
    super.dispose();
  }

  // Link for api - https://beta.openai.com/account/api-keys

  void _sendMessage() async {
    // _controller = controller;
    // if (_controller.text.isEmpty) return;
    print(promt);
    ChatMessage message = const ChatMessage(
      text: 'Genrating Best Possible Routine For You...',
      sender: "Task Manager",
      isImage: false,
    );
    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    // _controller.clear();

    // if (_isImageSearch) {
    //   final request = GenerateImage(message.text, 1, size: "256x256");

    //   final response = await chatGPT!.generateImage(request);
    //   Vx.log(response!.data!.last!.url!);
    //   insertNewData(response.data!.last!.url!, isImage: true);
    // } else {

    final request = CompleteText(
        prompt: promt.toString(), maxTokens: 2000, model: kTranslateModelV3);

    final response = await chatGPT!.onCompleteText(request: request);
    print(response);
    // final request =
    //     CompleteText(prompt: message.text, model: kTranslateModelV3);

    // final response = await chatGPT!.onCompleteText(request: request);
    // Vx.log(response!.choices[0].text);
    insertNewData(response!.choices[0].text, isImage: false);
    // }
  }

  void insertNewData(String response, {bool isImage = false}) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "Task Master",
      isImage: isImage,
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    reverse: true,
                    padding: Vx.m8,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      // sleep(Duration(seconds: 2));
                      return _messages[index];
                    },
                  ),
                ),
                // const SizedBox(
                //   height: 50,
                // ),
                if (_messages.length == 1) ...{
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: MyForm(
                      // controller: _controller,
                      onSubmitted: (promt) => _onPressed(promt),
                    ),
                  ),
                }
              ],
            ),
          ),
          if (_isTyping) const ThreeDots(),
        ],
      ),
    );
  }
}
