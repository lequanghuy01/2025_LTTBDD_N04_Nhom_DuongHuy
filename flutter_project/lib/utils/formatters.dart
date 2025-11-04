String formatTien(double amount) {
  final String amountStr = amount.toStringAsFixed(
    0,
  );
  final RegExp reg = RegExp(
    r'(\d{1,3})(?=(\d{3})+(?!\d))',
  );
  return amountStr.replaceAllMapped(
        reg,
        (Match match) => '${match[1]}.',
      ) +
      ' VNĐ';
}
