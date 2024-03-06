import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late UserAuthViewModel userAuthViewModel;

  @override
  void initState() {
    userAuthViewModel = ref.read(userAuthViewModelProvider.notifier);
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationController.animateTo(0.5);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      checkForLogin();
      //userProfileViewModel.loadSelectedCountryStates('Nigeria');
    });
  }

  checkForLogin() async {
    var result = await userAuthViewModel.checkIfUserIsLoggedIn();
    if (result) {
      //Navigate away from this screen
      router.pushAndPopUntil(WelcomeRoute(), predicate: (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> _imageFade = CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.easeIn,
        ));
    final Animation<double> _buttonFade = CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.3,
          curve: Curves.easeIn,
        ));
    final _moveAnimation =
        Tween<Offset>(begin: Offset(0, -2), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.easeIn,
      ),
    ));

    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(
          child: FadeTransition(
              opacity: _imageFade,
              child: Image.asset("assets/images/heroo.png")),
        ),
        Center(
          child: Container(
            color: AppColors.primaryDark.withOpacity(0.4),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeTransition(
                      opacity: _imageFade,
                      child: SlideTransition(
                          position: _moveAnimation,
                          child: Text(heroTitle, style: titleStyle))),
                  FadeTransition(
                      opacity: _imageFade,
                      child: Text(heroSubtitle, style: subtitleStyle)),
                  SizedBox(height: 20),
                  FadeTransition(
                    opacity: _buttonFade,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            title: 'Login',
                            action: () {
                              router.push(SignInRoute());
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            title: 'Sign up',
                            invert: true,
                            action: () {
                              router.push(SignUpRoute());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ]),
          ),
        )
      ],
    ));
  }
}
