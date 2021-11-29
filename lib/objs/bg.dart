import 'package:flame/components.dart';

class Bg extends SpriteComponent {
  move(double dt, double speed, double limit, double posy) {
    y += speed * dt;

    if (y >= limit) {
      y = posy;
    }
  }
}
