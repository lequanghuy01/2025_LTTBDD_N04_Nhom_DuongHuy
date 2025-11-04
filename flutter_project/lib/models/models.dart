import 'package:flutter/material.dart';

// ============================================
// DATA MODELS
// ============================================
class Transaction {
  String id;
  String title;
  double amount;
  String category;
  DateTime date;
  bool isIncome;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.isIncome,
  });
}

class Category {
  String name;
  IconData icon;
  Color color;

  Category({
    required this.name,
    required this.icon,
    required this.color,
  });
}
