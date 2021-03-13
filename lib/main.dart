import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screenOne.dart';
import 'screenTwo.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Text('Kidaura', style: TextStyle(color: Colors.white),),
      ),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 10),
              child: FlatButton(
                color: Colors.orange,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context) => ScreenOne()));
                  },
                  child: Container(
                      height: 90,
                      child: Center(child: Text(
                        'First Screen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        ),
                      ),
                      )
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 10),
              child: FlatButton(
                color: Colors.orange,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenTwo()));
                  },
                  child: Container(
                      height: 90,
                      child: Center(child: Text(
                        'Second Screen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        ),
                      ),
                      )
                  )
              ),
            ),
          ],
        );
  }
}




