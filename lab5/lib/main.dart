import 'package:flutter/material.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF4F4F9),
      ),
      home: const HomeScreen(),
    );
  }
}

// --- BƯỚC 2: ĐỊNH NGHĨA MÔ HÌNH DỮ LIỆU & DỮ LIỆU MẪU ---
class Trailer {
  final String title;
  Trailer({required this.title});
}

class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final String overview;
  final List<String> genres;
  final double rating;
  final List<Trailer> trailers;

  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.overview,
    required this.genres,
    required this.rating,
    required this.trailers,
  });
}

// Dữ liệu tĩnh mẫu theo yêu cầu
final List<Movie> sampleMovies = [
  Movie(
    id: '1',
    title: 'Dune: Part Two',
    posterUrl: 'https://images.unsplash.com/photo-1542204165-65bf26472b9b?auto=format&fit=crop&q=80&w=600', // Ảnh minh họa thay thế
    overview: 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    rating: 8.6,
    trailers: [Trailer(title: 'Official Trailer #1'), Trailer(title: 'IMAX Sneak Peek')],
  ),
  Movie(
    id: '2',
    title: 'Deadpool & Wolverine',
    posterUrl: 'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?auto=format&fit=crop&q=80&w=600', // Ảnh minh họa thay thế
    overview: 'The multiverse gets messy when Wade Wilson teams up with Wolverine for a not-so-family-friendly mission.',
    genres: ['Action', 'Comedy'],
    rating: 8.3,
    trailers: [Trailer(title: 'Red Band Trailer'), Trailer(title: 'Behind the Scenes')],
  ),
];

// --- BƯỚC 3: XÂY DỰNG MÀN HÌNH CHÍNH ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        backgroundColor: const Color(0xFFF4F4F9),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleMovies.length,
        itemBuilder: (context, index) {
          final movie = sampleMovies[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 1,
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                // Điều hướng sang trang Chi tiết và truyền đối tượng Movie
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(movie: movie),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        movie.posterUrl,
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '⭐ ${movie.rating} • ${movie.genres.join(", ")}',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- BƯỚC 4: XÂY DỰNG MÀN HÌNH CHI TIẾT ---
class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.movie.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Poster
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  widget.movie.posterUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Các Chip Thể loại
                  Wrap(
                    spacing: 8,
                    children: widget.movie.genres.map((genre) {
                      return Chip(
                        label: Text(genre),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Nội dung tổng quan
                  Text(
                    widget.movie.overview,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 24),

                  // Các nút Hành động
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                        label: 'Favorite',
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                      _buildActionButton(
                        icon: Icons.star_border,
                        label: 'Rate',
                        onTap: () {},
                      ),
                      _buildActionButton(
                        icon: Icons.share,
                        label: 'Share',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Danh sách Trailer
                  const Text(
                    'Trailers',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.movie.trailers.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.play_circle_fill, color: Colors.black54, size: 30),
                        title: Text(widget.movie.trailers[index].title),
                        contentPadding: EdgeInsets.zero,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.black87),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}