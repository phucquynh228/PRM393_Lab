import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_mobile_app/core/routing/app_router.dart';
import 'package:hrm_mobile_app/core/utils/firebase_seed_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp();
    debugPrint('✅ [Firebase] Firebase initialized successfully');
    
    // Seed initial demo data and test connection
    await FirebaseSeedService.seedInitialData();
  } catch (e) {
    debugPrint('⚠️ [Firebase] Initialization warning: $e');
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'HRM Cafe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}
