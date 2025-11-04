import 'package:flutter/material.dart';
import '../models/models.dart'; // Import file models.dart

// ============================================
// DANH SÁCH DỮ LIỆU TOÀN CỤC
// ============================================
List<Category> danhSachDanhMuc = [
  Category(
    name: 'Ăn uống',
    icon: Icons.restaurant,
    color: Colors.orange,
  ),
  Category(
    name: 'Di chuyển',
    icon: Icons.directions_car,
    color: Colors.blue,
  ),
  Category(
    name: 'Mua sắm',
    icon: Icons.shopping_bag,
    color: Colors.pink,
  ),
  Category(
    name: 'Giải trí',
    icon: Icons.movie,
    color: Colors.purple,
  ),
  Category(
    name: 'Lương',
    icon: Icons.account_balance_wallet,
    color: Colors.green,
  ),
  Category(
    name: 'Học tập',
    icon: Icons.school,
    color: Colors.indigo,
  ),
  Category(
    name: 'Sức khỏe',
    icon: Icons.local_hospital,
    color: Colors.red,
  ),
  Category(
    name: 'Khác',
    icon: Icons.more_horiz,
    color: Colors.grey,
  ),
];

List<Transaction> danhSachGiaoDich = [
  Transaction(
    id: '1',
    title: 'Lương tháng 10',
    amount: 15000000,
    category: 'Lương',
    date: DateTime(2025, 10, 1),
    isIncome: true,
  ),
  Transaction(
    id: '2',
    title: 'Ăn trưa',
    amount: 50000,
    category: 'Ăn uống',
    date: DateTime.now().subtract(
      const Duration(minutes: 1),
    ),
    isIncome: false,
  ),
  Transaction(
    id: '3',
    title: 'Cafe sáng',
    amount: 25000,
    category: 'Ăn uống',
    date: DateTime.now().subtract(
      const Duration(minutes: 2),
    ),
    isIncome: false,
  ),
  Transaction(
    id: '4',
    title: 'Xăng xe',
    amount: 200000,
    category: 'Di chuyển',
    date: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    isIncome: false,
  ),
  Transaction(
    id: '5',
    title: 'Xem phim',
    amount: 150000,
    category: 'Giải trí',
    date: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    isIncome: false,
  ),
];

// ============================================
// HÀM TÍNH TOÁN
// ============================================
double tinhTongThuNhap() {
  double tong = 0;
  for (var gd in danhSachGiaoDich) {
    if (gd.isIncome) {
      tong += gd.amount;
    }
  }
  return tong;
}

double tinhTongChiTieu() {
  double tong = 0;
  for (var gd in danhSachGiaoDich) {
    if (!gd.isIncome) {
      tong += gd.amount;
    }
  }
  return tong;
}

double tinhSoDu() {
  return tinhTongThuNhap() - tinhTongChiTieu();
}
