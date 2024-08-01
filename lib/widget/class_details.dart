import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassDetails extends StatefulWidget {
  const ClassDetails({super.key});

  @override
  State<ClassDetails> createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<ClassDetails> {
  String course ="Software Systems";

  String sem="1";

  String hour="1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Details"),
      ),
      body:Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Container(
            margin: const EdgeInsets.all(40),
            height: 70,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade100,
            child: DropdownButton<String>(
              hint: const Text("Course"),
              dropdownColor: Colors.grey.shade200,
              isExpanded: true,
              value: course,
              icon: const Icon(Icons.arrow_drop_down),
              onChanged: (String? newValue){
                setState(() {
                  course=newValue!;
                });
              },
              items:<String> [
                "Software Systems",
                "Theoretical Computer Science"
                ,"Data Science",
                "Cyber Security"
              ].map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
                value:value,
                  child:Text(value));
                }).toList(),

                )

            ),
          Container(
              margin: const EdgeInsets.all(40),
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade100,
              child: DropdownButton<String>(
                hint: const Text("Sem"),
                dropdownColor: Colors.grey.shade200,
                isExpanded: true,
                value: sem,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue){
                  setState(() {
                    sem=newValue!;
                  });
                },
                items:<String> [
                  "1","2","3","4","5","6","7","8","9","10"
                ].map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                      value:value,
                      child:Text(value));
                }).toList(),

              )

          ),
          Container(
              margin: const EdgeInsets.all(40),
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade100,
              child: DropdownButton<String>(
                hint: const Text("Hour"),
                dropdownColor: Colors.grey.shade200,
                isExpanded: true,
                value: hour,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue){
                  setState(() {
                    hour=newValue!;
                  });
                },
                items:<String> [
                  "1","2","3","4","5","6","7","8"
                ].map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                      value:value,
                      child:Text(value));
                }).toList(),

              )

          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.lightBlue[100],
            ),
            child:ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.cyan),
              ),
              child:const Center(
                child:Text(
                  "Confirm",
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ) ,
              onPressed:(){
               /* Navigator.push(context, MaterialPageRoute(builder: (context)=>());Navigate to the page where QR gets generated*/
              },

            ),
          ),


        ]),
      ),
    );
  }
}
