import 'package:beehoney/game/util/utils.dart';
import 'package:flame/components.dart';

import 'flower.dart';
import 'obj.dart';
import 'spider.dart';

class Bee extends Obj {
  bool right = false;
  bool left = false;

  Bee() {
    name = "bee";
  }

  void move(double dt, double speed) {
    if (right) {
      if (x <= 475) {
        x += speed * dt;
      }
    }
    if (left) {
      if (x >= 25) {
        x -= speed * dt;
      }
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is Spider) {
      other.y = -100;
      lifes--;
      if (lifes <= 0) {
        gameOver = true;
      }
    }
    if (other is Flower) {
      other.y = -100;
      other.x = radom(50, 500);
      score++;
    }
    super.onCollision(intersectionPoints, other);
  }
}
