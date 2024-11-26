import 'dart:async';

import 'package:dasar_flame/component/ship.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/widgets.dart';

class Bgparallaxcomponent extends ParallaxComponent with HasGameRef {
  // Daftar gambar yang digunakan untuk parallax background
  final _parallelImage = [
    ParallaxImageData("parallax/bkgd_0.png"), // Layer paling belakang
    ParallaxImageData("parallax/bkgd_1.png"),
    ParallaxImageData("parallax/bkgd_2.png"),
    ParallaxImageData("parallax/bkgd_3.png"),
    ParallaxImageData("parallax/bkgd_4.png"),
    ParallaxImageData("parallax/bkgd_5.png"),
    ParallaxImageData("parallax/bkgd_6.png"), // Layer paling depan
  ];

  @override
  FutureOr<void> onLoad() async {
    // Dipanggil saat komponen dimuat ke dalam game
    // Membuat efek parallax dengan gambar-gambar dari _parallelImage
    parallax = await game.loadParallax(
      _parallelImage, // Gambar-gambar untuk parallax
      baseVelocity: Vector2(0, 0), // Kecepatan awal dari parallax
      velocityMultiplierDelta: Vector2(1.5, 1.5), // Perbedaan kecepatan antar layer
      repeat: ImageRepeat.repeat, // Mengulangi gambar jika layar lebih besar
    );
  }

  void changeSpeedBasedShip(Ship player) {
    // Mengubah kecepatan parallax berdasarkan arah dan kecepatan dari ship
    if (parallax != null) {
      parallax!.baseVelocity = player.arah * 10; // Mengalikan arah ship dengan faktor 10
    }
  }
}
