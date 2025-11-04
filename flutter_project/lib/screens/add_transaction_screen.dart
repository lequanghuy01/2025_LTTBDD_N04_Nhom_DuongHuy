import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/models.dart';

class AddTransactionScreen
    extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState
    extends State<AddTransactionScreen> {
  var ctrlTieuDe = TextEditingController();
  var ctrlSoTien = TextEditingController();
  String danhMucDuocChon = 'Ăn uống';
  bool isIncome = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: const Text(
          'Thêm Giao Dịch',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              'Tiêu đề',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: ctrlTieuDe,
              decoration: InputDecoration(
                hintText: 'Nhập tiêu đề...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Số tiền',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: ctrlSoTien,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Nhập số tiền...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Danh mục',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(15),
              ),
              child: DropdownButton<String>(
                value: danhMucDuocChon,
                isExpanded: true,
                underline: const SizedBox(),
                items: danhSachDanhMuc.map((cat) {
                  return DropdownMenuItem(
                    value: cat.name,
                    child: Row(
                      children: [
                        Icon(
                          cat.icon,
                          color: cat.color,
                        ),
                        const SizedBox(width: 10),
                        Text(cat.name),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    danhMucDuocChon = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Loại giao dịch',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isIncome = true;
                      });
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.all(
                            15,
                          ),
                      decoration: BoxDecoration(
                        color: isIncome
                            ? const Color(
                                0xFF81C784,
                              )
                            : Colors.white,
                        borderRadius:
                            BorderRadius.circular(
                              15,
                            ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [
                          Icon(
                            isIncome
                                ? Icons
                                      .check_circle
                                : Icons
                                      .circle_outlined,
                            color: isIncome
                                ? Colors.white
                                : Colors.grey,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Thu nhập',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              color: isIncome
                                  ? Colors.white
                                  : Colors
                                        .black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isIncome = false;
                      });
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.all(
                            15,
                          ),
                      decoration: BoxDecoration(
                        color: !isIncome
                            ? const Color(
                                0xFFE57373,
                              )
                            : Colors.white,
                        borderRadius:
                            BorderRadius.circular(
                              15,
                            ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [
                          Icon(
                            !isIncome
                                ? Icons
                                      .check_circle
                                : Icons
                                      .circle_outlined,
                            color: !isIncome
                                ? Colors.white
                                : Colors.grey,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Chi tiêu',
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              color: !isIncome
                                  ? Colors.white
                                  : Colors
                                        .black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String tieuDe = ctrlTieuDe.text;
                double soTien =
                    double.tryParse(
                      ctrlSoTien.text,
                    ) ??
                    0;

                if (tieuDe.isEmpty ||
                    soTien == 0) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Vui lòng nhập đầy đủ thông tin!',
                      ),
                    ),
                  );
                  return;
                }

                Transaction giaoDichMoi =
                    Transaction(
                      id: DateTime.now()
                          .millisecondsSinceEpoch
                          .toString(),
                      title: tieuDe,
                      amount: soTien,
                      category: danhMucDuocChon,
                      date: DateTime.now(),
                      isIncome: isIncome,
                    );

                danhSachGiaoDich.insert(
                  0,
                  giaoDichMoi,
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                  0xFF2E7D32,
                ),
                minimumSize: const Size(
                  double.infinity,
                  55,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Lưu Giao Dịch',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
