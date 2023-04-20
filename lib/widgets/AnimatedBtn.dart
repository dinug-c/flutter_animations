import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimController, required this.press,
  }) : _btnAnimController = btnAnimController;

  final RiveAnimationController _btnAnimController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset(
            "assets/RiveAssets/button.riv",
            controllers: [
              _btnAnimController
            ],
          ),
          Positioned.fill(
            top: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                  Icon(
                    Icons.arrow_right_alt_rounded,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Start the course",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
          ]
        ),
      ),
    );
  }
}