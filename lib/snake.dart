import 'dart:math';

import 'package:dart_console/dart_console.dart';
import 'package:snake_game/score.dart';

import 'coordinates.dart';
import 'food.dart';

class Snake {
  Coordinates? coordinates;
  List<List<String>> map;
  Score score;
  Snake(this.map, this.score) {
    _putSnake(map);
  }

  _putSnake(List<List<String>> map) {
    Random random = Random();
    int len = map.length;
    int randomX = random.nextInt(len);
    int randomY = random.nextInt(len);
    map[randomY][randomX] = " 🐍 ";
    coordinates = Coordinates(x: randomX, y: randomY);
  }

  void updateCoordinates(Coordinates coordinates, Food food) {
    if (coordinates.toString() == food.coordinates.toString()) {
      food.putFood();
      score.incrementScore();
    }
    map[this.coordinates!.y][this.coordinates!.x] = " - ";
    map[coordinates.y][coordinates.x] = " 🐍 ";
    this.coordinates = coordinates;
  }
}
