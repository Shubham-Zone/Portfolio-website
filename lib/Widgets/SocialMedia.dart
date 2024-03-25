import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaHandlesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        ListTile(
          leading: const Icon(Icons.chat),
          title: const Text('WhatsApp'),
          onTap: () {
            // Handle WhatsApp link redirection
            launchUrl(Uri.parse('https://wa.me/<your_whatsapp_number>'));
          },
        ),

        ListTile(
          leading:const Icon(Icons.person),
          title: const Text('Facebook'),
          onTap: () {
            // Handle Facebook link redirection
            launchUrl(Uri.parse('https://www.facebook.com/<your_facebook_profile>'));
          },
        ),

        ListTile(
          leading: const Icon(Icons.group),
          title: const Text('Instagram'),
          onTap: () {
            // Handle Instagram link redirection
            launchUrl(Uri.parse('https://www.instagram.com/<your_instagram_profile>'));
          },
        ),

        ListTile(
          leading: const Icon(Icons.computer),
          title: const Text('LinkedIn'),
          onTap: () {
            // Handle LinkedIn link redirection
            launchUrl(Uri.parse('https://www.linkedin.com/in/<your_linkedin_profile>'));
          },
        ),

      ],
    );
  }
}
