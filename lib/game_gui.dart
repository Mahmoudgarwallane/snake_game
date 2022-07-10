import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:snake_game/food.dart';
import 'package:snake_game/snake.dart';

class GameGui {
  List<List<String>> generateMap(int count) {
    List<List<String>> map = List.generate(
        count, (index) => List.generate(count * 2, (index) => " - "));
    return map;
  }

  printMap(List<List<String>> map) {
    map.forEach((list) {
      list.forEach((element) {
        stdout.write(element);
      });
      print("\n");
    });
  }
}
