import 'package:coffeeshop/core/constants/colorconst.dart';
import 'package:coffeeshop/provider/coffee_upload_provider.dart';
import 'package:coffeeshop/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class HomeAdminPage extends StatelessWidget {
  HomeAdminPage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kScaffoldBackgroundColor,
      body: ElevatedButton(child: Text("Where"), onPressed: (){
        context.read<LoginProvider>().printWhere();
      },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: ColorConst.kScaffoldBackgroundColor,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return StatefulBuilder(
                builder: ((context, setState) {
                  return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Form(
                                child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    labelText: "New Product Name",
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                TextFormField(
                                  controller: priceController,
                                  decoration: InputDecoration(
                                    labelText: "New Product Price",
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          ElevatedButton(
                            child: Text("Upload Photo"),
                            onPressed: () async {
                              image = await _picker.pickImage(source: ImageSource.gallery);
                              context.read<CoffeeUploadPRovider>().uploadImageToStorage(image!, nameController.text);
                              setState((){});
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                          ),

                          Expanded(
                            child: SizedBox(
                              child: image != null ?
                              Image.file(File(image!.path)) : Center(child: Text("Image have not uploaded yet!"))
                          )),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: ElevatedButton(
                              child: Text("Add to a Coffee Shop"),
                              onPressed: () {
                                context.read<CoffeeUploadPRovider>().uploadCoffeeToDb(context, nameController.text, priceController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: ColorConst.kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0))),
                            ),
                          ),
                        ],
                      ),

                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: ColorConst.kScaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: MediaQuery.of(context).size.height * 0.5);
                }),
              );
            },
          );
        },
      ),
    );
  }
}
