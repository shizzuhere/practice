import 'package:form_field_validator/form_field_validator.dart';

final nameValidator = MultiValidator([
  RequiredValidator(
    errorText: 'First name is required',
  )
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'E-mail is required'),
  EmailValidator(errorText: 'Enter a valid email'),
  PatternValidator(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
      errorText: 'Enter a valid email')
]);

final passwordValidator = MultiValidator([
  RequiredValidator(
    errorText: 'Password is required',
  )
]);
