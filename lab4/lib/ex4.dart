import 'package:flutter/material.dart';

void main() {
  runApp(const AppStructureThemeDemo()); // Chạy thẳng vào Bài 4
}

// 1. StatefulWidget bọc ngoài cùng để quản lý trạng thái Theme cho cả ứng dụng
class AppStructureThemeDemo extends StatefulWidget {
  const AppStructureThemeDemo({super.key});

  @override
  State<AppStructureThemeDemo> createState() => _AppStructureThemeDemoState();
}

class _AppStructureThemeDemoState extends State<AppStructureThemeDemo> {
  // Biến lưu trữ trạng thái Theme (mặc định là Light - Sáng)
  ThemeMode _themeMode = ThemeMode.light;

  // Hàm thay đổi Theme
  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 2. Cài đặt ThemeData cho chế độ sáng và tối
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue, // Bạn có thể đổi màu sắc ở đây nếu muốn
      ),

      // Áp dụng themeMode hiện tại đang được lưu trong biến _themeMode
      themeMode: _themeMode,

      // Khởi tạo màn hình chính và truyền dữ liệu/hàm xuống
      home: Exercise4Screen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

// 3. Màn hình giao diện chính
class Exercise4Screen extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const Exercise4Screen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Sử dụng Scaffold để định hình cấu trúc màn hình
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure'),
        actions: [
          // Nút gạt (Switch) nằm trên thanh AppBar để chuyển đổi Dark Mode
          Row(
            children: [
              const Text('Dark'),
              Switch(
                value: isDarkMode,
                onChanged: onThemeChanged,
                activeColor: Colors.white,
              ),
            ],
          ),
        ],
      ),

      // Phần thân (Body)
      body: const Center(
        child: Text(
          'This is a simple screen with theme toggle.',
          style: TextStyle(fontSize: 16),
        ),
      ),

      // Nút FloatingActionButton (FAB) ở góc phải bên dưới
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Bấm nút này hiện tại chưa có hành động gì, có thể in ra console để test
          print('FAB clicked!');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}