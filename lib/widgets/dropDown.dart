import 'package:flutter/material.dart';
import 'package:form/Constants/styles.dart';
import 'package:get/get.dart';


class CustomDropdownFormField<T> extends StatelessWidget {
  String? text;
  final ValueChanged<String?>? onChange;
  List<String>? actionsList;
  final double? width;
  final double? height;

  CustomDropdownFormField({
    Key? key,
    this.onChange,
    this.text,
    this.actionsList,
    this.width,
    this.height

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??context.width*0.3,
      height: height??context.height*0.2,
      child: Center(
        child: DropdownButtonFormField(
          // value: controller.prevState!.state ?? '',
          isExpanded: true,
          hint: Text(text!,style: hintTextStyle.copyWith(fontSize: 12),),
          onChanged: onChange,
          items:
          // controller.states.length==0?controller.tempListForNoItems:
          actionsList!.map((type) {
            // controller.prevState=state;
            return DropdownMenuItem(
              value: type,
              child: Text(type),
            );
          }).toList(),
          decoration: InputDecoration(
            isDense: true,
            // contentPadding: EdgeInsets.all(8),
            // fillColor: Colors.white,
            // filled: true,
            enabled: true,
            focusedBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
