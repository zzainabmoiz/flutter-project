import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/login_form_screen.dart';
import 'package:project1/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _FormScreenState();
}

class _FormScreenState extends State<Login> {
  bool isHide = true;

 
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();



  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose

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
                    label: const Text("Enter Password"),
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        isHide = !isHide;
                      });
                    }, icon: const Icon(Icons.remove_red_eye),),
                    hintText: "sh****123",
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    )
                ),
              ),
            ),
             const SizedBox(
              height: 20,
            ),
            OutlinedButton(onPressed: () {
              if (formKey.currentState!.validate()) {
                debugPrint(userEmail.text);
                debugPrint(userPassword.text);

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("User Registered as:${userEmail.text}"),
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      backgroundColor: Colors.green,)
                );

                userEmail.clear();
                userPassword.clear();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyHome(),));
              }
            },
              child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}