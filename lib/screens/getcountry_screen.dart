import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_newproject/utils/appFonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

import '../models/CountryModel.dart';
import 'getphonenumber_screen.dart';

class CountrySelectionScreen extends StatefulWidget {
  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
   List<CountryModel> countries = [];
   List<CountryModel> countriesMain = [];
   TextEditingController searchController = TextEditingController();

  void fetchCountries() async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('https://studylancer.yuktidea.com/api/countries'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());

      data['data']
          .forEach((item) => {countries.add(CountryModel.fromJson(item))});
      setState(() {
        countriesMain = countries;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  void searchCountryByName(){
      List<CountryModel> temp = [];
      countriesMain.forEach((element) {
          if(element.name.toLowerCase().contains(searchController.text.toLowerCase().trim())){
            temp.add(element);
          }
       });  

       setState(() {
         countries = temp;
       });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF292929), // Background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF292929),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFBDBDBD).withOpacity(0.3),
                            offset: Offset(-4, -3),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Select your country',
                      style: font24white
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.73,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF4B4E4F), // Search bar color
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 6),
                        Icon(Icons.search, color: Color(0xFFD9896A)), // Icon color
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              searchCountryByName();
                            },
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(color: Colors.white), // Text color
                          ),
                        ),
                      ],
                    ),
                  ),
                                    SizedBox(height: 8), // Add spacing

                  GradientDevider(context),
                  SizedBox(height: 8), // Add spacing
                  
                   SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7 ,
                     child: ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Phonenumber_screen(

                                        country : countries[index]
                                      )));
                            
                          },
                          leading: SvgPicture.network(countries[index].flag, width: 15, height: 15,),
                          title: Text(countries[index].name, style: TextStyle(color: Colors.white),),
                          trailing: Text(countries[index].code, style: TextStyle(color: Colors.white),),
                        );
                      },
                                     ),
                   ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container GradientDevider(BuildContext context) {
    return Container(
                  width: MediaQuery.of(context).size.width * 1.2,
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(156, 16, 17, 18), // Start color
                        Color.fromARGB(189, 96, 101, 104), // End color
                        // Color.fromARGB(156, 16, 17, 18),
                      ],
                      stops: [0.2, 0.0], // Gradient stops
                    ),
                  ),
                );
  }
}
