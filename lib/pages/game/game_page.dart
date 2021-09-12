import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Game _game;
  final TextEditingController _controller = TextEditingController();
  String? _guessnum;
  String? _feedback;
  String text1 = 'I\'m thinking of number between 1 and 100';
  String text2 = 'Can you guess it?❤';
  bool newGame = false;

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.righteous(fontSize: 30),
          ),
          content: Text(
            msg,
            style: GoogleFonts.righteous(),
          ),
          actions: [

            TextButton(
              child: const Text('OK'),
              onPressed: () {

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurpleAccent.shade100,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMain(),
                _buildInput(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/r1.png',
          width: 240.0,
        ),
        Text(
          'GUESS THE NUMBER',
          style: GoogleFonts.righteous(fontSize: 30.0),
        ),
      ],
    );
  }

  Widget _buildMain() {
    return _guessnum == null
        ? Column(
            children: [
              Text(text1, style: GoogleFonts.righteous(fontSize: 40.0)),
              Text(text2, style: GoogleFonts.righteous(fontSize: 40.0)),
            ],
          )
        : Column(
            children: [
              Text(_guessnum!, style: GoogleFonts.righteous(fontSize: 69.0)),
              Text(_feedback!, style: GoogleFonts.righteous(fontSize: 30.0)),
              if (newGame)
                TextButton(
                  onPressed: () {
                    setState(() {
                      _game = Game();
                      newGame = false;
                      _guessnum = null;
                      _feedback = null;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //borderRadius: BorderRadius.circular(.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2.0, 2.0),
                            color: Colors.black54,
                            spreadRadius: 3,
                            blurRadius: 5.0,
                          )
                        ],

                        border: Border.all(width: 1.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'NEW GAME',
                          style: GoogleFonts.righteous(
                              fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),

            ],
          );
  }

  Widget _buildInput() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  hintText: 'Guess the number',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _guessnum = _controller.text;
                  int? guess = int.tryParse(_guessnum!);
                  if (guess != null) {
                    var result = _game.doGuess(guess);
                    if (result == 0) {
                      newGame = true;
                      _feedback = '✔CORRECT!';
                      _showMaterialDialog('GOOD JOB!',
                          'The answer is ${_game.answer}.\nYou have made ${_game.TotalGuesses} guesses.\n${_game.numlist.join(" -> ")}');
                    } else if (result == 1) {
                      _feedback = '❌TOO HIGH!';
                    } else {
                      _feedback = '❌TOO LOW!';
                    }
                  } else {
                    _feedback = '';
                    _showMaterialDialog('ERROR!', 'Please enter the number');
                  }
                  _controller.clear();
                });
              },
              child: Text(
                'GUESS',
                style: GoogleFonts.righteous(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
