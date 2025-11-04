import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/models.dart';
import '../utils/formatters.dart';
import 'main_screen.dart'; // Import để dùng typedef

class TransactionListScreen
    extends StatefulWidget {
  final OnRefreshAndNavigate refreshData;
  const TransactionListScreen({
    super.key,
    required this.refreshData,
  });

  @override
  State<TransactionListScreen> createState() =>
      _TransactionListScreenState();
}

class _TransactionListScreenState
    extends State<TransactionListScreen> {
  String _searchQuery = '';
  List<Transaction> _filteredTransactions = [];

  @override
  void initState() {
    super.initState();
    _filteredTransactions = danhSachGiaoDich;
  }

  void _filterTransactions(String query) {
    final lowerCaseQuery = query.toLowerCase();
    setState(() {
      _searchQuery = query;
      _filteredTransactions = danhSachGiaoDich
          .where((gd) {
            final titleLower = gd.title
                .toLowerCase();
            final categoryLower = gd.category
                .toLowerCase();
            return titleLower.contains(
                  lowerCaseQuery,
                ) ||
                categoryLower.contains(
                  lowerCaseQuery,
                );
          })
          .toList();
    });
  }

  @override
  void didUpdateWidget(
    covariant TransactionListScreen oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    _filterTransactions(_searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    danhSachGiaoDich.sort(
      (a, b) => b.date.compareTo(a.date),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF4CAF50),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lịch sử giao dịch',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: _filterTransactions,
                  decoration: InputDecoration(
                    hintText:
                        'Search transactions...',
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                            30,
                          ),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(
                          vertical: 0,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Danh sách giao dịch (${_filteredTransactions.length})',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child:
                _filteredTransactions.isEmpty &&
                    _searchQuery.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: const [
                        Icon(
                          Icons.inbox,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Chưa có giao dịch nào',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                : _filteredTransactions.isEmpty &&
                      _searchQuery.isNotEmpty
                ? const Center(
                    child: Text(
                      'Không tìm thấy giao dịch nào',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    itemCount:
                        _filteredTransactions
                            .length,
                    itemBuilder: (context, index) {
                      Transaction gd =
                          _filteredTransactions[index];
                      Category
                      cat = danhSachDanhMuc
                          .firstWhere(
                            (c) =>
                                c.name ==
                                gd.category,
                            orElse: () =>
                                danhSachDanhMuc
                                    .last,
                          );
                      // Widget này khác với Widget ở HomeScreen một chút
                      // (có thêm ngày tháng) nên ta giữ nguyên nó ở đây
                      return _buildTransactionItem(
                        gd,
                        cat,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // Widget này chỉ dùng riêng cho TransactionListScreen
  // vì nó có hiển thị ngày tháng, khác với ở HomeScreen
  Widget _buildTransactionItem(
    Transaction gd,
    Category cat,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
                  '${cat.name} - ${gd.date.day}/${gd.date.month}/${gd.date.year}',
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
