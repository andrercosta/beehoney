import 'obj.dart';

class Flower extends Obj {
  Flower() {
    name = "florwer";
  }

  void move(double dt, double speed) {
    y += speed * dt;

    if (y > 900) {
      y = -50;
      x = radom(50, 500);
    }
  }
}
