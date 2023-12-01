import 'package:flutter/material.dart';

class SmallSpacingWidget extends StatelessWidget {
  const SmallSpacingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 8.0);
  }
}

class MediumSpacingWidget extends StatelessWidget {
  const MediumSpacingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 16.0);
  }
}

class LargeSpacingWidget extends StatelessWidget {
  const LargeSpacingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 24.0);
  }
}
