import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              reverse: true, // To show latest messages at the bottom
              children: [
                _buildMessageBubble(
                  text: 'OK po',
                  isMe: true,
                  timestamp: 'Just now • Not seen yet',
                ),
                _buildMessageBubble(
                  text: 'Submit Documents NOW!!!',
                  isMe: false,
                ),
                _buildMessageBubble(
                  text: 'wara ka tabi mga required documents',
                  isMe: false,
                ),
                _buildMessageBubble(
                  text: 'Answer pls',
                  isMe: true,
                ),
                _buildMessageBubble(
                  text: 'Ngata dae nakaka apply sa grant?',
                  isMe: true,
                ),
                _buildMessageBubble(
                  text: 'Hi there! How can I help?',
                  isMe: false,
                ),
              ].reversed.toList(), // Display in correct chronological order
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF68B2AB), // Light green background from design
      elevation: 0,
      automaticallyImplyLeading: false, // Remove default back button
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryGreen),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('President(ADMIN)', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
              Row(
                children: [
                  CircleAvatar(radius: 4, backgroundColor: Colors.green),
                  SizedBox(width: 4),
                  Text('Active Now', style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMessageBubble({required String text, required bool isMe, String? timestamp}) {
    final alignment = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isMe ? AppColors.primaryGreen.withOpacity(0.2) : Colors.grey.shade200;
    final textColor = isMe ? AppColors.primaryGreen : Colors.black;
    final borderRadius = isMe
        ? const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20))
        : const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 18, color: Colors.white),
            ),
          if (!isMe) const SizedBox(width: 8),
          Column(
            crossAxisAlignment: alignment,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: borderRadius,
                ),
                child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
              ),
              if (timestamp != null) ...[
                const SizedBox(height: 4),
                Text(timestamp, style: const TextStyle(color: Colors.grey, fontSize: 11)),
              ]
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200))
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type a reply...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
          ),
          IconButton(icon: const Icon(Icons.gif_box_outlined, color: Colors.grey), onPressed: () {}),
          IconButton(icon: const Icon(Icons.sentiment_satisfied_alt_outlined, color: Colors.grey), onPressed: () {}),
          IconButton(icon: const Icon(Icons.attach_file, color: Colors.grey), onPressed: () {}),
        ],
      ),
    );
  }
}