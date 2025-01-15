import 'package:flutter/material.dart';

class ScaleDown extends StatelessWidget {
  const ScaleDown({super.key, this.flex = 1, this.boxFit = BoxFit.scaleDown, required this.child});

  final int flex;
  final BoxFit boxFit;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: FittedBox(
        fit: boxFit,
        child: child,
      ),
    );
  }
}
