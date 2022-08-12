import 'package:flutter/material.dart';
import 'package:singleton_pattern/ui/components/components.dart';
import 'package:singleton_pattern/utilities/core.dart';

class ShadowButton extends IconButton with Core, Components {
  const ShadowButton({
    Key? key,
    required this.iconData,
    required VoidCallback onPressed,
    required Icon icon,
  }) : super(key: key, icon: icon, onPressed: onPressed);
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final size = iconSize ?? 24;
    return Stack(
      alignment: Alignment.center.add(const Alignment(0.1, 0.1)),
      children: [
        Icon(iconData, color: black, size: size),
        IconButton(onPressed: onPressed, icon: icon),
      ],
    );
  }
}

class ShadowPopButton<T> extends StatelessWidget with Core, Components {
  const ShadowPopButton({
    Key? key,
    required this.iconData,
    required this.itemBuilder,
    required this.onSelected,
    required this.icon,
  }) : super(key: key);
  final IconData iconData;
  final Icon icon;
  final Function(dynamic)? onSelected;
  final List<PopupMenuEntry<T>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    double size = 24.0;
    return Stack(
      alignment: Alignment.center.add(const Alignment(0.1, 0.1)),
      children: [
        Icon(iconData, color: black, size: size),
        PopupMenuButton<T>(
          color: primaryColor.withOpacity(0.5),
          offset: const Offset(-25, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: radCir15,
              bottomRight: radCir15,
              topLeft: radCir15,
            ),
          ),
          onSelected: onSelected,
          position: PopupMenuPosition.under,
          itemBuilder: itemBuilder,
          iconSize: size,
          icon: icon,
        ),
      ],
    );
  }
}
