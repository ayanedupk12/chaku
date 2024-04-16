

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/email_password_validator.dart';
import 'package:form/widgets/ProductCard.dart';
import 'package:form/widgets/checkbox.dart';
import 'package:form/widgets/controller.dart';
import 'package:form/widgets/dropDown.dart';
import 'package:form/widgets/my_textfield.dart';
import 'package:get/get.dart';

class ShowCaseScreen extends StatelessWidget {
   ShowCaseScreen({super.key});
  final validator = Get.put(ValidatorController());
  final controller= Get.put(FormController());


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        // Disable browser navigation
        SystemChannels.navigation.invokeMethod<void>('popRoute');

        // Return false to prevent popping the route
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
          child: GetBuilder<FormController>(
            builder: (__) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/logo.jpg')),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text('Products found ${controller.products.length}'),
                  ),

                  context.width>500
                      ?Expanded(
                    child: GridView.builder(
                      shrinkWrap : true,
                      itemCount: controller.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio:1/2.5,

                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            __.forwardProductToWhatsApp(controller.products[index]);
                          },
                          child: Card(
                            child: SizedBox(
                              height: context.height*0.3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image.network(__.products[index].image!),
                                    Center(
                                      child: SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: CachedNetworkImage(
                                          imageUrl:__.products[index].image!,
                                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                                              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    // __.products[index].image==null?CircleAvatar():CircleAvatar(
                                    //   radius: 30,
                                    //   backgroundImage: CachedNetworkImageProvider(
                                    //
                                    //   ),
                                    //   child: __.products[index].image == null
                                    //       ? CircularProgressIndicator()
                                    //       : null,
                                    // ),
                                    Text(
                                      __.products[index].name!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text('ID: ${__.products[index].id}'),
                                    Text('Name: ${__.products[index].name}'),
                                    Text('Description: ${__.products[index].description}'),
                                    Text('Price: ${__.products[index].price}'),
                                    Text('Size: ${__.products[index].size}'),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                      :Expanded(
                    child: ListView.builder(
                      shrinkWrap : true,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            __.forwardProductToWhatsApp(controller.products[index]);
                          },
                          child: Card(
                            elevation: 3,
                            margin: EdgeInsets.all(10),
                            child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image.network(__.products[index].image!),
                                  Center(
                                    child: SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: CachedNetworkImage(
                                        imageUrl:__.products[index].image!,
                                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                                            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  // __.products[index].image==null?CircleAvatar():CircleAvatar(
                                  //   radius: 30,
                                  //   backgroundImage: CachedNetworkImageProvider(
                                  //
                                  //   ),
                                  //   child: __.products[index].image == null
                                  //       ? CircularProgressIndicator()
                                  //       : null,
                                  // ),
                                  Text(
                                    __.products[index].name!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text('ID: ${__.products[index].id}'),
                                  Text('Name: ${__.products[index].name}'),
                                  Text('Description: ${__.products[index].description}'),
                                  Text('Price: ${__.products[index].price}'),
                                  Text('Size: ${__.products[index].size}'),

                                ],
                              ),
                            )

                            // ListTile(
                            //   leading:
                            //
                            //   title:
                            //   subtitle: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //
                            //       // SizedBox(height: 8),
                            //       // Text('Apply Date: ${products[index].applyDate}'),
                            //     ],
                            //   ),
                            //   onTap: () {
                            //     // Handle tap on a student
                            //     print('Tapped on ${products[index].name}');
                            //     // Add navigation or other actions as needed
                            //   },
                            // ),
                          ),
                        );
                      },
                    ),
                  ),


                  // Center(child: Text('Admission For Flutter Training',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                  // SizedBox(height: 20,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     MyTextField(
                  //       validator: validator.emailValidator,
                  //       controller: controller.firstName,
                  //       sWidth:context.width*0.4,
                  //       hintTextt: 'First Name',),
                  //     SizedBox(width: 20,),
                  //     MyTextField(
                  //       sWidth:context.width*0.4,
                  //       controller: controller.lastName,
                  //       hintTextt: 'Last Name',),
                  //     // SizedBox(width: 20,),
                  //   ],
                  // ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: MyTextField(
                  //     controller: controller.fatherName,
                  //     sWidth:context.width*0.84,
                  //     hintTextt: 'Father Name',),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Center(
                  //       child: ElevatedButton(
                  //         onPressed: () => controller.selectDate(context),
                  //         child: const Text('select date of birth'),
                  //       ),
                  //     ),
                  //     SizedBox(width: 20,),
                  //     Center(child: Text('MM/DD/YY',style: TextStyle(color: Colors.grey),)),
                  //     SizedBox(width: 20,),
                  //     Center(child: Text(
                  //       controller.selectedDate!=null
                  //           ?controller.selectedDate.toString().split(' ')[0].split('-')[1]+'/'+
                  //           controller.selectedDate.toString().split(' ')[0].split('-')[2]+'/'+
                  //           controller.selectedDate.toString().split(' ')[0].split('-')[0]
                  //           :'',
                  //       style: TextStyle(fontWeight: FontWeight.bold),))
                  //   ],
                  // ),
                  // SizedBox(height: 30,),
                  // CustomDropdownFormField(
                  //   text: 'Current Level',
                  //   onChange: (val){
                  //     __.currentLevel.text=val!;
                  //   },
                  //   actionsList: [
                  //     "Matric",
                  //     "FSc",
                  //     "University",
                  //   ],
                  //   height: 60,
                  //   width: context.width*0.84,
                  // ),
                  // SizedBox(height: 30,),
                  //
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: MyTextField(
                  //     controller: controller.nIC,
                  //     sWidth:context.width*0.84,
                  //     hintTextt: 'NIC(if you have)',),
                  // ),
                  // SizedBox(width: 20,),
                  //
                  // Row(
                  //   children: [
                  //     MyTextField(
                  //       controller: controller.schoolOrCollege,
                  //       sWidth:context.width*0.4,
                  //       hintTextt: 'School/College',),
                  //     SizedBox(width: 20,),
                  //     Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: MyTextField(
                  //         controller: controller.className,
                  //         sWidth:context.width*0.4,
                  //         hintTextt: 'Class',),
                  //     ),
                  //   ],
                  // ),
                  // // SizedBox(height: 20,),
                  // Row(
                  //   children: [
                  //     MyTextField(
                  //       controller: controller.rollNumber,
                  //       sWidth:context.width*0.4,
                  //       hintTextt: 'Roll Number',),
                  //     SizedBox(width: 20,),
                  //     MyTextField(
                  //       controller: controller.phoneNumber,
                  //       sWidth:context.width*0.4,
                  //       hintTextt: 'Phone Number',),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     MyTextField(
                  //       controller: controller.city,
                  //       sWidth:context.width*0.4,
                  //       hintTextt: 'City',),
                  //     SizedBox(width: 20,),
                  //     MyTextField(
                  //       controller: controller.homeAddress,
                  //       sWidth:context.width*0.4,
                  //       hintTextt: 'Home Address',),
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     ElevatedButton(
                  //       onPressed: ()async{
                  //         String? url= await controller.pickImage();
                  //         controller.profilePhoto=url!;
                  //
                  //       },
                  //       child: controller.imageUploading?SizedBox(height:20,width:20,child: CircularProgressIndicator(color: Colors.black,)):Text('Choose File'),
                  //     ),
                  //     SizedBox(width: 20,),
                  //     Flexible(child: Text(controller.profilePhoto.split('=').last))
                  //   ],
                  // ),
                  // SizedBox(height: 20,),
                  // Row(
                  //   children: [
                  //     CustomCheckbox(value: controller.feeConfirmed, onChanged: (bool value) {
                  //       controller.feeConfirmed=value;
                  //     },),
                  //     SizedBox(width: 10,),
                  //     Flexible(child: Text('By cheking this option You will agree to our admission terms and condition. admission fee is 500'))
                  //   ],
                  // ),
                  // SizedBox(height: 20,),
                  // Row(
                  //   children: [
                  //     CustomCheckbox(value: controller.monthlyFeeConfirmed, onChanged: (bool value) {
                  //       controller.monthlyFeeConfirmed=value;
                  //     },),
                  //     SizedBox(width: 10,),
                  //     Flexible(child: Text('By cheking this option You will agree to our monthly admission terms and condition. admission fee is 4500'))
                  //   ],
                  // ),
                  // SizedBox(height: 20,),
                  // Center(
                  //   child: ElevatedButton(
                  //     onPressed: (){
                  //       controller.submitForm(context);
                  //
                  //     },
                  //     child: controller.formSubmitting?SizedBox(height:20,width:20,child: CircularProgressIndicator(color: Colors.black,)):Text('Submit Form'),
                  //   ),
                  // ),
                  SizedBox(height: 40,)


                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
