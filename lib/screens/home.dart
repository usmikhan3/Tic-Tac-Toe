import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late BannerAd bannerAd;
  var adUnitId = "ca-app-pub-3940256099942544/6300978111"; //testADID

  bool isAdLoaded = false;

  initBannerAd() async {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad){
          setState(() {
            isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad,error){
          ad.dispose();
          print(error);
        },


      ),
      request: AdRequest(

      ),
    );

    bannerAd.load();
  }




  bool OTurn = true;

  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  static var fontblack = GoogleFonts.pressStart2p(
    textStyle:const TextStyle(
      color: Colors.black,
      letterSpacing: 3,
    ),
  );

  static var fontwhite = GoogleFonts.pressStart2p(
    textStyle:const TextStyle(
        color: Colors.white,
        letterSpacing: 3,
        fontSize: 15
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          "Player O",
                          style: fontwhite,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        oScore.toString(),
                        style: fontwhite.copyWith(color: Color(0xFFECE115)),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          "Player X",
                          style: fontwhite,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        xScore.toString(),
                        style: fontwhite.copyWith(color: Color(0xFFECE115)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700)),
                    child: Center(
                        child: Text(
                          displayXO[index],
                          style: TextStyle(color: displayXO[index] == "O" ? Colors.white : Color(0xFFECE115), fontSize: 40),
                        )),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  children: [

                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: "Tic ",style:fontwhite ),
                          TextSpan(text: "Tac ",style:fontwhite.copyWith(color: Color(0xFFECE115)) ),
                          TextSpan(text: "Toe",style:fontwhite ),
                        ]
                    )),
                    SizedBox(
                      height: 30,
                    ),

                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: "@CREATEDBY",style:fontwhite ),
                        TextSpan(text: "SOFTNOX",style:fontwhite.copyWith(color: Color(0xFFECE115)) ),
                      ]
                    )),

                    SizedBox(
                      height: 20,
                    ),

                    isAdLoaded ? SizedBox(
                      height: bannerAd.size.height.toDouble(),
                      width: bannerAd.size.width.toDouble(),
                      child: AdWidget(ad: bannerAd,),
                    ) :const  SizedBox(),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (OTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes += 1;
      } else if (!OTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBoxes += 1;
      }

      OTurn = !OTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    }

    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _showWinDialog(displayXO[3]);
    }

    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showWinDialog(displayXO[6]);
    }

    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    }

    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showWinDialog(displayXO[1]);
    }

    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _showWinDialog(displayXO[2]);
    }

    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    }

    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _showWinDialog(displayXO[2]);
    } else if (filledBoxes == 9) {
      _ShowDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Winner is: " + winner),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.pop(context);
                  },
                  child: Text('Play again!',style: fontwhite.copyWith(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),))
            ],
          );
        });

    if (winner == "O") {
      oScore += 1;
    } else if (winner == "X") {
      xScore += 1;
    }
  }

  void _ShowDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("DRAW!"),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.pop(context);
                  },
                  child: Text('Play again!'))
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
    filledBoxes = 0;
  }
}