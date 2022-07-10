class Coordinates {
  final int x;
  final int y;
  const Coordinates({required this.x, required this.y});

  @override
  String toString() {
    return '{$x,$y}';
  }
}
