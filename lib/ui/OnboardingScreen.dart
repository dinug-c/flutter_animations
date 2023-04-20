import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animations/widgets/AnimatedBtn.dart';
import 'package:flutter_animations/widgets/SignInForm.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  late RiveAnimationController _btnAnimController;

  @override
  void initState() {
    _btnAnimController = OneShotAnimation(
      "active",
      autoplay: false,
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              bottom: 100,
              left: 100,
              child: Image.asset(
                "assets/Backgrounds/Spline.png"
                ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 10,
                ),
                //child: SizedBox(),
              ),
            ),
            const RiveAnimation.asset(
              "assets/RiveAssets/shapes.riv",
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 35,
                  sigmaY: 35,
                ),
                child: const SizedBox(),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            "Learn biology easily",
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: "Poppins",
                              height: 1.2,
                              ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Don't you ever think that biology is hard? We will make it easy for you. With our app, you can learn biology easily and quickly.",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2,),
                    AnimatedBtn(
                      btnAnimController: _btnAnimController,
                      press: (){
                        _btnAnimController.isActive = true;
                        showGeneralDialog(
                          context: context, 
                          barrierDismissible: true,
                          barrierLabel: "Sign In",
                          pageBuilder: (context, _, __) => 
                            Center(
                              child: Container(
                                height: 620,
                                padding: EdgeInsets.symmetric(
                                  vertical: 32,
                                  horizontal: 24
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal:16,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.94),
                                  borderRadius: BorderRadius.all(Radius.circular(40))
                                ),
                                child: Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Column(
                                    children: [
                                      Text(
                                        "Sign In",
                                        style: TextStyle(
                                          fontSize: 34,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        child: Text(
                                          "Access to 320+ lessons, 100+ quizzes, and 100+ flashcards. Learn biology by testing your knowledge.",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SignInForm(),
                                      Row(
                                        children: const [
                                          Expanded(child: Divider()),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            child: Text(
                                              "OR",
                                              style: TextStyle(
                                                color: Colors.black26,
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Divider()),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 20),
                                        child: Text(
                                          "Sign up with Email, Apple or Google",
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                      ),
                      child: Text(
                        "Purchase includes lifetime access to all future updates, with no additional fees."
                      ),
                    ),
                  ],
                ),
              ),
              ),
          ],
        ),
      ),
    );
  }
}


