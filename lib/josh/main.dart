import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Theme.dart';
import 'package:praktek2/josh/Provider/navigation.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/Provider/navpro.dart';
import 'package:provider/provider.dart';
import 'Provider/infomation provider/profauna.dart';
import 'Provider/infomation provider/proflora.dart';
import 'Provider/infomation provider/prolake.dart';
import 'Provider/infomation provider/promountain.dart';
import 'Provider/infomation provider/proriver.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Prohewan()),
        ChangeNotifierProvider(create: (_) => Proflora()),
        ChangeNotifierProvider(create: (_) => Prolake()),
        ChangeNotifierProvider(create: (_) => Promountain()),
        ChangeNotifierProvider(create: (_) => Proriver()),
        ChangeNotifierProvider(create: (_) => MainNavigationProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
        ChangeNotifierProvider(create: (_) => ThemePro()),
        ChangeNotifierProvider(create: (_) => Navpro()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemePro>(context);

    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      data: theme.isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Sesuaikan dengan tema yang aktif
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RimbaFamily',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: MainNavigation(),
      ),
    );
  }
}
