import 'package:coffeeshop/core/constants/colorconst.dart';
import 'package:coffeeshop/provider/login_provider.dart';
import 'package:coffeeshop/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kScaffoldBackgroundColor,
      appBar: MyAppBar(
        title: "Qahwa Coffee",
        context: context,
        function: (){
          context.read<LoginProvider>().logOut(context);
        }
      ),
    );
  }
}