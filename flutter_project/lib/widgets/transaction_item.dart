import 'package:flutter/material.dart';
import '../models/models.dart';
import '../utils/formatters.dart';

class TransactionItem extends StatelessWidget {
  final Transaction gd;
  final Category cat;

  const TransactionItem({
    super.key,
    required this.gd,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: cat.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Icon(
              cat.icon,
              color: cat.color,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  gd.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cat.name,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${gd.isIncome ? '+' : '-'}${formatTien(gd.amount)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: gd.isIncome
                  ? const Color(0xFF1B5E20)
                  : const Color(0xFFD32F2F),
            ),
          ),
        ],
      ),
    );
  }
}
