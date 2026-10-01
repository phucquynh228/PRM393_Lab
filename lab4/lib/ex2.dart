import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InputControlsDemo(), // Chạy thẳng vào Bài 2
  ));
}

// 1. Khai báo StatefulWidget
class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  // Các biến để lưu trữ trạng thái (State) của người dùng
  double _sliderValue = 50.0;
  bool _isSwitchOn = false;
  String _selectedGenre = 'None';
  DateTime? _selectedDate;

  // Hàm hiển thị DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Ngày mặc định khi mở lên
      firstDate: DateTime(2000),   // Ngày nhỏ nhất có thể chọn
      lastDate: DateTime(2101),    // Ngày lớn nhất có thể chọn
    );

    // Nếu người dùng có chọn ngày thì cập nhật lại biến _selectedDate
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 – Input Controls'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      // Dùng ListView để tránh lỗi tràn màn hình nếu danh sách quá dài
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // ----------------------------------------------------
          // 2. Rating (Slider)
          // ----------------------------------------------------
          const Text('Rating (Slider)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Slider(
            value: _sliderValue,
            min: 0,
            max: 100,
            onChanged: (value) {
              setState(() {
                _sliderValue = value; // Cập nhật UI khi kéo thanh trượt
              });
            },
          ),
          Text('Current value: ${_sliderValue.toInt()}'), // 4. Hiển thị giá trị
          const Divider(height: 40),

          // ----------------------------------------------------
          // 3. Active (Switch)
          // ----------------------------------------------------
          const Text('Active (Switch)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SwitchListTile(
            title: const Text('Is movie active?'),
            value: _isSwitchOn,
            onChanged: (value) {
              setState(() {
                _isSwitchOn = value; // Cập nhật UI khi bật/tắt
              });
            },
          ),
          const Divider(height: 40),

          // ----------------------------------------------------
          // 4. Genre (RadioListTile)
          // ----------------------------------------------------
          const Text('Genre (RadioListTile)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          RadioListTile<String>(
            title: const Text('Action'),
            value: 'Action',
            groupValue: _selectedGenre,
            onChanged: (value) {
              setState(() {
                _selectedGenre = value!; // Cập nhật thể loại phim
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Comedy'),
            value: 'Comedy',
            groupValue: _selectedGenre,
            onChanged: (value) {
              setState(() {
                _selectedGenre = value!;
              });
            },
          ),
          Text('Selected genre: $_selectedGenre'), // 4. Hiển thị giá trị
          const Divider(height: 40),

          // ----------------------------------------------------
          // 5. DatePicker
          // ----------------------------------------------------
          ElevatedButton(
            onPressed: () => _selectDate(context), // Gọi hàm chọn ngày khi bấm nút
            child: const Text('Open Date Picker'),
          ),
          const SizedBox(height: 10),
          // Chỉ hiển thị ngày nếu biến _selectedDate không bị null
          if (_selectedDate != null)
            Text(
              'Selected Date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}