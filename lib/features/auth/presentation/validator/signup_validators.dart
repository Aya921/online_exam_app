import 'package:flutter/widgets.dart';

class SignupValidators {


  static String? userNameValidatiion(String? value) {
    if (value!.length < 3) {
      return "The lenght should be at least 3 characters";
    }
    return null;
  }

  static String? firstNameValidatiion(String? value) {
    final firstnameRegex=RegExp(r'^[a-zA-Z]+$');
    if (value!.length < 3) {
      return "The lenght should be at least 3 characters";
    }
    if(!firstnameRegex.hasMatch(value)){
       return "Enter a valid name";

    }
    
    return null;
  }

  static String? lastNameValidatiion(String? value) {
    final lastnameRegex=RegExp(r'^[a-zA-Z]+$');
    if (value!.length < 3) {
      return "The lenght should be at least 3 characters";
    }
    if(!lastnameRegex.hasMatch(value)){
       return "Enter a valid name";

    }
    
    return null;
  }

  static String? emailValidatiion(String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value!)) {
      return 'Enter a valid email';
    }

    return null;
  }

 

  static String? passwprdValidatiion(String? value) {
    final passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    );

    if (!passwordRegex.hasMatch(value!)) {
      return 'Password must be at least 8 characters,\ninclude upper, lower, digit & special char';
    }
    return null;
  }

  static String? confirmPasswordValidatiion(
    String? value,
    TextEditingController? optionalValue,
  ) {
    if (value != optionalValue!.text) {
      return "The Confirm password is not matched with your password";
    }
    return null;
  }

  static String? phoneValidation(String? value) {
    final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');
    if (!phoneRegex.hasMatch(value!)) {
      return 'Enter valid Egyptian phone number';
    }
    return null;
  }
  
}

