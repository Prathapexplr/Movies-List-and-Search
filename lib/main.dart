import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_search/controllers/movie_controllers.dart';
import 'package:movie_list_search/views/movie_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      initialBinding: BindingsBuilder(() {
        Get.put(MovieController());
      }),
      home: MovieListPage(),
    );
  }
}
