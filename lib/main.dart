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
  // Test
  final String url = 'https://amplify-test.dm0robqee5xgy.amplifyapp.com/demo/onlyHyperKYC.html?authToken=Bearer%20eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6IjU1YTNhNiIsImhhc2giOiIxZjQxMzU0ODhhNjc0OWU3OTFjMTA0MTRlNTQyYTU4MWY1MTU4YmI1NmU4ZDE2YWE0YzY2YmU1ZTY5MWY4YjlhIiwiaWF0IjoxNzMwMTExNTUxLCJleHAiOjE3MzAxMTQ1NTEsImp0aSI6ImVkMTY4NGVkLTViOTktNGQyYS1iMGJkLWQ5ZTg5MzhlYzI2MSJ9.GQiy5B8OpGESJ_jbMhp4551p0_Lzm-vZTDZzC4fykdXT71tltQvWUSy2M6TNLLtwTNXbKL2Xdo6t39mUwoGWfqAwFQtsuUCgxenPXRV0nuUEeN3zJQ6kRidUAqMgcur6Fq4R1N4D49Gdob';

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
