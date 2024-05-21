import 'package:e_commerce/controll/api.dart';
import 'package:e_commerce/view/cartcontroller.dart';
import 'package:e_commerce/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
