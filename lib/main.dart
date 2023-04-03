import 'package:flutter/material.dart';
import 'package:popular_movies/view_models/providers.dart';
import 'package:provider/provider.dart';
import 'package:popular_movies/themes/themes_manager.dart';
import 'package:popular_movies/views/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider()),
        ChangeNotifierProvider(create: (_) => GenresProvider()),
      ],
      child: OrientationBuilder(builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Popular Movies',
          initialRoute: 'home',
          routes: {
            'home': (_) => const HomeScreen(),
            'detail': (_) => const DetailScreen(),
          },
          //navigatorObservers: [CustomNavigatorObserver()],
          theme: ThemeManager.lightTheme,
        );
      }),
    );
  }
}
