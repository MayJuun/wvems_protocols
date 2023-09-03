import 'package:flutter/material.dart';

class StyledSubtitleText extends StatelessWidget {
  const StyledSubtitleText(this.data, {Key? key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .apply(fontStyle: FontStyle.italic),
    );
  }
}
