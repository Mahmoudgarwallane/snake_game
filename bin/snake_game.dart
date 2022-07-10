import 'dart:async';
import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:snake_game/coordinates.dart';
import 'package:snake_game/food.dart';
import 'package:snake_game/game_gui.dart';
import 'package:snake_game/score.dart';
import 'package:snake_game/snake.dart';

enum Events { up, down, right, left }

class KeyboardEvents {
  Stream<Events> keyboardEventsStream() async* {
    while (true) {
      int value = stdin.readByteSync();
      switch (value) {
        case 122:
          yield Events.up;
          break;
        case 115:
          yield Events.down;
          break;
        case 113:
          yield Events.left;
          break;
        case 100:
          yield Events.right;
          break;
        default:
          break;
      }
    }
  }
}

void main() async {
  stdin.echoMode = false;
  stdin.lineMode = false;
  KeyboardEvents event = KeyboardEvents();
  Stream keyboardEventsStream = event.keyboardEventsStream();
  GameGui gui = GameGui();

  List<List<String>> map = gui.generateMap(5);
  Score score = Score();
  Snake snake = Snake(map, score);
  Food food = Food(map, snake);
    final console = Console();
  gui.printMap(map);
  keyboardEventsStream.listen((event) {
    try {
      if (event == Events.up) {
        snake.updateCoordinates(
            Coordinates(x: snake.coordinates!.x, y: snake.coordinates!.y - 1),
            food);
        console.clearScreen();
        gui.printMap(map);
        print("your score is : ${score.gameScore}");
      }
      if (event == Events.down) {
        snake.updateCoordinates(
            Coordinates(x: snake.coordinates!.x, y: snake.coordinates!.y + 1),
            food);
        console.clearScreen();
        gui.printMap(map);
        print("your score is : ${score.gameScore}");
      }
      if (event == Events.right) {
        snake.updateCoordinates(
            Coordinates(x: snake.coordinates!.x + 1, y: snake.coordinates!.y),
            food);
        console.clearScreen();
        gui.printMap(map);
        print("your score is : ${score.gameScore} ");
      }
      if (event == Events.left) {
        snake.updateCoordinates(
            Coordinates(x: snake.coordinates!.x - 1, y: snake.coordinates!.y),
            food);
        console.clearScreen();
        gui.printMap(map);
        print("your score is : ${score.gameScore}");
      }
    } catch (_) {
      print("Game over");
      exit(255);
    }
  });

}
