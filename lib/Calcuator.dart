import 'dart:ffi';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/sql_dp.dart';
class Calculator extends StatefulWidget {


  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
double num1 =0.0;
double num2 =0.0;
double res =0.0;
String oper ='';
String f_res='';
//data base
List<Map> response=[];
late  Function function;
sql_dp mydb=sql_dp();


  Widget buttonForm (String txt,Color c,double x,function  ) {
    return Container(

  child:
 MaterialButton(

   focusColor: Colors.black12,
   color:Colors.white10,
   height: double.infinity,
   onPressed: function ,
child:

    Text(txt,style: TextStyle(
    fontSize: x,color:c,

    ),),

 )
);


  }
initState(){
  mydb.intialDb();
}





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator',style:TextStyle(color: Colors.cyan),),
        backgroundColor: Colors.black,

      ),

body: Padding(
  padding:EdgeInsets.all(5),
child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Padding(
       padding: EdgeInsets.symmetric(vertical: 40),

        child: Row(

          children: [
            Text(f_res,
            textAlign:TextAlign.left ,
            style: TextStyle(
              color:Colors.white,
              fontSize:60,

            ),

            ),
          ],
        ),
      ),


    Expanded(
      child: Row(

        children: [
          Expanded(child: buttonForm('C',Colors.cyan,28,(){

            num1 =0.0;
           num2 =0.0;
           res =0.0;
           oper ='';
           f_res='';
            setState(() {

            });
          })),
          Expanded(child: buttonForm('%',Colors.cyan,28,(){
            
            if(f_res==''){
            showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text('Error'),
              content: Text('Please enter the first number'),
            ));
            }
            
            else{

                oper='%';
                res= double.parse(f_res);
                num1=res;
                f_res='';



          setState(() {

          });
        
          
          
          
          }})),
          Expanded(child: buttonForm('^ ',Colors.cyan,28,(){


          if(f_res==''){
            showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text('Error'),
              content: Text('Please enter the first number'),
            ));
          }else

            oper='^';
          res= double.parse(f_res);
          num1=res;
          f_res='';
          setState(() {

          });
          }
          )),
          Expanded(child:buttonForm('/',Colors.cyan,32,(){

          if(f_res==''){
            showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text('Error'),
              content: Text('Please enter the first number'),
            ));
          }else{

            oper='/';
            res= double.parse(f_res);
            num1=res;
            f_res='';  setState(() {

          });}}
          )),

        ],
      ),
    ),
    Expanded(
      child: Row(

        children: [
          Expanded(child: buttonForm('7',Colors.white,28,(){

            f_res+='7';
            setState(() {

          });})),
          Expanded(child: buttonForm('8',Colors.white,28,(){
            if (f_res=='0'){

              f_res='';
            }
            f_res+='8';   setState(() {

          });})),
          Expanded(child: buttonForm('9',Colors.white,28,(){
            if (f_res=='0'){

              f_res='';
            }
            f_res+='9';   setState(() {

          });})),
          Expanded(child:buttonForm('x',Colors.cyan,32,() {
            if (f_res == '') {
              showDialog(context: context, builder: (context) =>
                  AlertDialog(
                    title: Text('Error'),
                    content: Text('Please enter the first number'),
                  ));
            } else {
              oper = '*';


              res= double.parse(f_res);
              num1=res;
              f_res='';
              setState(() {

              });
            }
          })),

        ],
      ),
    ),
    Expanded(
      child: Row(

        children: [
          Expanded(child: buttonForm('4',Colors.white,28,(){
            if (f_res=='0'){

              f_res='';
            }
            f_res+='4';   setState(() {

          });})),
          Expanded(child: buttonForm('5',Colors.white,28,(){
            if (f_res=='0'){

              f_res='';
            }
            f_res+='5';   setState(() {

          });})),
          Expanded(child: buttonForm('6',Colors.white,28,(){
            if (f_res=='0'){

              f_res='';
            }
            f_res+='6';   setState(() {

          });})),
          Expanded(child:buttonForm('-',Colors.cyan,32,(){


          if(f_res==''){
            showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text('Error'),
              content: Text('Please enter the first number'),
            ));
          }else{
            oper='-';
            res= double.parse(f_res);
            num1=res;
            f_res='';  setState(() {

          });}})),

        ],
      ),
    ),
    Expanded(
      child: Row(

        children: [
          Expanded(child: buttonForm('1',Colors.white,28,(){
            if (f_res=='0'){

              f_res='';
            }
            f_res+='1';   setState(() {

          });})),
          Expanded(child: buttonForm('2',Colors.white,28,(){
            if (f_res=='0'){

              f_res='';
            }
            f_res+='2';   setState(() {

          });})),
          Expanded(child: buttonForm('3',Colors.white,28,(){
            if (f_res=='0'){

              f_res='';
            }
            f_res+='3';   setState(() {

          });})),
          Expanded(child:buttonForm('+',Colors.cyan,32,(){

          if(f_res==''){
            showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text('Error'),
              content: Text('Please enter the first number'),
            ));
          }else{
            oper='+';
            res= double.parse(f_res);
            num1=res;
            f_res='';   setState(() {

          });}}
          )),

        ],
      ),
    ),
    Expanded(
      child: Row(

        children: [
          Expanded(child: buttonForm('.',Colors.white,32,(){

             if(f_res==''){
               f_res += '0.';

            }else if(f_res.contains('.')==false) {
               f_res += '.';
             }
            setState(() {

          });})),
          Expanded(child: buttonForm('0',Colors.white,32,(){
            if (f_res=='0'){

              f_res='';
            }
            f_res+='0';   setState(() {

          });})),
          Expanded(child: buttonForm('Ans',Colors.white,25,()async
          {
            response= await mydb.select("SELECT * FROM result " );
            double f=response[response.length-1]['res'];
            print(response);
            f_res="$f";

            setState(() {

            });

          })),
          Expanded(child:buttonForm('=',Colors.cyan,32,() async {



            if(num1!=0) {
              num2 = double.parse(f_res);
              if (oper == '%') {
                res %= num2;
              } else if (oper == '^') {
                double j = res;
                for (int i = 1; i < num2; i++) {
                  res *= j;
                }
              } else if (oper == '/') {
                res /= num2;
              } else if (oper == '*') {
                res *= num2;
              } else if (oper == '-') {
                res -= num2;
              } else if (oper == '+') {
                res += num2;
              }
              oper = '';
              f_res = res.toString();
              setState(() {

              });
              response= await mydb.select("SELECT * FROM result " );
              if (response.isEmpty) {
                 mydb.insert("INSERT INTO result (res) VALUES ($res) ");
              } else {
                mydb.delete("DELETE FROM result");
                mydb.insert("INSERT INTO result (res) VALUES ($res) ");
              }
            }


          })),

        ],
      ),
    ),
  ],
),
),



    );
  }
}
