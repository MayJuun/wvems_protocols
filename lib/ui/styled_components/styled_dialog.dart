import 'package:flutter/material.dart';

class StyledDialog extends StatelessWidget {
  const StyledDialog({Key? key, required this.title, required this.children})
      : super(key: key);

  final Widget title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Container(),
            Align(
              alignment: Alignment.bottomCenter,
              child: _StyledRibbon(title: title, isRotated: true),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: _StyledRibbon(title: title),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: children),
            ),
          ],
        ),
      ),
    );
  }
}

class _StyledRibbon extends StatelessWidget {
  const _StyledRibbon({Key? key, this.title, this.isRotated = false})
      : super(key: key);

  final Widget? title;
  final bool isRotated;

  @override
  Widget build(BuildContext context) {
    final Widget _stack = Stack(
      children: [
        // small ribbon on the side
        const _StyledContainer(height: 140, width: 16),
        isRotated
            ? const _StyledContainer()
            : _StyledContainer(
                title: title,
                isTitleHeader: true,
              ),
        isRotated
            ? const _StyledContainer(
                title: RotatedBox(
                  quarterTurns: 2,
                  child: Text('2020'),
                ),
              )
            : const _StyledContainer(
                title: Text('2020'),
              ),
      ],
    );

    return isRotated ? RotatedBox(quarterTurns: 2, child: _stack) : _stack;
  }
}

const _radius = Radius.circular(12);

class _StyledContainer extends StatelessWidget {
  const _StyledContainer({
    Key? key,
    this.title,
    this.height = 32,
    this.width,
    this.isTitleHeader = false,
  }) : super(key: key);

  final Widget? title;
  final double? height;
  final double? width;
  final bool isTitleHeader;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.zero,
          topEnd: _radius,
          bottomStart: _radius,
          bottomEnd: _radius,
        ),
        boxShadow: kElevationToShadow[6],
        color: Colors.purple[200],
      ),
      alignment: isTitleHeader ? Alignment.center : null,
      child: title != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: title,
            )
          : null,
      height: height,
      width: width,
    );
  }
}