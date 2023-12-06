import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constant.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? pass;

   bool isLoading = false;

   final GlobalKey<FormState> _globalkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:isLoading ,
      child: Scaffold(
        backgroundColor:kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: _globalkey,
            child: ListView(
              children: [
                Image.asset('assets/images/sss.png',height: 50,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Chat",style: TextStyle(fontSize: 32,fontFamily: 'pacifico',color: Colors.white)),
                  ],
                ),
                const Row(
                  children: [
                    Text("Register",style: TextStyle(fontSize: 25,color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 12,),
                CustomTextField(
                  obsecure: false,
                  hint: 'Email', onChanged: (data ) {email=data;},
                ),
                const SizedBox(height: 15,),
                CustomTextField(
                  obsecure: true,
                  hint: 'Password', onChanged: (data ) {pass=data;},
                ),
                 CustomButton(
                  text: 'Register', onTap: () async {
                    if(_globalkey.currentState!.validate()){
                    isLoading=true;
                    setState(() {
                    });
                   try {
                     final credential = await FirebaseAuth.instance
                         .createUserWithEmailAndPassword(
                       email: email!,
                       password: pass!,
                     );
                     Navigator.pop(context);
                   } on FirebaseAuthException catch (e) {
                     if (e.code == 'weak-password') {
                       print('The password provided is too weak.');
                     } else if (e.code == 'email-already-in-use') {
                       print('The account already exists for that email.');
                     }
                   } catch (e) {
                     print(e);
                   }
                   isLoading=false;
                   setState(() {
                   });
                 }else{}
                    },
                ),
                const SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('have an account?',style: TextStyle(color: Colors.white),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: const Text('    Login',style: TextStyle(color: Color(0xffC7EDE6)),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
