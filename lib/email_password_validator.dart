// ignore_for_file: prefer_function_declarations_over_variables

import 'package:get/get.dart';

class ValidatorController extends GetxController{

  String? Function(String?)? emailValidator = (String? email){
    if(email!.isEmpty){
      return 'email empty';
    }else if(email.length < 8){
      return 'email short';
    }
    else if(email.length > 30){
      return 'email long';
    }
    else if(!email.contains('@')){
      return 'Not a proper email';
    }
    else if(!email.toString().split('@')[1].contains('.')){
      return 'Not a proper email';
    }
    // else if(!email.contains("@gmail.com")){
    //   return 'please fill the email field';
    // }
    return null;
  };
  String? Function(String?)? passwordValidator = (String? password){
    if(password!.isEmpty){
      return 'Password empty';
    }else if(password.length < 3){
      return 'Password short';
    }
    else if(password.length > 25){
      return 'Password long';
    }

    return null;
  };

  String? Function(String?)? verifyCodeValidator = (String? verifyCode){
    if(verifyCode!.isEmpty){
      return 'verifyCode empty';
    }
    return null;
  };

  String? Function(String?)? newPasswordValidator = (String? newpassword){
    if(newpassword!.isEmpty){
      return 'Password empty';
    }else if(newpassword.length < 3){
      return 'Password short';
    }
    else if(newpassword.length > 25){
      return 'Password long';
    }

    return null;
  };
  String? Function(String?)? confrinNewPasswordValidator = (String? cpnfrimnewpassword){
    if(cpnfrimnewpassword!.isEmpty){
      return 'Password empty';
    }else if(cpnfrimnewpassword.length < 3){
      return 'Password short';
    }
    else if(cpnfrimnewpassword.length > 25){
      return 'Password long';
    }

    return null;
  };
}