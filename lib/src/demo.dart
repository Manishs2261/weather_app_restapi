import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapi/src/model/weatherModel.dart';
import 'package:weatherapi/src/respository/repo.dart';
import 'package:weatherapi/src/view_model_provider/demoprovider.dart';


class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  Weaather? a;

  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    
final demop = Provider.of<DemoProvider>(context,listen: false);
    
    print("widget new build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "ghfj"
          ),
        ),
          ElevatedButton(onPressed: ()async{

             demop.settemp(controller.text.toString());



          }, child:  Text("click")),
          Consumer<DemoProvider>(
            builder: (BuildContext context , value , child){

              return Text("${value.temp_c.toString()}");
            },

          )



      ],),
    );
  }
}


class Photo{

  String title ;

  Photo({required this.title});


}
