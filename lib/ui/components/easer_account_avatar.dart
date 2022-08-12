import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:singleton_pattern/utilities/core.dart';

class EaserAccountAvatar extends StatelessWidget with Core {
  const EaserAccountAvatar({
    Key? key,
    required this.radius,
    this.currentUser = true,
    this.editing = false,
    this.bytes,
    this.name = '',
    this.img = '',
  }) : super(key: key);
  final bool currentUser, editing;
  final double radius;
  final Uint8List? bytes;
  final String name, img;

  @override
  Widget build(BuildContext context) {
    final showImage = img.isNotEmpty;
    final showSelectedImage = editing && bytes != null && bytes!.isNotEmpty;
    return CircleAvatar(
      radius: radius,
      backgroundColor: primaryColor,
      backgroundImage: showSelectedImage
          ? MemoryImage(bytes!) as ImageProvider
          : showImage
              ? NetworkImage(img)
              : null,
      child: showSelectedImage
          ? null
          : showImage
              ? null
              : Text(
                  name.initials(),
                  style: roboto900.copyWith(
                    color: Colors.white,
                    fontSize: radius,
                    shadows: [
                      const BoxShadow(
                        color: Colors.black45,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
    );
  }
}
