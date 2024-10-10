import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterSharedpref extends StatefulWidget{
  const RegisterSharedpref({super.key});

  @override  
  State< RegisterSharedpref> createState()=> _RegisterSharedprefState();
}

class _RegisterSharedprefState extends State<RegisterSharedpref>{
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  String _registrationMessage='';

  Future<void> _register() async {
SharedPreferences prefs =await SharedPreferences.getInstance();
String? username=usernameController.text;
String? password=passwordController.text;

if(username.isNotEmpty&&password.isNotEmpty){
  await prefs.setString('username', username);
   await prefs.setString('password', password);

  setState(() {
    _registrationMessage='Registeration Sucessful!';
  });
}else{
  setState(() {
    _registrationMessage='Please fill in both fields!';
  });
}
  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
padding: EdgeInsets.symmetric(vertical: 30),
width: double.infinity,
decoration: BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    colors: <Color>[
      Color.fromARGB(244, 0, 255, 8),
      Colors.green,
      const Color.fromARGB(255, 5, 83, 55),
    ],
    ),
),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    SizedBox(height: 80),
    Padding(padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Register",
          style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
      ],
    ),
    ),
    Expanded(
      child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
    child:Padding(
      padding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 15,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text("User Name",style: TextStyle(fontSize: 15,color: Colors.black,
        fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
        ),
        SizedBox(height: 10),
        TextField(controller: usernameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
          ),
        ),
        ),
        SizedBox(height: 15),
        Text("Password",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
        ),
        SizedBox(height: 10),
        TextField(controller: passwordController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        obscureText: true,
        ),
        SizedBox(height: 15),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
        ),
    SizedBox(height: 60),
    SizedBox(height: 50,width: double.infinity,child: ElevatedButton(onPressed: _register,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
    ),
     child: Text("Login",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,
     ),
     ),
     ),
     ),
     Center(child: Text(_registrationMessage)),
     SizedBox(height: 20),
     TextButton(
        onPressed: (){
        Navigator.pop(context);
      },
       child: Text("Go to Login"),
      ),
      ],
    ),
    ),
    ),
    ),
  ],
),
),
    );
  }
}