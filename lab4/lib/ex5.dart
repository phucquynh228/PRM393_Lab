import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CommonUIFixesDemo(), // Chạy thẳng vào Bài 5
  ));
}

class CommonUIFixesDemo extends StatefulWidget {
  const CommonUIFixesDemo({super.key});

  @override
  State<CommonUIFixesDemo> createState() => _CommonUIFixesDemoState();
}

class _CommonUIFixesDemoState extends State<CommonUIFixesDemo> {
  int _counter = 0;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – Common UI Fixes'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // -----------------------------------------------------------------
            // FIX 1: Dùng Expanded bọc ListView bên trong Column
            // -----------------------------------------------------------------
            const Text(
              '1. Correct ListView inside Column using Expanded',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.movie),
                  title: Text('Movie ${String.fromCharCode(65 + index)}'),
                ),
              ),
            ),
            const Divider(height: 30, thickness: 2),

            // -----------------------------------------------------------------
            // FIX 2: Dùng SingleChildScrollView để tránh lỗi tràn màn hình
            // -----------------------------------------------------------------
            const Text(
              '2. Fix overflow in small screens (Horizontal)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Cho phép cuộn ngang
              child: Row(
                children: List.generate(
                  10, // Tạo 10 cái thẻ, nếu không có SingleChildScrollView sẽ bị tràn lỗi sọc vàng đen
                      (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Chip(label: Text('Item $index')),
                  ),
                ),
              ),
            ),
            const Divider(height: 30, thickness: 2),

            // -----------------------------------------------------------------
            // FIX 3: Gọi setState() để cập nhật giá trị lên màn hình
            // -----------------------------------------------------------------
            const Text(
              '3. Fix state update issue by adding setState()',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Giá trị Counter: $_counter', style: const TextStyle(fontSize: 16)),
                ElevatedButton(
                  onPressed: () {
                    // Bọc logic tăng biến bên trong setState
                    setState(() {
                      _counter++;
                    });
                  },
                  child: const Text('Tăng giá trị'),
                ),
              ],
            ),
            const Divider(height: 30, thickness: 2),

            // -----------------------------------------------------------------
            // FIX 4: Truyền đúng BuildContext cho DatePicker
            // -----------------------------------------------------------------
            const Text(
              '4. Fix DatePicker build context errors',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                // Truyền trực tiếp context từ hàm build hiện tại vào
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() {
                    _selectedDate = date;
                  });
                }
              },
              child: const Text('Mở Date Picker an toàn'),
            ),
            if (_selectedDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Ngày đã chọn: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
              ),
          ],
        ),
      ),
    );
  }
}