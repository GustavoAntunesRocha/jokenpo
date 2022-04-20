// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageApp = const AssetImage('lib/images/padrao.png');
  var _message = 'Choose an option';
  int _scoreUser = 0;
  int _scoreApp = 0;

  void _resetApp(){
    setState(() {
      _imageApp = const AssetImage('lib/images/padrao.png');
      _message = 'Choose an option';
      _scoreApp = 0;
      _scoreUser = 0;
    });
  }

  //This method process the user input and randomize app choice and tell who won
  void _selectedOption(String userChoice){

    var options = ['rock', 'paper', 'scissors'];
    var number = Random().nextInt(3);
    var appChoice = options[number];

    String winner = 'You won!';
    String loser = 'You lost!';
    String draw = 'A tie!';

    switch (appChoice){
      case 'rock' :
        setState(() {
          _imageApp = const AssetImage('lib/images/pedra.png');
          if(userChoice == 'rock') {
            _message = draw;
          }
          if(userChoice == 'paper') {
            _message = winner;
            _scoreUser++;
          }
          if(userChoice == 'scissors') {
            _message = loser;
            _scoreApp++;
          }
        });
        break;
      case 'paper' :
        setState(() {
          _imageApp = const AssetImage('lib/images/papel.png');
          if(userChoice == 'rock') {
            _message = loser;
            _scoreApp++;
          }
          if(userChoice == 'paper') {
            _message = draw;
          }
          if(userChoice == 'scissors') {
            _message = winner;
            _scoreUser++;
          }
        });
        break;
      case 'scissors' :
        setState(() {
          _imageApp = const AssetImage('lib/images/tesoura.png');
          if(userChoice == 'rock') {
            _message = winner;
            _scoreUser++;
          }
          if(userChoice == 'paper') {
            _message = loser;
            _scoreApp++;
          }
          if(userChoice == 'scissors') {
            _message = draw;
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                      "App choice:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image(image: _imageApp,)
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _message,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  )
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () => _selectedOption('rock'),
                    child: Image.asset('lib/images/pedra.png', height: 95),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () => _selectedOption('paper'),
                    child: Image.asset('lib/images/papel.png', height: 95),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () => _selectedOption('scissors'),
                    child: Image.asset('lib/images/tesoura.png', height: 95),
                  )
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Score:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  )
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'You:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _scoreUser.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  )
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'App:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _scoreApp.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  )
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () => _resetApp(),
                    child: const Text('Reset'),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
