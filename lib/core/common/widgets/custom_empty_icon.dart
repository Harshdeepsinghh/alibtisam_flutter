import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('')),
    );
  }
}
