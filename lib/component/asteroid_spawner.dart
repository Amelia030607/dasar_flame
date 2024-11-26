import 'dart:async';
import 'dart:math' as math;

import 'package:dasar_flame/component/asteroid.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class AsteroidSpawner extends PositionComponent with HasGameRef {
  late SpawnComponent spawner; 

  @override
  FutureOr<void> onLoad() { // Fungsi ini dipanggil saat komponen dimuat ke dalam game
    math.Random r = math.Random(); 
    
    spawner = SpawnComponent(
      factory: (idx) { //factory = pabrik, properti yang digunakan untuk membuat spawn componen baru
        return Asteroid(ukuran: r.nextDouble() * 0.5 + 0.3, ); // Membuat asteroid dengan ukuran acak antara 0.3 hingga 0.8
      },
      period: 0.5, // Interval waktu dalam detik untuk memunculkan asteroid baru (setiap 0.5 detik)
      autoStart: true,// Secara otomatis memulai proses spawn setelah komponen dimuat
      area: Rectangle.fromLTWH(0, 0, game.size.x, game.size.y), // Area tempat asteroid dapat muncul, meliputi seluruh ukuran layar game
      within: false,// jarak penambahan spawn komponen baru, dalam satuan detik
    );

    game.add(spawner); // Menambahkan `spawner` ke dalam game, sehingga aktif dalam siklus game
    return super.onLoad(); // Memanggil implementasi `onLoad` dari superclass untuk melanjutkan proses
  }
}
