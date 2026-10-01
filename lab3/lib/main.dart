import 'dart:async';
import 'dart:convert';

// ============================================================================
// EXERCISE 1: Product Model & Repository
// ============================================================================

// Định nghĩa model Product
class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() => 'Product(id: $id, name: $name, price: \$$price)';
}

// Xây dựng kho dữ liệu (Repository)
class ProductRepository {
  final List<Product> _products = [];
  // Sử dụng broadcast StreamController để phát sự kiện cho nhiều listener
  final StreamController<Product> _controller = StreamController<Product>.broadcast();

  // Future trả về toàn bộ danh sách sản phẩm
  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(milliseconds: 500)); // Giả lập độ trễ mạng
    return _products;
  }

  // Stream để theo dõi trực tiếp các sản phẩm mới thêm vào
  Stream<Product> liveAdded() => _controller.stream;

  void addProduct(Product product) {
    _products.add(product);
    _controller.add(product); // Phát sự kiện có sản phẩm mới
  }

  void dispose() {
    _controller.close();
  }
}

// ============================================================================
// EXERCISE 2: User Repository with JSON
// ============================================================================

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // Constructor từ điển JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  @override
  String toString() => 'User(name: $name, email: $email)';
}

// Hàm giả lập API trả về JSON
Future<List<User>> fetchUsersFromJson() async {
  // Chuỗi JSON giả lập từ API
  String jsonString = '''
  [
    {"name": "Nguyen Van A", "email": "a@example.com"},
    {"name": "Tran Thi B", "email": "b@example.com"}
  ]
  ''';

  await Future.delayed(Duration(milliseconds: 500));
  List<dynamic> parsedJson = jsonDecode(jsonString); // Phân tích JSON

  // Ánh xạ sang List<User>
  return parsedJson.map((json) => User.fromJson(json)).toList();
}

// ============================================================================
// EXERCISE 3: Async + Microtask Debugging
// ============================================================================

void runAsyncDebugging() {
  print('\n--- Exercise 3: Async + Microtask Debugging ---');
  print('1. Synchronous code chạy đầu tiên');

  // Thêm vào Event Queue
  Future(() => print('4. Event Queue (Future) chạy cuối cùng'));

  // Thêm vào Microtask Queue
  scheduleMicrotask(() => print('3. Microtask Queue chạy sau đồng bộ, trước event queue'));

  print('2. Synchronous code kết thúc');
  /*
   * Giải thích:
   * 1. Mã đồng bộ (Synchronous) luôn chạy trước.
   * 2. Vòng lặp sự kiện (Event Loop) sẽ dọn sạch hàng đợi Microtask trước.
   * 3. Cuối cùng, khi Microtask Queue trống, hệ thống mới xử lý đến Event Queue (Future).
   */
}

// ============================================================================
// EXERCISE 4: Stream Transformation
// ============================================================================

Future<void> runStreamTransformation() async {
  print('\n--- Exercise 4: Stream Transformation ---');
  // Tạo stream từ 1 đến 5
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5]);

  Stream<int> transformedStream = numbers
      .map((number) => number * number) // Dùng map() biến thành bình phương
      .where((squared) => squared % 2 == 0); // Dùng where() lọc ra số chẵn

  // Lắng nghe và in ra giá trị
  await for (var value in transformedStream) {
    print('Giá trị sau khi transform (Bình phương chẵn): $value');
  }
}

// ============================================================================
// EXERCISE 5: Factory Constructors & Cache
// ============================================================================

class Settings {
  // Biến tĩnh lưu giữ thực thể duy nhất
  static final Settings _instance = Settings._internal();

  // Private constructor (Không thể gọi từ bên ngoài)
  Settings._internal() {
    print('Khoi tao Settings instance mới (chỉ chạy 1 lần)');
  }

  // Factory constructor luôn trả về instance đã được cache
  factory Settings() {
    return _instance;
  }
}

void runFactoryAndCache() {
  print('\n--- Exercise 5: Factory Constructors & Cache ---');
  Settings setting1 = Settings();
  Settings setting2 = Settings();

  // So sánh 2 biến xem có trỏ đến cùng một object trong bộ nhớ không
  bool isSame = identical(setting1, setting2);
  print('setting1 và setting2 có giống hệt nhau không (Singleton)? => $isSame');
}

// ============================================================================
// HÀM MAIN (Khởi chạy tất cả các bài tập)
// ============================================================================

void main() async {
  print('========== BẮT ĐẦU CHẠY LAB 3 ==========');

  // Chạy Bài 1
  print('\n--- Exercise 1: Product Model & Repository ---');
  final repo = ProductRepository();

  // Đăng ký listener cho Stream
  repo.liveAdded().listen((product) {
    print('-> Stream lắng nghe được sản phẩm mới: $product');
  });

  repo.addProduct(Product(id: 1, name: 'MacBook Pro', price: 1999.99));
  repo.addProduct(Product(id: 2, name: 'iPhone 15', price: 999.99));

  final products = await repo.getAll();
  print('-> Future getAll() trả về: $products');

  // Chạy Bài 2
  print('\n--- Exercise 2: User Repository with JSON ---');
  final users = await fetchUsersFromJson();
  print('-> Danh sách User sau khi parse JSON: $users');

  // Chạy Bài 3
  // Gọi hàm bất đồng bộ
  runAsyncDebugging();
  // Delay nhẹ để các Future của Bài 3 kịp in ra trước khi console chạy tiếp Bài 4
  await Future.delayed(Duration(milliseconds: 100));

  // Chạy Bài 4
  await runStreamTransformation();

  // Chạy Bài 5
  runFactoryAndCache();

  // Dọn dẹp tài nguyên
  repo.dispose();
}