import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapi/src/model/searchMOdel.dart';
import 'package:weatherapi/src/view/home/home_screen.dart';
import 'package:weatherapi/src/view_model_provider/demoprovider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart'as http;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  TextEditingController _cityController = TextEditingController();

  // var uuid = Uuid();
  // String _sesionToken = "123";
  //
  // List<dynamic>_placesList = [500];
  // SearchModel? searchModel;
  //
  // setCityName(String city){
  //
  //   return city;
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _cityController.addListener(() {
  //
  //     onChange();
  //
  //   });
  // }
  //
  // void onChange() {
  //
  //   if(_sesionToken == null){
  //     setState(() {
  //
  //       _sesionToken = uuid.v4();
  //     });
  //   }
  //   getSuggesion(_cityController.text.toString());
  // }
  //
  // void getSuggesion(String input)async{
  //
  //   String kPlace_Api_key = "6b9ad4421ffd479f94b2eb13205d2fca";
  //   String request = "https://api.geoapify.com/v1/geocode/autocomplete?text=$input&format=json&apiKey=$kPlace_Api_key";
  //
  //   var response = await http.get(Uri.parse(request));
  //
  //   print("manish${response.body.toString()}");
  //   if(response.statusCode == 200)
  //     {
  //       setState(() {
  //         _placesList = jsonDecode(response.body.toString())['city'];
  //
  //       });
  //
  //     }else{
  //
  //     throw Exception("failed load data ");
  //   }
  //
  //   }


  @override
  Widget build(BuildContext context) {

    final demop = Provider.of<DemoProvider>(context, listen: false);


    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Manage cities",style: TextStyle(fontSize: 25),),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: TextFormField(
                controller: _cityController,

              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 15),
                hintText: "Enter city and country name",
                prefixIcon: Icon(Icons.search),

                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),


              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){

           demop.settemp(_cityController.text.toString());
            //setCityName(_cityController.text.toString());
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(_cityController.text.toString())));
          }, child: Text("Search")),

          Padding(
            padding: const EdgeInsets.only(right: 250,top: 10,bottom: 10),
            child: Text("Popular cities",style: TextStyle(fontSize: 16,),),
          ),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OnSelectCity(demop: demop, cityName: 'Locaton',),
                  OnSelectCity(demop: demop, cityName: 'New Delhi',),
                  OnSelectCity(demop: demop, cityName: 'Mumbai',),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OnSelectCity(demop: demop, cityName: 'Bengaluru',),
                  OnSelectCity(demop: demop, cityName: 'Dispur',),
                  OnSelectCity(demop: demop, cityName: 'Kolkata',),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OnSelectCity(demop: demop, cityName: 'Lucknow',),
                  OnSelectCity(demop: demop, cityName: 'Chennai',),
                  OnSelectCity(demop: demop, cityName: 'Jaipur',),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OnSelectCity(demop: demop, cityName: 'Ludhiana',),
                  OnSelectCity(demop: demop, cityName: 'Pune',),
                  OnSelectCity(demop: demop, cityName: 'Bhopal',),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OnSelectCity(demop: demop, cityName: 'Guwahati',),
                  OnSelectCity(demop: demop, cityName: 'Ranchi',),
                  OnSelectCity(demop: demop, cityName: 'Faridabad',),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OnSelectCity(demop: demop, cityName: 'Surat',),
                  OnSelectCity(demop: demop, cityName: 'chandigarch',),
                  OnSelectCity(demop: demop, cityName: 'Patna',),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OnSelectCity(demop: demop, cityName: 'Raipur',),
                  OnSelectCity(demop: demop, cityName: 'Bilaspur',),
                  OnSelectCity(demop: demop, cityName: 'Bhilai',),

                ],
              ),
            ],
          )

          // Expanded(
          //     child: ListView.builder(
          //       shrinkWrap: true,
          //         itemCount: _placesList.length,
          //
          //         itemBuilder: (context,index){
          //
          //         print("hello${_placesList[index]}");
          //         return  ListTile(
          //           title: Text("${_placesList[index]['city']}"),
          //         );
          //         }))
        ],
      ),
    );
  }


}

class OnSelectCity extends StatelessWidget {
   OnSelectCity({
    super.key,
    required this.demop,required this.cityName
  });

  final DemoProvider demop;
  String cityName;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        demop.settemp(cityName);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen(cityName)));
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        height: 40,
        width: 100,

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(50),
          color: Colors.blue[100]
        ),
        child: Text(cityName),
      ),
    );
  }
}
