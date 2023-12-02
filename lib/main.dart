import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/homepage/homepage_tabs_widget.dart';
import 'package:movie_app/utils/index.dart';
import 'package:movie_app/utils/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
        debugShowCheckedModeBanner: false,
        theme: AppThemeData().darkTheme,
        darkTheme: AppThemeData().darkTheme,
        home: BlocProvider(
          create: (create) =>
              HomepageBloc(homepageRepositoryImp: HomepageRepositoryImp()),
          child: const HomepageTabsWidget(),
        ));
  }
}
