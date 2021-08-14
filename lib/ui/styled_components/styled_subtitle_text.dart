import 'package:flutter/material.dart';

class StyledSubtitleText extends StatelessWidget {
  const StyledSubtitleText(this.data, {Key? key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.end,
      style: Theme.of(context)
          .textTheme
          .subtitle2!
          .apply(fontStyle: FontStyle.italic),
    );
  }
}
