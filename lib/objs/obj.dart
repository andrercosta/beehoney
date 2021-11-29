import 'dart:math';

import 'package:flame/components.dart';

class Obj extends SpriteComponent with HasHitboxes, Collidable {
  int timer = 0;
  int img = 1;
  String name = "";

  double radom(int min, int max) {
    var r = Random();
    int result = min + r.nextInt(max - min);
    return double.parse(result.toString());
  }

  Future<void> animation(double time, double spriteLimite) async {
    timer += 1;
    if (timer >= time) {
      timer = 0;
      img += 1;
    }

    if (img > spriteLimite) {
      img = 1;
    }
    sprite = await Sprite.load('$name$img.png');
  }
}
