import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/models/api/movie_api.dart';
import 'package:movie_app/models/api/movie_api_impl.dart';
import 'package:movie_app/providers/movie_discover_provider.dart';
import 'package:movie_app/providers/movie_top_rated_provider.dart';
import 'package:movie_app/screens/login_page_screen.dart';
import 'package:provider/provider.dart';

void main() {
  // untuk menjalankan fungsi splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final dioOptions = BaseOptions(
    baseUrl: Constants.baseUrl,
    queryParameters: {'api_key': Constants.apiKey},
  );
  final Dio dio = Dio(dioOptions);
  final MovieRepository movieRepository = MovieImplRepository(dio);

  runApp(MyApp(movieRepository: movieRepository));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.movieRepository});

  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieDiscoverProvider(movieRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => MovieTopRatedProvider(movieRepository),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Movie',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const LoginPageScreen(),
      ),
    );
  }
}
