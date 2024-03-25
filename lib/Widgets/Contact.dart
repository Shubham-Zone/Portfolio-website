import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  void sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'shubhamanuj652@gmail.com',
      queryParameters: {
        'subject': _subjectController.text,
        'body': 'Name: ${_nameController.text}\nEmail: ${_emailController.text}\n\n${_messageController.text}',
      },
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          const Text(
            'Contact',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextField(
              controller: _subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextField(
              controller: _messageController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: sendEmail,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Send Email',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}
