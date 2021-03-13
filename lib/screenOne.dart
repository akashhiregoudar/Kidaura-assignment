import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final PageController controller = PageController(initialPage: 0);
  int pageno = 1;
  int count = 0;
  List<bool> track = [true,false,false,false,false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page'),),
      body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for(int i=0; i<5; i++) track[i] ? Icon(Icons.check_circle,size: 30,) : Icon(Icons.radio_button_unchecked_outlined, size: 30,)
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: const <Widget>[
                    Center(
                      child: Text('Page 1',style: TextStyle(
                          fontSize: 26
                      ),),
                    ),
                    Center(
                      child: Text('Page 2',style: TextStyle(
                          fontSize: 26
                      ),),
                    ),
                    Center(
                      child: Text('Page 3',style: TextStyle(
                          fontSize: 26
                      ),),
                    ),
                    Center(
                      child: Text('Page 4',style: TextStyle(
                          fontSize: 26
                      ),),
                    ),
                    Center(
                      child: Text('Page 5',style: TextStyle(
                          fontSize: 26
                      ),),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: FlatButton(
                    color: Colors.deepOrange[600],
                    onPressed: (){
                      count++;
                      controller.animateToPage(pageno, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                      setState(() {
                        if(pageno == 4) {
                          pageno = 0;
                        }
                        else {
                          pageno++;
                        }
                        if(count == 5) {
                          track = [true,false,false,false,false];
                          count = 0;
                        } else {
                          track[count] = true;
                        }
                      });
                    },
                    child: Container(
                        width: 70,
                        height: 40,
                        child: Center(child: Text(
                          'Next',
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
          ),
    );
  }
}
