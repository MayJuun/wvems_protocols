import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StyledIconButton extends IconButton {
  const StyledIconButton({
    // custom variables
    required VoidCallback onPressed,
    required Icon icon,
    double? splashRadius,

    // defaults
    double? iconSize,
    VisualDensity? visualDensity,
    EdgeInsetsGeometry? padding,
    AlignmentGeometry? alignment,
    Color? color,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color? disabledColor,
    MouseCursor? mouseCursor,
    FocusNode? focusNode,
    bool? autofocus,
    String? tooltip,
    bool? enableFeedback,
    BoxConstraints? constraints,
  }) : super(
          // custom variables
          onPressed: onPressed,
          icon: icon,
          splashRadius: splashRadius ?? 24,

          // defaults
          iconSize: iconSize ?? 24,
          visualDensity: visualDensity,
          padding: padding ?? const EdgeInsets.all(8.0),
          alignment: alignment ?? Alignment.center,
          color: color,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          mouseCursor: mouseCursor ?? SystemMouseCursors.click,
          focusNode: focusNode,
          autofocus: autofocus ?? false,
          tooltip: tooltip,
          enableFeedback: enableFeedback ?? true,
          constraints: constraints,
        );
}
