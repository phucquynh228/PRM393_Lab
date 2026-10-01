import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CoreWidgetsDemo(),
  ));
}

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Thanh tiêu đề (AppBar)
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      // 2. Phần thân cho phép cuộn (SingleChildScrollView)
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Canh giữa các thành phần
          children: [

            // 3. Widget Text
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Tạo khoảng cách 20 pixel

            // 4. Widget Icon
            const Icon(
              Icons.movie,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),

            // 5. Widget Image lấy từ Internet
            Image.network(
              'https://picsum.photos/400/200', // Link ảnh mẫu ngẫu nhiên
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover, // Cắt cúp ảnh cho vừa vặn
            ),
            const SizedBox(height: 20),

            // 6. Widget Card chứa ListTile
            const Card(
              elevation: 4, // Độ đổ bóng
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.orange), // Icon bên trái
                title: Text('Movie Item'), // Tiêu đề chính
                subtitle: Text('This is a sample ListTile inside a Card.'), // Tiêu đề phụ
              ),
            ),

          ],
        ),
      ),
    );
  }
}