import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled1/constant.dart';
import 'package:untitled1/screens/register_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'chat_page.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  final GlobalKey<FormState> _globalkey= GlobalKey<FormState>();
  String? pass;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: _globalkey,
            child: ListView(
               children: [
                 Image.asset('assets/images/sss.png',height: 100,),
                 const Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Chat",style: TextStyle(fontSize: 32,fontFamily: 'pacifico',color: Colors.white)),]),
                 const Row(
                   children: [
                     Text("Login",style: TextStyle(fontSize: 25,color: Colors.white)),
                   ],
                 ),
                 const SizedBox(height: 12,),
                 CustomTextField(
                   obsecure: false,
                    hint: 'Email', onChanged: (data ) { email=data; },
                  ),
                 const SizedBox(height: 15,),
                 CustomTextField(
                   obsecure: true,
                   hint: 'Password', onChanged: (data ) {pass=data;},
                 ),
                  CustomButton(
                   text: 'Login', onTap: () async {
                    if(_globalkey.currentState!.validate()){
                      isLoading=true;
                      setState(() {
                      });
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email!,
                          password: pass!,
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  ChatPage(email:email!,),),);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
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
                     const Text('dont have an account?',style: TextStyle(color: Colors.white),),
                     GestureDetector(
                       onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));},
                         child: const Text('    Register',style: TextStyle(color: Color(0xffC7EDE6)),)),
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
