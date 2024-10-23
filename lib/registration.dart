import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivehomescreen/login.dart';

class Registration  extends StatefulWidget{
  const Registration({super.key});
  @override
  State<Registration> createState()=>_RegistrationState();
}

class _RegistrationState extends State<Registration>{
late Box box;

  TextEditingController FullnameController=TextEditingController();
  TextEditingController EmailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
  TextEditingController ConfirmpassController=TextEditingController();
  TextEditingController numberController=TextEditingController();

  List<Map<String,String>>registerItems=[];
  String _registetermessage="";

  @override
  void initState(){
    super.initState();
    box=Hive.box('my box');
  }



    @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
          title: Text("Create New Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)

          
          ,),
        ),
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/pngtree-gradient-background-jpg-blue-image_982140.jpg"),
          fit: BoxFit.cover,
          )
          
        ),
        child: Column(
          children: [
            TextField(
              controller: FullnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 5,
                  )
                ),
                hintText: "Fullname.."
              ),
              
            ),
            SizedBox(height: 20),
            TextField(
              controller: EmailController,
              decoration:InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 5,
                  )
                ),
                hintText: "Email.."
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: PasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 5,
                  )
                ),
                hintText: "Password.."
              
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextField(
              controller: ConfirmpassController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 5,
                  )
                ),
                
                hintText: "Confirm Password.."
              
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextField(
              controller: numberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 5,
                  )
                ),
                hintText: "Phone number.."
              ),
            ),
            SizedBox(height: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: ()
                {
                  setState(() {
                    if(FullnameController.text.isEmpty ||
                    EmailController.text.isEmpty ||
                    PasswordController.text.isEmpty||
                    ConfirmpassController.text.isEmpty||
                    numberController.text.isEmpty
                    ){
                      _registetermessage="All fields are required";
                      return;
                    }
                    if(PasswordController.text !=ConfirmpassController.text){
                      _registetermessage="Password do not match";
                      return;
                    }
                    registerItems.add({
                      "Fullname":FullnameController.text,
                      "Email":EmailController.text,
                      "Password":PasswordController.text,
                      "Cpassword":ConfirmpassController.text,
                      "phonenumber":numberController.text,

                    });
                    box.put('registeritemsList', registerItems
                    .map((e) => Map<String,dynamic>.from(e))
                    .toList(),);
                  });
                  print("Registered Items:$registerItems");
                  FullnameController.clear();
                  EmailController.clear();
                  PasswordController.clear();
                  ConfirmpassController.clear();
                  numberController.clear();
                  _registetermessage="Registration Successfull";
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                 child: Text("Register")),
                 SizedBox(height: 35),
                 Text("$_registetermessage"),
                 SizedBox(height: 20),
                 Padding(padding: EdgeInsets.all(15.0),
                 child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>
                        Login()
                        ));
                      },
                      child: Text("Log in",
                      style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                 )
                 ),
                 
                 
              ],
              ),
              ],
              
            ),
            
            
            
      ),
      
    
        );
        
        
      

    
  }
}