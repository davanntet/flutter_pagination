
import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Testing(),
  ));
}

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  List<int> _numbers = [];
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    fetchData();
    _controller.addListener(() {
      if(_controller.position.pixels==_controller.position.maxScrollExtent){
        fetchData();
      }
    });
    // TODO: implement initState
    super.initState();
  }
  Future<void> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
      _numbers.addAll(List.generate(15, (index) => Random().nextInt(100)));
      setState(() {

      });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite Scroll"),
        centerTitle: true,
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: _numbers.length,
        itemBuilder: (_,index){
          return Card(
            child: ListTile(
              title: Text("${_numbers[index]}"),

            ),
          );
        },
      ),
    );
  }
}
