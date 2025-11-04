import 'package:flutter/material.dart';

class MemberInfoScreen extends StatelessWidget {
  const MemberInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FBF6),
      appBar: AppBar(
        title: const Text(
          'Giới thiệu thành viên',
        ),
        backgroundColor: const Color(0xFF1ABC9C),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            _buildMemberCard(
              name: 'Lê Quang Huy',
              mssv: '23010150',
              className:
                  'Lập trình thiết bị di động-1-1-25(NO4)',
              instructor: 'Nguyễn Xuân Quế',
            ),
            const SizedBox(height: 20),
            _buildMemberCard(
              name: 'Trần Văn Dương',
              mssv:
                  '23010244', // (Theo yêu cầu của bạn)
              className:
                  'Lập trình thiết bị di động-1-1-25(NO4)',
              instructor: 'Nguyễn Xuân Quế',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberCard({
    required String name,
    required String mssv,
    required String className,
    required String instructor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B5E20),
            ),
          ),
          const Divider(height: 20),
          _buildInfoRow('MSSV:', mssv),
          _buildInfoRow('Lớp:', className),
          _buildInfoRow(
            'Giảng viên:',
            instructor,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
