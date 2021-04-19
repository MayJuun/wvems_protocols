import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/controllers.dart';
import 'package:wvems_protocols/ui/strings.dart';

const _padding = EdgeInsets.symmetric(vertical: 48.0, horizontal: 32.0);

class StyledRibbonStack extends StatelessWidget {
  const StyledRibbonStack({
    Key? key,
    required this.title,
    this.subtitle,
    required this.children,
    this.padding = _padding,
    this.hasOkButton = true,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final bool hasOkButton;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
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
            padding: padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                subtitle != null
                    ? Text(
                        subtitle!,
                        textAlign: TextAlign.center,
                        style: context.textTheme.headline6,
                      )
                    : Container(),
                ...children,
                ...hasOkButton ? _okButton : [Container()],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final _okButton = <Widget>[
  const Gap(12),
  const Divider(
    color: Colors.black38,
    thickness: 1,
  ),
  TextButton(
    child: Text(S.NAV_OK),
    onPressed: () => Get.back(),
  )
];

class _StyledRibbon extends StatelessWidget {
  const _StyledRibbon({Key? key, this.title, this.isRotated = false})
      : super(key: key);

  final String? title;
  final bool isRotated;

  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();
    final Widget _stack = Obx(
      () => Stack(
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
              ? _StyledContainer(
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Text(controller.activeYear.value.toString()),
                  ),
                )
              : _StyledContainer(
                  child: Text(
                    controller.activeYear.value.toString(),
                  ),
                ),
        ],
      ),
    );

    return isRotated ? RotatedBox(quarterTurns: 2, child: _stack) : _stack;
  }
}

const _radius = Radius.circular(12);

class _StyledContainer extends StatelessWidget {
  const _StyledContainer({
    Key? key,
    this.title,
    this.child,
    this.height = 32,
    this.width,
    this.isTitleHeader = false,
  }) : super(key: key);

  final String? title;
  final Widget? child;
  final double? height;
  final double? width;
  final bool isTitleHeader;

  @override
  Widget build(BuildContext context) {
    final PdfStateController controller = Get.find();

    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.zero,
            topEnd: Radius.zero,
            bottomStart: _radius,
            bottomEnd: _radius,
          ),
          boxShadow: kElevationToShadow[4],
          color: VersionsUtil().wvemsColor(controller.activeYear.value),
        ),
        alignment: isTitleHeader ? Alignment.center : null,
        // header text
        child: isTitleHeader
            ? Center(
                child: title != null
                    ? Text(title!,
                        textAlign: TextAlign.center,
                        style: context.textTheme.headline5)
                    : Container(),
              )
            // body text, typically '2020'
            : child != null
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: child != null ? child : Container(),
                  )
                : null,
        height: height,
        width: width,
      ),
    );
  }
}
