import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Media and theme
    final media = MediaQuery.of(context);
    final theme = Theme.of(context);

    // Form Key
    final _formKey = GlobalKey<FormState>();
    TextEditingController _passwdcontroller = TextEditingController();

    // Validation
    final nameValidator = MultiValidator(
      [
        RequiredValidator(
          errorText: "Required Field",
        ),
        MinLengthValidator(
          3,
          errorText: "Name should be valid",
        ),
        PatternValidator(
          r'^[A-Za-z]',
          errorText: "Name should be valid",
        ),
      ],
    );

    final passwdValidator = MultiValidator(
      [
        RequiredValidator(
          errorText: "Required Field",
        ),
        MinLengthValidator(
          8,
          errorText: "Password should be 8 characters long",
        ),
      ],
    );

    final cpasswdValidator = MultiValidator(
      [
        RequiredValidator(
          errorText: "Required Field",
        ),
        MinLengthValidator(
          8,
          errorText: "Password should be 8 characters long",
        ),
      ],
    );

    final phoneValidator = MultiValidator(
      [
        RequiredValidator(errorText: "Required"),
        MinLengthValidator(10, errorText: "Enter a valid Phone number"),
        MaxLengthValidator(10, errorText: "Enter a valid Phone number"),
      ],
    );

    void _validate() {
      if (_formKey.currentState == null) {
        print("Error");
        return;
      } else if (_formKey.currentState != null &&
          _formKey.currentState!.validate()) {
        print("Validated");
      } else {
        print("Not Validated");
      }
    }

    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InputFields(
                validator: nameValidator,
                label: "Name",
                obscure: false,
              ),
              const SizedBox(
                height: 35,
              ),
              InputFields(
                validator: MultiValidator(
                  [
                    RequiredValidator(
                      errorText: "Required",
                    ),
                    EmailValidator(
                      errorText: "Enter a valid email",
                    ),
                  ],
                ),
                label: "Email",
                obscure: false,
              ),
              const SizedBox(
                height: 35,
              ),
              InputFields(
                validator: phoneValidator,
                label: "Phone Number",
                obscure: false,
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 0,
                ),
                child: TextFormField(
                  validator: passwdValidator,
                  cursorColor: Colors.black38,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.aBeeZee(
                      letterSpacing: 2,
                    ),
                    errorStyle: GoogleFonts.aBeeZee(
                      letterSpacing: 2,
                      // color: Colors.redAccent,
                    ),
                    errorMaxLines: 1,
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.redAccent,
                      ),
                    ),
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  obscureText: true,
                  obscuringCharacter: "*",
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              InputFields(
                validator: cpasswdValidator,
                label: "Confirm Password",
                obscure: true,
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: _validate,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Sign up"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputFields extends StatefulWidget {
  const InputFields({
    Key? key,
    required this.validator,
    required this.label,
    required this.obscure,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final String label;
  final bool obscure;

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 0,
      ),
      child: TextFormField(
        validator: widget.validator,
        cursorColor: Colors.black38,
        decoration: InputDecoration(
          labelStyle: GoogleFonts.aBeeZee(
            letterSpacing: 2,
          ),
          errorStyle: GoogleFonts.aBeeZee(
            letterSpacing: 2,
            // color: Colors.redAccent,
          ),
          errorMaxLines: 1,
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.redAccent,
            ),
          ),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
        ),
        obscureText: widget.obscure,
        obscuringCharacter: "*",
      ),
    );
  }
}

class ConfirmPasswdValidator extends TextFieldValidator {
  final passwd;

  ConfirmPasswdValidator(this.passwd, {String errorText = 'Enter valid data'})
      : super(errorText);

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    if (passwd != value) {
      return false;
    }
    return true;
  }
}
