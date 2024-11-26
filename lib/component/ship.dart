import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent with TapCallbacks {
  late Vector2 tujuan; // Untuk menyimpan koordinat tujuan yang ditentukan oleh pengguna melalui tap/klik
  late Vector2 arah; // Untuk menyimpan arah pergerakan ship
  double speed = 3.0; // Kecepatan pergerakan ship

  @override
  void onMount() {
    // Dipanggil saat komponen ship dipasang ke game
    arah = Vector2(0, 0); // Memberikan nilai awal pada arah untuk mencegah error
    tujuan = position; // Tujuan awal adalah posisi awal ship
    super.onMount(); // Memanggil metode onMount dari superclass
  }

  void setTujuan(DragUpdateInfo info) {
    // Mengatur tujuan baru berdasarkan lokasi tap pengguna
    tujuan = info.eventPosition.global; // Menyimpan koordinat tujuan baru
    lookAt(tujuan); // Mengarahkan sudut pandang ship ke tujuan
    angle += pi; // Menyesuaikan sudut agar ship terlihat menghadap ke arah yang benar
    arah = tujuan - position; // Menghitung vektor arah ke tujuan
    arah = arah.normalized(); // Menormalisasi vektor arah agar satuan pergerakannya konsisten
  }

  @override
  FutureOr<void> onLoad() async {
    // Dipanggil saat komponen ship dimuat ke dalam game
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png")); // Memuat gambar sprite ship
    position = Vector2(100, 100); // Menetapkan posisi awal ship
    angle = -pi / 2; // Mengatur sudut awal ship
    anchor = Anchor.center; // Menetapkan titik pusat ship sebagai anchor untuk rotasi
  }

  @override
  void update(double dt) {
    // Dipanggil secara berkala untuk memperbarui posisi ship
    if ((tujuan - position).length < speed) {
      // Jika ship sudah dekat dengan tujuan
      position = tujuan; // Hentikan di posisi tujuan
      arah = Vector2(0, 0); // Set arah menjadi 0 agar ship berhenti bergerak
    }
    position.add(arah * speed); // Memperbarui posisi ship dengan pergerakan arah * kecepatan
    super.update(dt); // Memanggil metode update dari superclass
  }

  Ship() {
    // Konstruktor Ship
    arah = Vector2(0, 0); // Inisialisasi arah dengan vektor nol
    tujuan = position; // Inisialisasi tujuan sebagai posisi awal
  }
}
