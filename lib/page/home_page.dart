import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_paginate/route/route_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      //body:
      //Container(
      //   margin: EdgeInsets.all(20),
      //   child: Center(
      //     child: TextField(
      //       controller: dateController,
      //       decoration: InputDecoration(
      //           fillColor: Colors.white,
      //           border: OutlineInputBorder(),
      //           suffixIcon: Icon(Icons.calendar_month)),
      //       readOnly: true,
      //       onTap: () async {
      //         DateTime? pickedDate = await showDatePicker(
      //           context: context,
      //           initialDate: DateTime.now(),
      //           firstDate: DateTime(2024),
      //           lastDate: DateTime(2041),
      //         );

      //         if (pickedDate != null) {
      //           print(pickedDate.toString());
      //           String formattedDate =
      //               DateFormat("yyyy-MM-dd").format(pickedDate);
      //           print(formattedDate);
      //           setState(() {
      //             dateController.text = formattedDate;
      //           });
      //         }
      //       },
      //     ),
      body: Container(
        height: 50,
        width: 100,
        color: Colors.amber,
        child: IconButton(
            onPressed: () {
              Get.toNamed(RouteHelper.getPostPage());
            },
            icon: Icon(Icons.skip_next)),
      ),
    );
  }
}
