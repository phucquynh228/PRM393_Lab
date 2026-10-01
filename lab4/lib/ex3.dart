import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LayoutDemo(), // Chạy thẳng vào Bài 3
  ));
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  // Danh sách các tựa phim mẫu
  final List<String> movies = const ['Avatar', 'Inception', 'Interstellar', 'Joker'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 – Layout Demo'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      // 1. Dùng Padding bọc bên ngoài để tạo khoảng cách nhất quán (16px) cho toàn màn hình
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // 2. Dùng Column để bố cục các phần tử từ trên xuống dưới
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Canh lề trái cho các phần tử con
          children: [

            // Tiêu đề của mục
            const Text(
              'Now Playing',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            // 3. Dùng SizedBox để tạo khoảng cách (16px) giữa tiêu đề và danh sách
            const SizedBox(height: 16),

            // 4. Dùng Expanded để ListView lấp đầy toàn bộ khoảng trống còn lại của Column
            Expanded(
              // Dùng ListView.builder để tối ưu hiệu suất khi hiển thị danh sách
              child: ListView.builder(
                itemCount: movies.length, // Số lượng phần tử
                itemBuilder: (context, index) {
                  return Card(
                    // Khoảng cách bên dưới mỗi Card
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 0,
                    color: Colors.grey[100], // Màu nền xám nhạt giống hình mẫu
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      // Biểu tượng hình tròn chứa chữ cái đầu của tên phim
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo[100],
                        child: Text(
                          movies[index][0],
                          style: const TextStyle(color: Colors.indigo),
                        ),
                      ),
                      title: Text(movies[index]), // Tên phim
                      subtitle: const Text('Sample description'),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}