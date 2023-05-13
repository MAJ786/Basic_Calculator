import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

   int firstNum = 0;
   int secondNum = 0;
   String history = "";
   String textToDisplay = "";
  late String reasult;
  late String operations;

  //variable to store calculator values and operations//


  void calculationButton(String btnVal){
    //Function to perform basic Calculations//

    print(btnVal);
    if(btnVal == "C"){   //clear current number//
      textToDisplay ="";
     firstNum =0;
     secondNum=0;
     reasult = "";
    }
    else if (btnVal == "AC")  //All clear //
      {
        textToDisplay ="";
        firstNum =0;
        secondNum=0;
        reasult = "";
        history = "";
      }
    else if (btnVal == "<") { reasult = textToDisplay.substring(0,textToDisplay.length -1);}  //Go back by 1 digit//
    else if (
            btnVal == "+" ||
            btnVal == "-" ||
            btnVal =="X" ||
            btnVal =="/" )

        {firstNum = int.parse(textToDisplay);  //Calculation function//
         reasult="";
         operations =btnVal;
        }else if (btnVal== "="){
      secondNum =int.parse(textToDisplay);
      if(operations == "+"){
        reasult = (firstNum + secondNum).toString();
        history = firstNum.toString() + operations.toString() +secondNum.toString();
      }
      if(operations == ""){
        reasult = (firstNum - secondNum).toString();
        history = firstNum.toString() + operations.toString() +secondNum.toString();
      }
      if(operations == "x"){
        reasult = (firstNum * secondNum).toString();
        history = firstNum.toString() + operations.toString() +secondNum.toString();
      }
      if(operations == "/"){
        reasult = (firstNum / secondNum).toString();
        history = firstNum.toString() + operations.toString() +secondNum.toString();
      }
    }else{
      reasult =int.parse(textToDisplay + btnVal).toString();
    }
    setState(() {
      textToDisplay = reasult;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(centerTitle: true,
        title: Text(
          'Basic Calculator',
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(                                     //History of previous calculation numbers//
              alignment: Alignment(1, 1),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                 history,
                  style: TextStyle(color: Colors.white24,fontSize: 32, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Container(                                      //1st Number and 2nd Number number//
              alignment: Alignment(1, 1),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  textToDisplay,
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,          //Number and Opeations keys//
              children: [
                NumberButtons(color: Colors.yellowAccent, text: "AC", callBack: calculationButton ),
                NumberButtons(color: Colors.yellowAccent, text: "C", callBack: calculationButton),
                NumberButtons(color: Colors.yellowAccent, text: "<", callBack: calculationButton),
                NumberButtons(color: Colors.yellowAccent, text: "/", callBack: calculationButton),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,          //Number and Opeations keys//
              children: [
                NumberButtons(color: Colors.blueGrey, text: "9", callBack: calculationButton),
                NumberButtons(color: Colors.blueGrey, text: "8 ", callBack: calculationButton),
                NumberButtons(color: Colors.blueGrey, text: "7", callBack: calculationButton),
                NumberButtons(color: Colors.yellowAccent, text: "X", callBack: calculationButton),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,          //Number and Opeations keys//
              children: [
                NumberButtons(color: Colors.blueGrey, text: "6", callBack: calculationButton),
                NumberButtons(color: Colors.blueGrey, text: "5", callBack: calculationButton),
                NumberButtons(color: Colors.blueGrey, text: "4", callBack: calculationButton),
                NumberButtons(color: Colors.yellowAccent, text: "-", callBack: calculationButton),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,          //Number and Opeations keys//
              children: [
                NumberButtons(color: Colors.blueGrey, text: "3", callBack: calculationButton),
                NumberButtons(color: Colors.blueGrey, text: "2", callBack: calculationButton),
                NumberButtons(color: Colors.blueGrey, text: "1", callBack: calculationButton),
                NumberButtons(color: Colors.yellowAccent, text: "+", callBack: calculationButton),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,          //Number and Opeations keys//
              children: [
                NumberButtons(color: Colors.blueGrey, text: "+/-", callBack: calculationButton),
                NumberButtons(color: Colors.blueGrey, text: "0", callBack: calculationButton),
                NumberButtons(color: Colors.blueGrey, text: "00", callBack: calculationButton),
                NumberButtons(color: Colors.yellowAccent, text: "=", callBack: calculationButton),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



//custom widget for Number and Opeations keys// Buttons//

class NumberButtons extends StatelessWidget {

  Color color;
  String text;
  final Function callBack;

  NumberButtons({required this.color,required this.text,required this.callBack});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: SizedBox(
          height: 70,
          width: 70,
          child: OutlinedButton(
              onPressed: () => callBack(text),
              child: Text(
                text,
                style: TextStyle(fontSize:22, color: Colors.black,fontWeight: FontWeight.w800),
              )),
        ),
      ),
    );
  }
}
