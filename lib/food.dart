import 'dart:math';

import 'package:snake_game/coordinates.dart';
import 'package:snake_game/snake.dart';

class Food {
  Coordinates? coordinates;
  Snake snake;
  List<List<String>> map;
  Food(this.map,this.snake) {
    putFood();
  }
  putFood() {
    Random random = Random();
    int len = map.length;
    int randomX = random.nextInt(len);
    int randomY = random.nextInt(len);
    map[randomY][randomX] = " 🥚 ";
    coordinates = Coordinates(x: randomX, y: randomY);

  }
}
