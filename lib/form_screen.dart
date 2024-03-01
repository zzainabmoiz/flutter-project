import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/login_form_screen.dart';
import 'package:project1/main.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool isHide = true;

  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userPhone = TextEditingController();


  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    userName.dispose();
    userEmail.dispose();
    userPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(child: Text("REGISTRATION FORM", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical:10),

              child: TextFormField(
                controller: userName,
                validator: (value){
                  if (value == null || value.isEmpty|| value== "") {
                    return"please enter name";

                  }
                  else{
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    label: Text("Enter Name"),
                    prefixIcon: Icon(Icons.person),
                    hintText: "shadab khan",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical:10),

              child: TextFormField(
                controller: userPhone,
                maxLength: 11,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11)
                ],
                validator: (value){
                  if (value == null || value.isEmpty|| value== "") {
                    return"please enter name";

                  }
                  if (value.length<11) {
                    return"phone number must be of 11 digits";

                  }
                  else{
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    label: Text("Enter Phone Number"),
                    prefixIcon: Icon(Icons.phone),
                    hintText: "09876545672",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical:10),

              child: TextFormField(
                controller: userEmail,
                validator: (value){
                  if (value == null || value.isEmpty|| value== "") {
                    return"please enter email";

                  }
                  else{
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    label: Text("Enter Email"),
                    prefixIcon: Icon(Icons.mail),
                    hintText: "shadabkhan@gmail.com",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical:10),

              child: TextFormField(
                controller: userPassword,
                obscureText: isHide == true? true: false,
                obscuringCharacter: '-',
                validator: (value){
                  if (value == null || value.isEmpty|| value== "") {
                    return"please enter password";

                  }
                  if (value.length < 6) {
                    return"enter more than 6 characters";

                  }
                  else{
                    return null;
                  }
                },
                decoration:  InputDecoration(
                    label: Text("Enter Password"),
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        isHide = !isHide;
                      });
                    }, icon: Icon(Icons.remove_red_eye),),
                    hintText: "sh****123",
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    )
                ),
              ),
            ),
            ElevatedButton(onPressed: (){

              if (formKey.currentState!.validate()) {
                debugPrint(userName.text);
                debugPrint(userEmail.text);
                debugPrint(userPassword.text);
                debugPrint(userPhone.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("User Registered as:${userName.text}"),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  backgroundColor: Colors.green,)
                );
                userName.clear();
                userEmail.clear();
                userPassword.clear();
                userPhone.clear();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHome(),));

              }


            }, child: const Text("Sign up")),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
            }, child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}