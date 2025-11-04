import 'package:flutter/material.dart';
import 'language_screen.dart';
import 'login_screen.dart';
import 'member_info_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {
  // Biến state để quản lý công tắc "Thông báo"
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    // Màu nền từ ảnh
    const Color backgroundColor = Color(
      0xFFF0FBF6,
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      // AppBar tùy chỉnh
      appBar: AppBar(
        title: const Text(
          'Hồ Sơ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // Header thông tin người dùng
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(
                  0xFF1ABC9C,
                ), // Màu xanh lá
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    // Bạn có thể thay bằng Image.asset nếu có ảnh
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Color.fromARGB(
                        149,
                        20,
                        140,
                        130,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Nguyễn Văn A',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'NguyenVanA@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Nhóm "Tài khoản"
            _buildSectionHeader('Tài khoản'),
            _buildMenuCard(
              children: [
                _buildMenuItem(
                  icon: Icons.people_outline,
                  title: 'Giới thiệu thành viên',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const MemberInfoScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.lock_outline,
                  title: 'Thay đổi mật khẩu',
                  onTap: () {
                    // TODO: Thêm chức năng
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Chức năng chưa được cài đặt',
                        ),
                      ),
                    );
                  },
                ),
                // Sử dụng SwitchListTile cho mục có công tắc
                SwitchListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                  secondary: const Icon(
                    Icons
                        .notifications_none_outlined,
                    color: Colors.grey,
                  ),
                  title: const Text(
                    'Thông báo',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  value: _notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _notificationsEnabled =
                          value;
                    });
                  },
                  activeColor: const Color(
                    0xFF1ABC9C,
                  ),
                ),
              ],
            ),

            // Nhóm "Tùy chọn"
            _buildSectionHeader('Tùy chọn'),
            _buildMenuCard(
              children: [
                _buildMenuItem(
                  icon: Icons.language_outlined,
                  title: 'Ngôn ngữ',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LanguageScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),

            // Nhóm "Cái khác"
            _buildSectionHeader('Cái khác'),
            _buildMenuCard(
              children: [
                _buildMenuItem(
                  icon: Icons.help_outline,
                  title: 'Giúp đỡ và hỗ trợ',
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Chức năng chưa được cài đặt',
                        ),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: 'Đăng xuất',
                  color: Colors
                      .red, // Làm nổi bật màu đỏ
                  onTap: () {
                    // Quay về LoginScreen và xóa tất cả các màn hình cũ
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen(),
                      ),
                      (Route<dynamic> route) =>
                          false, // Xóa hết stack
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget build tiêu đề cho mỗi nhóm
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 8.0,
        left: 8.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  // Widget build thẻ (Card) trắng chứa các mục
  Widget _buildMenuCard({
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      // ClipRRect để bo tròn các widget con bên trong
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          // Thêm vạch ngăn cách giữa các mục
          children: ListTile.divideTiles(
            context: context,
            tiles: children,
          ).toList(),
        ),
      ),
    );
  }

  // Widget build cho mỗi mục menu (ngoại trừ cái có Switch)
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Color? color, // Tùy chọn màu (cho Đăng xuất)
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      leading: Icon(
        icon,
        color: color ?? Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: color ?? Colors.grey[400],
      ),
      onTap: onTap,
    );
  }
}
