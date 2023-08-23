import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:weatherapi/src/view/home/search_page.dart';
import 'package:weatherapi/src/view_model_provider/demoprovider.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  String cityName;
   HomeScreen(this.cityName);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  String? location;
  var latitude;
   var logitude;

  //
    Position? position;
  // Future<void>getPosition() async{
  //   position = await _determinePosition();
  // }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {


        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddressFromLatLong(Position position)async{

    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);

   //print(placemark);
    Placemark place = placemark[0];
    print(place.locality);

  }





  @override
  Widget build(BuildContext context) {


print("man${position?.longitude}");
    //     getPosition();
    // GetAddressFromLatLong(position);
   // print("mansih${position?.longitude}");



    final demop = Provider.of<DemoProvider>(context, listen: false);


print("build ");
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blueGrey[600],
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(130),
              child:  Padding(
                padding: const EdgeInsets.only(top: 10,left: 5,right: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){

                          //demop.settemp("Bilaspur");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));

                        }, icon: Icon(Icons.add,size: 35,color: Colors.white,),),


                        Text("${widget.cityName}",style: TextStyle(fontSize: 25,color: Colors.white),),
                        Icon(Icons.more_vert,size: 30,color: Colors.white,)
                      ],
                    ),

                    GestureDetector(
                        onTap: ()async{
                           Position position = await _determinePosition();
                           print(position.latitude);
                           GetAddressFromLatLong(position);
                        },
                      child: Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          width: 170,
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text(
                                "Turn on location service",
                                style: TextStyle(fontSize: 13,color: Colors.white),
                              ))),
                    ),
                    SizedBox(height: 5,),
                   Consumer<DemoProvider>(builder: (BuildContext context,value,child){

                     return  Text("${value.regionn} , ${value.countryy}",style:TextStyle(fontSize: 13,color: Colors.white),);
                     ;
                   })
                  ],
                ),
              )

            ),
            body: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(
                    height: 30,
                  ),

                  Column(
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Container(
                              height: 110,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child:  Consumer<DemoProvider>(builder: (BuildContext context,value,child){
                                        return  Text(
                                          "${value.temp_c}°  ",
                                          style: TextStyle(
                                              fontSize: 80, color: Colors.white),
                                        );
                                      })
                                  ),
                                  Positioned(
                                      left: 160,
                                      top: 30,
                                      child: Text(
                                        "C",
                                        style: TextStyle(
                                            fontSize: 34,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Consumer<DemoProvider>(builder: (BuildContext context ,value,child){
                            return  Text(
                              "Cloudy ${value.maxtemp}°/${value.mintemp}°",
                              style: TextStyle(fontSize: 25, color: Colors.white),
                            );
                          }
                          ),
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 3, bottom: 3),
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.energy_savings_leaf_outlined,
                                    color: Colors.white),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "AQI 11",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 110,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding:
                            EdgeInsets.only(left: 13, right: 13, top: 10),
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.shade600,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                  ),
                                ]),
                            child:  Consumer<DemoProvider>(
                              builder: (BuildContext context , value, child){
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    ReuseRow(
                                        "Today ",
                                        "${value.maxtemp}°/${value.mintemp}°",
                                        "https:${value.day0_image}",
                                        "${value.day0_text}"
                                    ),
                                    ReuseRow(
                                        "Tomorrow ",
                                        "${value.day1_maxtemp_c}°/${value.day1_mintemp_c}°",
                                        "https:${value.day1_image}",
                                        "${value.day1_text}"
                                    ),
                                    ReuseRow(
                                        "${value.day2_date}",
                                        "${value.day2_maxtemp_c}°/${value.day2_mintemp_c}°",
                                        "https:${value.day2_image}",
                                        "${value.day2_text}"
                                    ),




                                  ],
                                );
                              },
                            )
                        ),
                      )
                    ],
                  ),




                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding:
                      EdgeInsets.only(left: 30, right: 30, top: 10),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade600,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              spreadRadius: 1,
                            ),
                          ]),
                      child:  Consumer<DemoProvider>(
                        builder:(BuildContext contect,value, child){

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              ReuseRowBelow(title: "Sunrise", num: "${value.sunrise}"),
                              ReuseRowBelow(title: "Sunset", num: "${value.sunset}"),
                              ReuseRowBelow(title: "Moonrise", num: "${value.moonrise}"),
                              ReuseRowBelow(title: "Moonset", num: "${value.moonset}"),

                            ],
                          );
                        },
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding:
                      EdgeInsets.only(left: 30, right: 30, top: 10),
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade600,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              spreadRadius: 1,
                            ),
                          ]),
                      child: Consumer<DemoProvider>(
                        builder: (BuildContext context, value , child){

                          return  Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              ReuseRowBelow(title: 'Humidity', num: "${value.humidity}%",),
                              ReuseRowBelow(title: 'Real Feel', num: "${value.realFell}°",),
                              ReuseRowBelow(title: 'UV', num: "${value.uv}"),
                              ReuseRowBelow(title: 'Pressure', num: "${value.pressure}",),
                              ReuseRowBelow(title: 'Chance of rain', num: "${value.chanceToRain}",),

                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}

class ReuseRowBelow extends StatelessWidget {

  String title;
  String num;
   ReuseRowBelow({
    required this.title, required this.num
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(title,style: TextStyle(fontSize: 16,color: Colors.white),),
            Text("$num",style: TextStyle(fontSize: 16,color: Colors.white),),


          ],
        ),
        Divider(thickness: 0.2),

      ],
    );
  }
}

class ReuseRow extends StatelessWidget {
  String title;
  String title1;
  String temp;
  String icon;

  ReuseRow( this.title, this.temp, this.icon,this.title1);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Image(image: NetworkImage(icon)),

        Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              title1,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
        Text(temp, style: TextStyle(fontSize: 18, color: Colors.white)),
      ],
    );
  }
}
