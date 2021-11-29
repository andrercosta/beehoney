import 'bee.dart';
import 'obj.dart';

class Spider extends Obj {
  Spider() {
    name = "spider";
  }

  void move(double dt, Bee bee) {
    y += 80 * dt;
    if (y >= 950) {
      y = -50;
    }

    if (x < bee.x) {
      x += 2;
    } else if (x > bee.x) {
      x -= 2;
    }
  }
}
