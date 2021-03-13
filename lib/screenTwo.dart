import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenTwo extends StatefulWidget {
  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  List<dynamic> finalData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    final response = await http.get('https://restcountries.eu/rest/v2/region/asia');
    if(response.statusCode == 200){
      String res = response.body;
      setState(() {
        finalData = json.decode(res);
      });
    } else {
      print('fail');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page'),),
      body: finalData.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
        separatorBuilder: (context, ind) {
          return Divider(thickness: 4,);
        },
          itemCount: finalData.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: SvgPicture.network(finalData[index]['flag'],width: 120, height: 60,),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Name: '+finalData[index]['name'], style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                  ),),
                  Text('Capital: '+finalData[index]['capital'], style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                  ),),
                  Text('Region: '+finalData[index]['region'], style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                  ),),
                  Text('Subregion: '+finalData[index]['subregion'], style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                  ),),
                  Text('Population: '+finalData[index]['population'].toString(), style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                  ),),
                  SizedBox(height: 18,),
                  Text('Languages', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  finalData[index]['languages'].length == 0
                      ? Text('No Languages')
                      : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0
                      ),
                      shrinkWrap: true,
//                          physics: ClampingScrollPhysics(),
                      itemCount: finalData[index]['languages'].length,
                      itemBuilder: (context, a) {
                        return Center(
                          child: ListTile(
                            title: Text(finalData[index]['languages'][a]['name'].toString(), style: TextStyle(
                                fontSize: 18,
                                color: Colors.black
                            ),),
                          ),
                        );
                      }
                  ),
                  SizedBox(height: 18,),
                  Text('Borders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  finalData[index]['borders'].length == 0
                      ? Text('No Borders')
                      : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0
                      ),
                    shrinkWrap: true,
//                      physics: ClampingScrollPhysics(),
                      itemCount: finalData[index]['borders'].length,
                      itemBuilder: (context, b) {
                        return Center(
                          child: ListTile(
                          title: Text(finalData[index]['borders'][b].toString(), style: TextStyle(
                            fontSize: 18,
                            color: Colors.black
                          ),),
                          ),
                        );
                      }
                  ),
                ],
              ),
            );

          }
      )
    );
  }
}
