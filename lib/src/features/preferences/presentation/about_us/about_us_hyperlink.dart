import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsHyperlink extends StatelessWidget {
  const AboutUsHyperlink({required this.label, required this.uri, super.key});

  final String label;
  final Uri uri;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return RichText(
        text: TextSpan(
      text: label,
      style: textTheme.bodyMedium!.apply(
        color: colorScheme.primary,
        fontStyle: FontStyle.italic,
        // decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()..onTap = () => launchUrl(uri),
    ),);
  }
}
