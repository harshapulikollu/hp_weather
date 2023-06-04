import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Attribution extends StatelessWidget {
  const Attribution({super.key, required this.name, required this.url, this.showCopyright = false});
  final bool showCopyright;
  final String name;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: RichText(text: TextSpan(
          children: [
            if(showCopyright)
              const TextSpan(text: '© ', style: TextStyle(color: Colors.black)),
            TextSpan(
              text: name,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _launchUrl(url);
                },
                style: const TextStyle(color: Colors.blueAccent)
            ),
          ]
        )),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      debugPrint('cant launch url');
    }
  }
}
