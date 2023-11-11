import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/colors.dart';


class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintTextt;
  final int maxline;
  final TextInputType keyboardType;
  final bool obscureText;
  final double sWidth;
  final double? sHeight;
  final Widget? suffix;
  final Widget? preffix;
  final bool readOnly;
  final VoidCallback? ontap;
  String? Function(String?)? validator;
  final Function(String)? onChange;

  MyTextField({
    Key? key,
    this.hintTextt = '',
    this.readOnly= false,
    this.controller,
    this.maxline = 1,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.sWidth=1000,
    this.sHeight=80,
    this.suffix,
    this.preffix,
    this.ontap,
    this.validator,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: sWidth,
        height: maxline==1?sHeight:maxline*30.0,
        child: TextFormField(
          onChanged: onChange,
          validator:validator,
          readOnly: readOnly,
          keyboardType: keyboardType,
          maxLines: maxline,
          controller: controller,
          style: const TextStyle(color: Colors.black),
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffFFFEFE),
            suffix: suffix,
            prefix: preffix,
            contentPadding: EdgeInsets.only(
              top: maxline>1?Get.height*.03:0,
              left: Get.width * .01,
              right: Get.width * .01,
            ),
            // isDense: true,
            hintText: hintTextt,
            hintStyle: const TextStyle(color: Color(0xff979292,),fontSize: 12),
            focusedBorder:
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: bColor),),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: bColor),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ),
    );
  }
}
