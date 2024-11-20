import 'dart:async';

//import 'package:dasar_flame/component/asteroid.dart';
import 'package:dasar_flame/component/asteroid_spawner.dart';
import 'package:dasar_flame/component/bgParallaxComponent.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;
  late Bgparallaxcomponent bgParallax;
  late AsteroidSpawner asp;

  FutureOr<void> onLoad() async {
    bgParallax = Bgparallaxcomponent();
    add(bgParallax);

    asp = AsteroidSpawner();
    add(asp);

    s = Ship();
    add(s);
  }

  void onPanUpdate(DragUpdateInfo info) {
    s.setTujuan(info);
  }

  void update(double dt) {
    bgParallax.changeSpeedBasedShip(s);
    super.update(dt);
  }
}
