import 'dart:math';

class Game {
  final int _answer;
  int _totalGuesses;
  List<int> _guessnum = [];


  Game()
      : _answer = Random().nextInt(100) + 1,
        _totalGuesses = 0 {
    print('Game Constructor');
  }

  int get TotalGuesses {
    //gettotal() {return _totalGuesses;}
    return _totalGuesses;
  }

  int get answer {
    return _answer;
  }

  List get numlist {
    return _guessnum;
  }

  int doGuess(int num) {
    _totalGuesses++;
    _guessnum.add(num);

    if (num > _answer) {
      return 1;
    } else if (num < _answer) {
      return -1;
    } else {
      return 0;
    }
  }
}
