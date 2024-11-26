import 'dart:async';

import 'package:flame/components.dart';

class Asteroid extends SpriteComponent with HasGameRef {
  double ukuran = 0.5; // Menyimpan ukuran asteroid (skala)

  // Konstruktor untuk menetapkan nilai awal ukuran dan skala asteroid
  Asteroid({required this.ukuran}) {
    scale = Vector2(ukuran, ukuran); // Mengatur skala asteroid berdasarkan nilai ukuran
  }

  @override
  FutureOr<void> onLoad() async {
    // Fungsi yang dipanggil saat komponen asteroid dimuat ke dalam game
    sprite = await game.loadSprite("meteor/spaceMeteors_001.png");
    // Memuat sprite asteroid dari file gambar

    anchor = Anchor.center; 
    // Mengatur titik rotasi dan posisi sebagai pusat asteroid
  }
}
