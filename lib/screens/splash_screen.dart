import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktactoe/screens/home.dart';
import 'package:tiktactoe/screens/interstitial_ad_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Tic ",
                      style: GoogleFonts.pressStart2p(
                        textStyle: const TextStyle(
                            color: Colors.white, letterSpacing: 3, fontSize: 23),
                      ),
                    ),
                    TextSpan(
                        text: "Tac ",
                        style: GoogleFonts.pressStart2p(
                          textStyle: const TextStyle(
                              color: Color(0xFFECE115), letterSpacing: 3, fontSize: 23),
                        )),
                    TextSpan(
                      text: "Toe",
                      style: GoogleFonts.pressStart2p(
                        textStyle: const TextStyle(
                            color: Colors.white, letterSpacing: 3, fontSize: 23),
                      ),
                    ),
                  ])),
            ),


            AvatarGlow(
                endRadius: 120,
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 300,
                )),
            FittedBox(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "@CREATEDBY",
                  style: GoogleFonts.pressStart2p(
                    textStyle: const TextStyle(
                        color: Colors.white, letterSpacing: 3, fontSize: 18),
                  ),
                ),
                TextSpan(
                  text: "SOFTNOX",
                  style: GoogleFonts.pressStart2p(
                    textStyle: const TextStyle(
                        color: Color(0xFFECE115), letterSpacing: 3, fontSize: 18),
                  ),
                ),
              ])),
            ),
//ECE115

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>const InterstitialAdPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.white),
                child: Text(
                  "PLAY GAME",
                  style: GoogleFonts.pressStart2p(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      letterSpacing: 3,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
