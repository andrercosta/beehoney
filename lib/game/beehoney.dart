import 'package:beehoney/game/util/utils.dart';
import 'package:beehoney/objs/game_text.dart';
import 'package:beehoney/objs/objs.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BeeHoney extends FlameGame with KeyboardEvents, HasCollidables {
  Bg bg = Bg();
  Bg bg2 = Bg();
  Bee bee = Bee();
  Spider spider = Spider();
  Flower flower = Flower();
  GameText textScore = GameText("Score: ", 10, 10, Colors.black, 30);
  GameText textLifes = GameText("Lifes: ", 380, 10, Colors.black, 30);

  @override
  Future<void>? onLoad() async {
    bg
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, 0);

    add(bg);
    bg2
      ..sprite = await Sprite.load("bg.png")
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, -900);

    add(bg2);

    bee
      ..sprite = await Sprite.load("bee1.png")
      ..size = Vector2.all(50)
      ..position = Vector2(250, 500)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    add(bee);

    spider
      ..sprite = await Sprite.load("spider1.png")
      ..size = Vector2.all(80)
      ..position = Vector2(250, 200)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    add(spider);

    flower
      ..sprite = await Sprite.load("florwer1.png")
      ..size = Vector2.all(30)
      ..position = Vector2(200, 400)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    add(flower);

    add(textScore);
    add(textLifes);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    bg.move(dt, 100, 900, 0);
    bg2.move(dt, 100, 0, -900);
    bee.move(dt, 300);
    bee.animation(8, 4);

    spider.animation(8, 4);
    spider.move(dt, bee);

    flower.move(dt, 110);
    flower.animation(8, 2);

    if (gameOver) {
      pauseEngine();
      overlays.add("GameOver");
    }
    textScore.text = "Score: $score";
    textLifes.text = "Lifes: $lifes";

    super.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event.data.keyLabel == "a") {
      bee.left = true;
    } else {
      bee.left = false;
    }
    if (event.data.keyLabel == "d") {
      bee.right = true;
    } else {
      bee.right = false;
    }
    return super.onKeyEvent(event, keysPressed);
  }
}
