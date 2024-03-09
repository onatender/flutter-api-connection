import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http_demo/data/api/category_api.dart';
import 'package:http_demo/models/category.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = List<Category>();
  List<Widget> categoryWidgets = List<Widget>();

  @override
  void initState() {
    getCategoriesFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Sistemi", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categoryWidgets,
                ),
              )
            ],
          )),
    );
  }
  
  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories = list.map((category)=>Category.fromJson(category)).toList();
      });
    });
  }
}
