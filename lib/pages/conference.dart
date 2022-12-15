import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techme/utils/colors.dart';
import 'package:techme/widgets/big_text.dart';

import 'package:file_picker/file_picker.dart';
import 'package:techme/widgets/button.dart';

import 'package:intl/intl.dart';

class Conference extends StatefulWidget {
  const Conference({Key? key}) : super(key: key);

  @override
  State<Conference> createState() => _ConferenceState();
}

class _ConferenceState extends State<Conference> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    // if no file is picked
    if (result == null) return;
  }

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Container(
          margin: EdgeInsets.only(top: 55, bottom: 50, right: 20, left: 20),
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
                            text: "SCHEDULE A CONFERENCE",
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
                          hintText: 'Meeting title',
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
                            hintText: 'Upload image',
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
                          hintText: 'Choose date',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: AppColors.buttonBgColor,
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              dateInput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
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
                          hintText: 'Starting time',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.access_time,
                            color: AppColors.buttonBgColor,
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                        },
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
                          hintText: 'Ending time',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.access_time,
                            color: AppColors.buttonBgColor,
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                        },
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
                          hintText: 'Number of speakers',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.mic,
                            color: AppColors.buttonBgColor,
                          ),
                        ),
                        onChanged: (value) {
                          // Do something
                        },
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
                          hintText: 'Avenue',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.house,
                            color: AppColors.buttonBgColor,
                          ),
                        ),
                        onChanged: (value) {
                          // Do something
                        },
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
                          hintText: 'Credit card',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.credit_card,
                            color: AppColors.buttonBgColor,
                          ),
                        ),
                        onChanged: (value) {
                          // Do something
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Button(text: "CREATE CONFERENCE")
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
