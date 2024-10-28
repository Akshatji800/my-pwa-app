import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PWA In-App Browser Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String url = 'https://example.com';

  void _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView, // Works on mobile; opens in a new tab on web
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PWA In-App Browser Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Text('Open URL'),
        ),
      ),
    );
  }
}
