import 'package:flutter/material.dart';

import '../widgets/home_screen_widgets/bot_chat_button.dart';
import '../widgets/home_screen_widgets/tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const BotChatButton(),
          Container(height: 10, color: Colors.white),
          TasksList(),
        ],
      ),
    );
  }
}
