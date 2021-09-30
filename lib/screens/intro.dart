import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youth_emp/generated/l10n.dart';
import 'package:youth_emp/screens/welcome.dart';
import 'package:youth_emp/utils/constant.dart';
import 'package:introduction_screen/introduction_screen.dart';


// import 'package:introduction_screen/introduction_screen.dart';
class Intro extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Welcome()),
    );
  }
  Widget _buildImage(String assetName, [double width = 350]) {
    return SvgPicture.asset('images/$assetName', width: width);
  }
  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
  @override
  Widget build(BuildContext context) {

    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      backgroundColor:Color(0XFFE3ECFD),
      body: Center(
          child:
          IntroductionScreen(
            key: introKey,
            globalBackgroundColor: Colors.white,
            globalHeader: Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16),
                //  child: _buildImage('promotion.svg', 100),
                ),
              ),
            ),

            pages: [
              PageViewModel(
                title: S.of(context).intro1,
                body:"",
                image: _buildImage('promotion.svg'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title:  S.of(context).intro2,
                body: "",
                image: _buildImage('sy.svg'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title:  S.of(context).intro3,
                body:
                "",
                image: _buildImage('recruitment.svg'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: S.of(context).intro4,
                body:"",
                image: _buildImage('share1.svg'),
                decoration: pageDecoration,

              ),
            ],
            onDone: () => _onIntroEnd(context),
            //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
            showSkipButton: true,
            skipFlex: 0,
            nextFlex: 0,
            //rtl: true, // Display as right-to-left
            skip:  Text(S.of(context).skip,style: cW),
            next: const Icon(Icons.arrow_forward,color: Colors.white,),
            done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
            controlsPadding: kIsWeb
                ? const EdgeInsets.all(12.0)
                : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            dotsContainerDecorator: const ShapeDecoration(
              color: colorButton1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          )

      ),

    );
  }
}
buildPage( String image,String text, {Color c}){
  return  LayoutBuilder(builder:(ctx,size){return Column(children:
  [SvgPicture.asset(image,width: 0.5*size.maxWidth,height: 0.5*size.maxHeight,color: c,)
    ,Text(text)],);});

}
