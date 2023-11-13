

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController{
  TextEditingController firstName=TextEditingController();
  TextEditingController lastName=TextEditingController();
  TextEditingController fatherName=TextEditingController();
  TextEditingController nIC=TextEditingController();
  TextEditingController schoolOrCollege=TextEditingController();
  TextEditingController currentLevel=TextEditingController();
  TextEditingController className=TextEditingController();
  TextEditingController rollNumber=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();
  // TextEditingController dateOfBirth=TextEditingController();
  TextEditingController homeAddress=TextEditingController();
  TextEditingController city=TextEditingController();


  //auto
  // TextEditingController applyDate=TextEditingController();
  bool feeConfirmed=false;
  bool monthlyFeeConfirmed=false;


  // datePicker
  DateTime? selectedDate;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!=null?selectedDate!:DateTime(2000),
        firstDate: DateTime(1960),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
     update();
    }
  }


  //image picker
  String profilePhoto='';
  Future<String?> uploadImageToFirebaseStorage(Uint8List imageBytes) async {

    // Access the Firebase Storage instance
    FirebaseStorage storage = FirebaseStorage.instance;

    // try {
      // Generate a unique filename for the uploaded image
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Reference to the image file in Firebase Storage (replace 'images' with your storage bucket path)
      Reference storageReference = storage.ref().child('images/$fileName.jpg');

      // Upload the image to Firebase Storage
      UploadTask uploadTask = storageReference.putData(imageBytes);

      // Wait for the upload to complete
      await uploadTask;

      // Get the download URL of the uploaded image
      String downloadURL = await storageReference.getDownloadURL();

      log('Image uploaded to Firebase Storage: $downloadURL');
      return downloadURL;
    // } catch (error) {
    //   log('Error uploading image to Firebase Storage: $error');
    //   return null;
    // }
  }
  bool imageUploading=false;

  Future<String?> pickImage() async {
    print("upload started");
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      if (kIsWeb) {
        imageUploading=true;
        update();
        Uint8List? imageInUint8List = result.files.first.bytes;
        String? url= await uploadImageToFirebaseStorage(imageInUint8List!);
        imageUploading=false;
        update();
        return url;
      } else {
        return null;
        // Handle image picking for non-web platforms (e.g., mobile)
        // Add your logic here
      }
    } else {
      return null;
      // User canceled the picker
    }

    return null;
  }

  //save data to firestore
  Future<void> saveDataToFireStore(Map<String, dynamic> jsonData) async {
    // Access the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Add the JSON data to a Firestore collection (replace 'json_data' with your collection name)
      DocumentReference documentReference = firestore.collection('Students').doc(firstName.text+"_"+lastName.text+"_"+fatherName.text);
      await documentReference.set(jsonData);

      // await firestore.collection('Students').add(jsonData);


      print('JSON data saved to Firestore successfully!');
    } catch (error) {
      print('Error saving JSON data to Firestore: $error');
    }
  }
  bool formSubmitting=false;
  submitForm(BuildContext context)async{
    formSubmitting=true;
    update();
    if(
        firstName.text!='' &&
        lastName.text!='' &&
        fatherName.text!=''&&
            selectedDate!=null &&
    currentLevel.text!=''&&
    schoolOrCollege.text!=''&&
    className.text!=''&&
    rollNumber.text!=''&&
    phoneNumber.text!=''&&
    city.text!=''&&
    homeAddress.text!=''&&
    profilePhoto!=''&&
    feeConfirmed!=false &&
    monthlyFeeConfirmed!=false
    ){
      await saveDataToFireStore(
          {
            "Full Name":firstName.text+" "+lastName.text,
            "Father Name":fatherName.text,
            "NIC":nIC.text,
            "SchoolOrCollege":schoolOrCollege.text,
            "Current Level":currentLevel.text,
            "Class Name":className.text,
            "Roll Number":rollNumber.text,
            "phone Number":phoneNumber.text,
            "Home Address":homeAddress.text,
            "City":city.text,
            "Profile Photo":profilePhoto,
            "Apply Date":DateTime.now().toIso8601String().toString(),
            "Admission Fee":"Confirmed",
            "Monthly Fee":"Confirmed",
          }
      );
      showSnackbar(context,"Application Submitted Succesfully\nWe will contact you ASAP");
      Get.offAndToNamed("/ApplyCompleted");
    }else{
      showSnackbar(context,"All fields are required");
    }

    formSubmitting=false;
    update();
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2), // Optional: set the duration
        // action: SnackBarAction(
        //   label: 'Close',
        //   onPressed: () {
        //     // Perform an action when the "Close" button is pressed
        //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
        //   },
        // ),
      ),
    );
  }
}