import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  TextEditingController _heightController=TextEditingController();
  TextEditingController _weightController=TextEditingController();
  double _bmiResult=0;
  String _textResult="";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("BMI Calculator",
          style: TextStyle(
            color: Colors.green,
            fontSize: 35,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:45,),
            Container(
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width:120,
                    child: TextField(
                      controller: _heightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:42,
                        fontWeight:FontWeight.w300,
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense:false,
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        border: InputBorder.none,
                        hintText: "Height(m)",
                        hintStyle: TextStyle(
                          fontSize:24,
                          fontWeight:FontWeight.bold,
                          color: Colors.black,
                        )
                      ),
                    ),
  
                  ),
                  Container(
                    width:150,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:42,
                        fontWeight:FontWeight.w300,
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense:false,
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        border: InputBorder.none,
                        hintText: "Weight(Kg)",
                        hintStyle: TextStyle(
                          fontSize:24,
                          fontWeight:FontWeight.bold,
                          color: Colors.black,
                        )
                      ),
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height:30,),
            GestureDetector(
              onTap: (){
                double _h=double.parse(_heightController.text);
                double _w=double.parse(_weightController.text);

                setState(() {
                  _bmiResult=_w/(_h*_h);
                  if(_bmiResult>25){
                    _textResult="You are Overweight! 🙁";
                  }else if(_bmiResult>=18.5 && _bmiResult<=25){
                    _textResult="Your weight is normal! 💐";
                  }else{
                    _textResult="You are UnderWeight! 🙁";
                  }
                });
                

              },
              
              child:Container(
                padding: EdgeInsets.symmetric(vertical:14, horizontal:40),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),
              ),
              child:Text("Calculate",
              style:TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
              )
              )
              
            ),
            SizedBox(height:40),
            Container(
              child: Center(
                child: Text(_bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                ),
              )
            ),
            SizedBox(height:50),
            Visibility(
              visible:_textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,

                ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}