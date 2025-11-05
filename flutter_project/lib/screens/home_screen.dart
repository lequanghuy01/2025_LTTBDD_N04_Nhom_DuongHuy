import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/models.dart';
import '../utils/formatters.dart';
import '../widgets/transaction_item.dart';
import 'main_screen.dart';

class HomeScreen extends StatelessWidget {
  final OnRefreshAndNavigate refreshData;
  const HomeScreen({
    super.key,
    required this.refreshData,
  });

  @override
  Widget build(BuildContext context) {
    danhSachGiaoDich.sort(
      (a, b) => b.date.compareTo(a.date),
    );
    double thuNhap = tinhTongThuNhap();
    double chiTieu = tinhTongChiTieu();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 40,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(
                    30,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: const [
                          Text(
                            'Chào mừng trở lại,',
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  Colors.white70,
                            ),
                          ),
                          Text(
                            'Nguyễn Văn A',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight:
                                  FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(
                            20,
                          ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        const Text(
                          'Tổng số dư (Amount)',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          formatTien(tinhSoDu()),
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight:
                                FontWeight.bold,
                            color: Color(
                              0xFF1B5E20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.all(
                                      15,
                                    ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(
                                        0xFFE8F5E9,
                                      ),
                                  borderRadius:
                                      BorderRadius.circular(
                                        15,
                                      ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [
                                    const Text(
                                      'Thu Nhập',
                                      style: TextStyle(
                                        fontSize:
                                            14,
                                        color: Color(
                                          0xFF1B5E20,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      formatTien(
                                        thuNhap,
                                      ),
                                      style: const TextStyle(
                                        fontSize:
                                            18,
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                        color: Color(
                                          0xFF1B5E20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.all(
                                      15,
                                    ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(
                                        0xFFFBE9E7,
                                      ),
                                  borderRadius:
                                      BorderRadius.circular(
                                        15,
                                      ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [
                                    const Text(
                                      'Chi Tiêu',
                                      style: TextStyle(
                                        fontSize:
                                            14,
                                        color: Color(
                                          0xFFD32F2F,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      formatTien(
                                        chiTieu,
                                      ),
                                      style: const TextStyle(
                                        fontSize:
                                            18,
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                        color: Color(
                                          0xFFD32F2F,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                10,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                children: [
                  const Text(
                    'Giao dịch gần đây',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      refreshData(
                        navigateIndex: 1,
                      );
                    },
                    child: const Text(
                      'Xem tất cả',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1B5E20),
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              itemCount:
                  danhSachGiaoDich.length > 5
                  ? 5
                  : danhSachGiaoDich.length,
              itemBuilder: (context, index) {
                Transaction gd =
                    danhSachGiaoDich[index];
                Category cat = danhSachDanhMuc
                    .firstWhere(
                      (c) =>
                          c.name == gd.category,
                      orElse: () =>
                          danhSachDanhMuc.last,
                    );
                // Sử dụng Widget mới
                return TransactionItem(
                  gd: gd,
                  cat: cat,
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
