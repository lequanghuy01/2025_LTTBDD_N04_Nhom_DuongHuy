import 'package:flutter/material.dart';
import 'add_transaction_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'statistics_screen.dart';
import 'transaction_list_screen.dart';

// ============================================
// MAIN SCREEN VỚI BOTTOM NAVIGATION
// ============================================
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() =>
      _MainScreenState();
}

typedef OnRefreshAndNavigate =
    void Function({int? navigateIndex});

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late List<Widget> screens;

  void _refreshAllScreens({int? navigateIndex}) {
    setState(() {
      if (navigateIndex != null) {
        currentIndex = navigateIndex;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(
        refreshData: _refreshAllScreens,
      ), // Index 0: Trang chủ
      TransactionListScreen(
        refreshData: _refreshAllScreens,
      ), // Index 1: Giao dịch
      const SizedBox.shrink(), // Index 2: Placeholder cho nút Add (+)
      const StatisticsScreen(), // Index 3: Thống kê
      const ProfileScreen(), // Index 4: Hồ sơ
    ];
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = (currentIndex == 2)
        ? Container()
        : screens[currentIndex];

    return Scaffold(
      body: currentScreen,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const AddTransactionScreen(),
                ),
              ).then((_) {
                _refreshAllScreens();
              });
            } else {
              setState(() {
                currentIndex = index;
              });
            }
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(
            0xFF1B5E20,
          ),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history_toggle_off,
              ),
              activeIcon: Icon(Icons.history),
              label: 'Giao dịch',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                size: 40,
                color: Color(0xFF1B5E20),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_outlined,
              ),
              activeIcon: Icon(Icons.bar_chart),
              label: 'Thống kê',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Hồ sơ',
            ),
          ],
        ),
      ),
    );
  }
}
