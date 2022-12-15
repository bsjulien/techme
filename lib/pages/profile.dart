import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techme/utils/colors.dart';
import 'package:techme/widgets/big_text.dart';

import 'package:file_picker/file_picker.dart';
import 'package:techme/widgets/button.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    // if no file is picked
    if (result == null) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Container(
          margin: EdgeInsets.only(top: 55, right: 20, left: 20),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BigText(
                              text: "Tech",
                              color: AppColors.buttonBgColor,
                            ),
                            BigText(
                              text: "Me",
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        Icon(
                          Icons.account_circle_outlined,
                          size: 40,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(
                            text: "BECOME A SPEAKER",
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1.5,
                              color: AppColors.mainColor,
                              style: BorderStyle.solid)),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Your name',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: AppColors.buttonBgColor,
                          ),
                        ),
                        onChanged: (value) {
                          // Do something
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _pickFile();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1.5,
                                color: AppColors.mainColor,
                                style: BorderStyle.solid)),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'Upload picture',
                            contentPadding: EdgeInsets.all(15),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.upload_file,
                              color: AppColors.buttonBgColor,
                            ),
                          ),
                          onChanged: (value) {
                            // Do something
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1.5,
                              color: AppColors.mainColor,
                              style: BorderStyle.solid)),
                      child: TextField(
                        minLines: 10,
                        maxLines: 20,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          // Do something
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Button(text: "Confirm")
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
