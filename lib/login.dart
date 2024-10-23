import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivehomescreen/homescreen.dart';

class Login extends StatefulWidget{
  const Login({super.key});
  @override
  State<Login> createState()=>_LoginState();
}
class _LoginState extends State<Login>{
late Box box;

TextEditingController usernameController=TextEditingController();
TextEditingController PasswordController=TextEditingController();
String _loginMessage="";

void initState(){
  super.initState();
  box=Hive.box('my box');
}

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage("assets/images/pngtree-gradient-background-jpg-blue-image_982140.jpg"),
         
         fit: BoxFit.cover,
         
         ) 
        ),
        child: Center(
          child: Padding(padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
              SizedBox(height: 80),
              SizedBox(height: 50,
              width: 300,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "User Name",border: OutlineInputBorder()
                ),
                onChanged: (text){
                  setState(() {
                    _loginMessage="";
                  });
                },
              ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 50,
              width: 300,
              child: TextField(
                controller: PasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",border: OutlineInputBorder()
                ),
                onChanged: (text){
                  setState(() {
                    _loginMessage="";
                  });
                },
              ),
              ),
              SizedBox(height: 45),
              SizedBox(width: 300,
              child:ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 81, 4, 94),
                shape: RoundedRectangleBorder(),
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                List<dynamic>userListDynamic=box.get('registeritemsList',defaultValue: []);

                List<Map<String,String>>usersList=userListDynamic
                .map(
                  (e)=>Map<String,String>.from(e as Map))
                  .toList();

                  bool userFound=false;
                  bool passwordCorrect=false;

                  for(var user in usersList){
                    if(user["Fullname"]==usernameController.text){
                      userFound=true;
                      if(user["Password"]==PasswordController.text){
                        passwordCorrect=true;
                        break;
                      }
                    }
                  }
                  if(userFound && passwordCorrect){
                    setState(() {
                      _loginMessage="Login Successfull";
                    });
                    Navigator.push(
                      context, MaterialPageRoute(builder: (BuildContext context)=>
                      HomeScreen()));

                      usernameController.clear();
                      PasswordController.clear();
                  }else if(userFound){
                    setState(() {
                      _loginMessage="Incorrect Password";
                    });
                  }else{
                    setState(() {
                      _loginMessage="Username not found";
                    });
                  }
              },
              child: Text("Login",
              style: TextStyle(color: Colors.black),
              ),
              )
              ),
              SizedBox(height: 35),
              Text("$_loginMessage"),
            ],
          ),
          ),
        ),)
    );
  }
}
