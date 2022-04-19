import 'package:coffeeshop/core/components/theme_comp.dart';
import 'package:coffeeshop/core/routes/my_route.dart';
import 'package:coffeeshop/provider/coffee_upload_provider.dart';
import 'package:coffeeshop/provider/login_provider.dart';
import 'package:coffeeshop/provider/route_provider.dart';
import 'package:coffeeshop/screens/my_home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => RouteProvider())),
        ChangeNotifierProvider(create: ((context) => LoginProvider())),
        ChangeNotifierProvider(create: ((context) => CoffeeUploadPRovider())),
      ],
      child: MyApp()),
    );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  MyRoute _myRoute = MyRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qahwa',
      theme: ThemeComp.myTheme,
      initialRoute: context.watch<RouteProvider>().route,
      onGenerateRoute: _myRoute.onGenerateRoute,
    );
  }
}
