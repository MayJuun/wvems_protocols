import 'package:flutter/material.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';

final _kBorderRadius = BorderRadius.circular(12);

class StyledSelectableContainer extends StatelessWidget {
  const StyledSelectableContainer({
    Key? key,
    this.child,
    this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  final Widget? child;
  final VoidCallback? onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final colorUtil = ColorUtil();

    return Theme(
      // modify current theme so that default text colors match primary color
      // this modification only occurs when the container is 'active'
      data: Theme.of(context).copyWith(
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: isActive
                  ? colorUtil.darkenedPrimaryText(
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).brightness)
                  : null,
            ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: isActive
                  ? colorUtil.darkenedPrimaryText(
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).brightness)
                  : null,
            ),
      ),
      child: Material(
        borderRadius: _kBorderRadius,
        color: isActive
            ? colorUtil.lightenOrDarken(
                Theme.of(context).colorScheme.background,
                Theme.of(context).brightness,
                0.1)
            : Theme.of(context).colorScheme.background,
        child: InkWell(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.grey.withOpacity(0.04);
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.grey.withOpacity(0.12);
              return null; // Defer to the widget's default.
            },
          ),
          borderRadius: _kBorderRadius,
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isActive
                    ? colorUtil.darkenedPrimaryText(
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).brightness)
                    : Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: _kBorderRadius,
            ),
            padding: const EdgeInsets.all(8),
            child: child,
          ),
        ),
      ),
    );
  }
}
