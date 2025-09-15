


import 'package:form_field_validator/form_field_validator.dart';


import '../main.dart'; // Ensure this is imported for Get.context!

class Validators {
  static final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Enter a valid email address')
  ]);

  static final requiredValidator =
  RequiredValidator(errorText:  'This field is required');

  static final loginPasswordValidator = MultiValidator([
    RequiredValidator(errorText:  'Password is required'),
    // MinLengthValidator(6, errorText: 'Password must be at least 6 digits long'),
  ]);

  static final registerPasswordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(6, errorText:'Password must be at least 6 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Passwords must have at least one special character')
  ]);

  static final phoneValidator = MultiValidator([
    RequiredValidator(errorText:  'Phone number is required'),
    MinLengthValidator(11, errorText: 'Enter a valid phone number'),
    MaxLengthValidator(11, errorText: 'Enter a valid phone number'),
    PatternValidator(r'^[0-9]*$', errorText: 'Enter a valid phone number')
  ]);
}
