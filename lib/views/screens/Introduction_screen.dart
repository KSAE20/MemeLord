import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:memelord/views/screens/Auth_screen.dart';
import 'package:memelord/views/widgets/button_widget.dart';



class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Center(
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: 'Welcome, to the world of memes',
                body: '',
                image: buildImage('assets/images/waving meme lord 1.4.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: '',
                body: 'Every one has its own card,Which is defined according to his behavioral Actions',
                image: buildImage('assets/images/meme card.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: '',
                body: 'Incase of being highly reported with theft reports, you will be flagged as thief and your future posts revenues will be freezed for a while',
                image: buildImage('assets/images/theif meme card.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Join our community',
                body: 'Start your journey',
                footer: ButtonWidget(
                  text: 'Login',
                  onClicked: () => goToHome(context),
                ),
                image: buildImage('assets/images/login meme.png',),
                decoration: getPageDecoration(),
              ),
            ],
            done: Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
            onDone: () => goToHome(context),
            showSkipButton: true,
            skip: Text('Skip'),
            onSkip: () => goToHome(context),
            next: Icon(Icons.arrow_forward),
            dotsDecorator: getDotDecoration(),
            onChange: (index) => print('Page $index selected'),
            globalBackgroundColor: Colors.white,
            //skipFlex: 0,
            nextFlex: 0,
            // isProgressTap: false,
            // isProgress: false,
            // showNextButton: false,
            // freeze: true,
            // animationDuration: 1000,
          ),
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: Colors.cyan,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        bodyPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        //descriptionPadding here
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}