import 'package:flutter/material.dart';
 class CubitHome extends StatefulWidget {
   const CubitHome({super.key});

   @override
   State<CubitHome> createState() => _CubitHomeState();
 }

 class _CubitHomeState extends State<CubitHome> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
        body: SafeArea(
          child: Center(
            child:  Text('Loading....'),
          ),
        ),
     );
   }
 }
