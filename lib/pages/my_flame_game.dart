import 'dart:async';

// Import komponen yang digunakan dalam game
import 'package:dasar_flame/component/asteroid_spawner.dart';
import 'package:dasar_flame/component/bgParallaxComponent.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s; // Objek kapal yang dikontrol pemain
  late Bgparallaxcomponent bgParallax; // Komponen latar belakang dengan efek parallax
  late AsteroidSpawner asp; // Komponen untuk memunculkan asteroid secara berkala

  @override
  FutureOr<void> onLoad() async {// Fungsi ini dipanggil saat game dimuat

    bgParallax = Bgparallaxcomponent(); // Inisialisasi latar belakang parallax
    add(bgParallax); // Menambahkan latar belakang ke dalam game

    asp = AsteroidSpawner(); // Inisialisasi komponen pemuncul asteroid
    add(asp); // Menambahkan komponen pemuncul asteroid ke dalam game

    s = Ship(); // Inisialisasi kapal pemain
    add(s); // Menambahkan kapal pemain ke dalam game
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    s.setTujuan(info); // Mengatur tujuan kapal berdasarkan lokasi yang di-drag oleh pemain
  }

  @override
  void update(double dt) {
    bgParallax.changeSpeedBasedShip(s); // Mengubah kecepatan parallax sesuai dengan arah dan kecepatan kapal
    super.update(dt); // Memanggil update dari superclass untuk memperbarui komponen lain
  }
}
