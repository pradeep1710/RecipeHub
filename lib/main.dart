import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/filter_page.dart';
import './pages/main_page.dart';
import 'pages/recipe_page.dart';
import './pages/recipe_detail_page.dart';
import './models/mytheme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Hub',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,

      // home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(), // default route to be initialise
        '/recipe-page': (context) => const RecipePage(),
        '/recipe-detail-page': (context) => const RecipeDetail(),
        '/filter-page': (context) => const FilterPage()
      },
      // on any exception or crash
      // onUnknownRoute: (settings) =>
      //     MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }
}
