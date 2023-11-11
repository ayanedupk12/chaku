

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form/email_password_validator.dart';
import 'package:form/widgets/checkbox.dart';
import 'package:form/widgets/controller.dart';
import 'package:form/widgets/dropDown.dart';
import 'package:form/widgets/my_textfield.dart';
import 'package:get/get.dart';

class FormScreen extends StatelessWidget {
   FormScreen({super.key});
  final validator = Get.put(ValidatorController());
  final controller= Get.put(FormController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
        child: GetBuilder<FormController>(
          builder: (__) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text('Admission For For Flutter Training',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextField(
                        validator: validator.emailValidator,
                        controller: controller.firstName,
                        sWidth:context.width*0.3,
                        hintTextt: 'First Name',),
                      SizedBox(width: 20,),
                      MyTextField(
                        sWidth:context.width*0.3,
                        controller: controller.lastName,
                        hintTextt: 'Last Name',),
                      // SizedBox(width: 20,),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: MyTextField(
                      controller: controller.fatherName,
                      sWidth:context.width*0.3,
                      hintTextt: 'Father Name',),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () => controller.selectDate(context),
                          child: const Text('select date of birth'),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Center(child: Text(controller.selectedDate!=null?controller.selectedDate.toString().split(' ')[0]:'',style: TextStyle(fontWeight: FontWeight.bold),))
                    ],
                  ),
                  SizedBox(height: 30,),
                  CustomDropdownFormField(
                    text: 'Current Level',
                    onChange: (val){
                      __.currentLevel.text=val!;
                    },
                    actionsList: [
                      "Matric",
                      "FSc",
                      "University",
                    ],
                    height: 60,
                    width: context.width*0.65,
                  ),
                  SizedBox(height: 30,),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: MyTextField(
                      controller: controller.nIC,
                      sWidth:context.width*0.65,
                      hintTextt: 'NIC(if you have)',),
                  ),
                  SizedBox(width: 20,),

                  Row(
                    children: [
                      MyTextField(
                        controller: controller.schoolOrCollege,
                        sWidth:context.width*0.3,
                        hintTextt: 'School/College',),
                      SizedBox(width: 20,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MyTextField(
                          controller: controller.className,
                          sWidth:context.width*0.3,
                          hintTextt: 'Class',),
                      ),
                    ],
                  ),
                  // SizedBox(height: 20,),
                  Row(
                    children: [
                      MyTextField(
                        controller: controller.rollNumber,
                        sWidth:context.width*0.3,
                        hintTextt: 'Roll Number',),
                      SizedBox(width: 20,),
                      MyTextField(
                        controller: controller.phoneNumber,
                        sWidth:context.width*0.3,
                        hintTextt: 'Phone Number',),
                    ],
                  ),
                  Row(
                    children: [
                      MyTextField(
                        controller: controller.city,
                        sWidth:context.width*0.3,
                        hintTextt: 'City',),
                      SizedBox(width: 20,),
                      MyTextField(
                        controller: controller.homeAddress,
                        sWidth:context.width*0.3,
                        hintTextt: 'Home Address',),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: ()async{
                          String? url= await controller.pickImage();
                          controller.profilePhoto=url!;

                        },
                        child: controller.imageUploading?SizedBox(height:20,width:20,child: CircularProgressIndicator(color: Colors.black,)):Text('Choose File'),
                      ),
                      SizedBox(width: 20,),
                      Flexible(child: Text(controller.profilePhoto.split('=').last))
                    ],
                  ),
                  Row(
                    children: [
                      CustomCheckbox(value: controller.feeConfirmed, onChanged: (bool value) {
                        controller.feeConfirmed=value;
                      },),
                      SizedBox(width: 10,),
                      Flexible(child: Text('By cheking this option You will agree to our admission terms and condition. admission fee is 500'))
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomCheckbox(value: controller.monthlyFeeConfirmed, onChanged: (bool value) {
                        controller.monthlyFeeConfirmed=value;
                      },),
                      SizedBox(width: 10,),
                      Flexible(child: Text('By cheking this option You will agree to our monthly admission terms and condition. admission fee is 500'))
                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton(
                      onPressed: (){
                        controller.submitForm(context);

                      },
                      child: controller.formSubmitting?SizedBox(height:20,width:20,child: CircularProgressIndicator(color: Colors.black,)):Text('Submit Form'),
                    ),
                  ),
                  SizedBox(height: 40,)


                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
