import 'package:coffeeshop/core/constants/colorconst.dart';
import 'package:coffeeshop/provider/login_provider.dart';
import 'package:coffeeshop/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: ColorConst.kScaffoldBackgroundColor,
      appBar: MyAppBar(title: "Qahwa Coffee Shop Login", context: context,),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Lottie.asset('assets/lottie/rithm_coffee.json', fit: BoxFit.cover),),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                // key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      // validator: (v)=> v!.length < 5 ? "5 tadan kam bo'lmasin!" : null
                      
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      // validator: (v)=> v!.length < 5 ? "5 tadan kam bo'lmasin!" : null
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 3.0),
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: const Text("Forgot password?"),
                        onTap: (){
                          context.read<LoginProvider>().forgotPassword(context, emailController.text);
                        }
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text("Ro'yxatdan o'tish"),
                    onPressed: (){
                      context.read<LoginProvider>().register(context, emailController.text, passwordController.text);

                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                  ElevatedButton(
                    child: Text("Tizimga Kirish"),
                    onPressed: (){
                      context.read<LoginProvider>().signIn(context, emailController.text, passwordController.text, formKey);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.cyan,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}