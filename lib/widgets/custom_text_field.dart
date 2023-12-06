import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, this.hint,required this.onChanged,required this.obsecure});
 String? hint;
 bool obsecure ;
 Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obsecure,
      validator: (val){
        if(val!.isEmpty){
          return "$hint";
        }
      },
      onChanged:onChanged ,
      decoration:  InputDecoration(
        hintText:hint ,
          hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderSide:BorderSide(color: Colors.white) ,
          )
      ),
    );
  }
}
