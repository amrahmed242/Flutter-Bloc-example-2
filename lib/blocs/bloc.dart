import 'dart:async';
import 'package:form_validation_bloc/blocs/validator.dart';

//add the                      Validator mixins
class Bloc extends Object with Validator {
  //must be private
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  //sending data to bloc
  Function(String) get changedEmail => _emailController.sink.add;
  Function(String) get changedPassword => _passwordController.sink.add;

  //recieving from bloc
  Stream<String> get validatedEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get validatedPassword =>
      _passwordController.stream.transform(validatePassword);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
