import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState(); 
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: const Text("Home Screen"), 
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/pngtree-gradient-background-jpg-blue-image_982140.jpg"),
          fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Text("Welcome to the portal",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
        ) 
      ),
    );
  }
}