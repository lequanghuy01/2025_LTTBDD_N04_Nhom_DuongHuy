import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/models.dart';
import '../utils/formatters.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double thuNhap = tinhTongThuNhap();
    double chiTieu = tinhTongChiTieu();
    double soDu = tinhSoDu();

    Map<String, double> chiTieuTheoDanhMuc = {};
    for (var gd in danhSachGiaoDich) {
      if (!gd.isIncome) {
        chiTieuTheoDanhMuc[gd.category] =
            (chiTieuTheoDanhMuc[gd.category] ??
                0) +
            gd.amount;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: const Text(
          'Thống Kê',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    'Tháng ${DateTime.now().month}/${DateTime.now().year}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formatTien(soDu),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              formatTien(thuNhap),
                              style:
                                  const TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    color: Color(
                                      0xFF2E7D32,
                                    ),
                                  ),
                            ),
                            Text(
                              'Thu nhập',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors
                                    .grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              formatTien(chiTieu),
                              style:
                                  const TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    color: Color(
                                      0xFFD32F2F,
                                    ),
                                  ),
                            ),
                            Text(
                              'Chi tiêu',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors
                                    .grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Chi tiêu theo danh mục',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
              itemCount:
                  chiTieuTheoDanhMuc.length,
              itemBuilder: (context, index) {
                String tenDanhMuc =
                    chiTieuTheoDanhMuc.keys
                        .elementAt(index);
                double soTien =
                    chiTieuTheoDanhMuc[tenDanhMuc]!;
                Category cat = danhSachDanhMuc
                    .firstWhere(
                      (c) => c.name == tenDanhMuc,
                      orElse: () =>
                          danhSachDanhMuc.last,
                    );

                return Container(
                  padding: const EdgeInsets.all(
                    15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Icon(
                        cat.icon,
                        size: 40,
                        color: cat.color,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        tenDanhMuc,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formatTien(soTien),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.bold,
                          color: cat.color,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
