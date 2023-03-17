import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(myapp());
}

class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'myapp',
    home:firstpage(),
   );
  }

}

class firstpage extends StatefulWidget{
  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

    int firstnum=0;
    int secondnum=0;
    String output="0";
    String textToDisplay="0";
    String res='';
    String operator='';
    void btnclick(String btnvalue){
      if(btnvalue=="C"){
        textToDisplay='';
        firstnum=0;
        secondnum=0;
        res='';
      }
      else if(btnvalue=='+'||btnvalue=="-"||btnvalue=='x'||btnvalue=='/'){
        firstnum=int.parse(textToDisplay);
        res="";
        operator=btnvalue;
      }
      else if(btnvalue=='='){
        secondnum=int.parse(textToDisplay);
        if(operator=='+'){
          res=(firstnum+secondnum).toString();
          output=firstnum.toString()+operator.toString()+secondnum.toString();
        }
        if(operator=='-'){
          res=(firstnum-secondnum).toString();
          output=firstnum.toString()+operator.toString()+secondnum.toString();
        }
        if(operator=='x'){
          res=(firstnum*secondnum).toString();
          output=firstnum.toString()+operator.toString()+secondnum.toString();
        }
        if(operator=='/'){
          res=(firstnum/secondnum).toString();
          output=firstnum.toString()+operator.toString()+secondnum.toString();
        }
      }else{
        res=int.parse(textToDisplay+btnvalue).toString();
      }
      setState(() {
        textToDisplay=res;
      });
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.black87,
       centerTitle: true,
       title: Text('Calculator',style: TextStyle(fontSize: 30),),
     ),
     backgroundColor: Colors.black87,
     body: Container(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(30),
                   child: Container(
                     alignment: Alignment.bottomRight,
                     child: Text(output,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.grey),),
                   ),

                 )
             ),
             Padding(
               padding: const EdgeInsets.all(30),
               child: Container(
                 alignment: Alignment.bottomRight,
                 child: Text(textToDisplay,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.grey),),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(11),
               child: Row(
                 children: [
                   btn('9'), btn('8'), btn('7'), btn('+')
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(11),
               child: Row(
                 children: [
                   btn('6'), btn('5'),btn('4'),btn('-')
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(11),
               child: Row(
                 children: [
                   btn('3'), btn('2'),btn('1'),btn('x')
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(11),
               child: Row(
                 children: [
                   btn('C'), btn('0'),btn('='),btn('/')
                 ],
               ),
             )
           ],
         ),
       ),
     ),


   );
  }

  Widget btn(String btnvalue){
    return Expanded(
        child:SizedBox(
          height: 70,
          width: 70,
          child: MaterialButton(
            onPressed: ()=>btnclick(btnvalue),
            child: Text(btnvalue,style: TextStyle(fontSize: 30,color: Colors.black87),),
            shape: CircleBorder(),
            color: Colors.white70,
          ),
        ),

    );
  }
}
