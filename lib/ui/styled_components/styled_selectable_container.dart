import 'package:flutter/material.dart';

class StyledSelectableContainer extends StatelessWidget {
  const StyledSelectableContainer({Key? key, this.child, this.onPressed})
      : super(key: key);

  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}
