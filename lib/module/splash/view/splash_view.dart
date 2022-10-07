import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import '../../Welcome/view/Welcome_view.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        controller.view = this;

        // ui_splash
        /*
        ------------------------
        https://capekngoding.com
        ------------------------
        Starring:
        Name: DenyOcr
        ------------------------
        [1] Update pubspec.yaml
        google_fonts:
        
        [2] Import
        import 'package:google_fonts/google_fonts.dart';
        ------------------------
        Code generation with snippets can be a good solution for you or it can kill you.
        A basic understanding of Dart and Flutter is required.
        Keep it in mind, Our snippet can't generate many files yet.
        So, all of our snippets are put in one file which is not best practice.
        You need to do the optimization yourself, and at least you are familiar with using Flutter.
        ------------------------
        */

        return Builder(builder: (context) {
          Future<bool> loading() async {
            await Future.delayed(const Duration(seconds: 2));

            Navigator.push(
              context,
              //TODO: set your next widget
              MaterialPageRoute(builder: (context) => const WelcomeView()),
            );
            return true;
          }

          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'FoodFav',
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        color: Color(0xffe84393),
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FutureBuilder(
                    future: loading(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator();
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
