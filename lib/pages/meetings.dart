import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techme/utils/colors.dart';
import 'package:techme/widgets/big_text.dart';

import 'package:file_picker/file_picker.dart';
import 'package:techme/widgets/button.dart';
import 'package:techme/widgets/small_text.dart';

class Meetings extends StatefulWidget {
  const Meetings({Key? key}) : super(key: key);

  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

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
                            text: "MEETINGS",
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
                          hintText: 'Search meeting',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.mainColor,
                          ),
                        ),
                        onChanged: (value) {
                          // Do something
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 8,
                            itemBuilder: (context, int index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.group_add,
                                      color: AppColors.buttonBgColor,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SmallText(
                                      text: "CYBER MEETUP AT SERENA",
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SmallText(
                                      text: "JOIN NOW",
                                      color: AppColors.buttonBgColor,
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
