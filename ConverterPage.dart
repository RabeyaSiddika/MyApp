import 'package:flutter/material.dart';

 class ConverterPage extends StatefulWidget {
   const ConverterPage({super.key});
   @override
   State<ConverterPage> createState() => _ConverterPageState();
 }
 class _ConverterPageState extends State<ConverterPage> {
   //variable that stores the converted currency value
   double result = 0;
 
   //For TextField value
   TextEditingController textEditingController = TextEditingController();
 
   void convert() {
    final text = textEditingController.value.text;
     if (text.isEmpty) {
       errorText = 'Can\'t be empty';
     } else {
       errorText = null;
       result = double.parse(textEditingController.text) * 122.23;
     }
     setState(() {});
   }
 
   @override
   void dispose() {
     textEditingController.dispose();
     super.dispose();
   }
 
   String? errorText;
  @override
   Widget build(Object context) {
     final border = OutlineInputBorder(
       borderSide: BorderSide(
         color: const Color.fromARGB(255, 39, 208, 27),
         width: 2,
         style: BorderStyle.solid,
       ),
       borderRadius: BorderRadius.all(Radius.circular(40)),
     );
     final textStyle = TextStyle(
       color: const Color.fromARGB(255, 45, 235, 11),
       fontSize: 23,
       fontWeight: FontWeight.bold,
     );
  return Scaffold(
       appBar: AppBar(
         title: Text(
           "Currency Converter",
           style: TextStyle(
             color: Colors.white,
             fontSize: 25,
             fontWeight: FontWeight.bold,
           ),
         ),
         elevation: 5,
         centerTitle: true,
         backgroundColor: const Color.fromARGB(255, 46, 230, 9),
       ),
       body: Center(
         child: SizedBox(
           width: 400,
           height: 500,
           child: Card(
             elevation: 5,
             shadowColor: const Color.fromARGB(255, 28, 205, 8),
             color: const Color.fromARGB(255, 255, 255, 255),
             // shadowColor: const Color.fromARGB(255, 104, 95, 95),
             // color: const Color.fromARGB(255, 255, 255, 255),
             child: Padding(
               padding: const EdgeInsets.all(30.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('USD ', style: textStyle),
                       Icon(
                         Icons.arrow_forward,
                         color: const Color.fromARGB(255, 71, 218, 30),
                       ),
                       Text(' BDT', style: textStyle),
                     ],
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   TextField(
                     controller: textEditingController,
                     style: TextStyle(color: Colors.black),
                     decoration: InputDecoration(
                       errorText: errorText,
                       errorBorder: border,
                       focusedErrorBorder: border,
                       label: Text("Amount"),
                       labelStyle: TextStyle(color: Colors.black),
                       hintText: "Enter amount",
                       prefixIcon: Icon(Icons.monetization_on),
                       prefixIconColor: const Color.fromARGB(255, 104, 200, 7),
                       focusedBorder: border,
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(
                           Radius.circular(40),
                         ),
                       ),
                     ),
                     keyboardType: TextInputType.numberWithOptions(
                       decimal: true,
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   TextButton(
                     onPressed: () => convert(),
                     style: TextButton.styleFrom(
                         backgroundColor: const Color.fromARGB(255, 16, 224, 9),
                         foregroundColor:
                             const Color.fromARGB(255, 255, 255, 255),
                         minimumSize: Size(double.infinity, 50)),
                     child: Text("Convert"),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Text(
                     'BDT ${result.toStringAsFixed(2)}',
                     style: TextStyle(
                       color: const Color.fromARGB(255, 59, 214, 16),
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ),
       ),
     );
   }
 }