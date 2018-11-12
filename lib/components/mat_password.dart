import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  // !! IMPORTANT : Please use names other than "key" (e.g. passwordFieldKey)
  // as each widget has its built-in property "key"
  final GlobalKey<FormFieldState> passwordFieldKey;
  final String labelText;
  final String hintText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  PasswordField(this.labelText, this.hintText, this.helperText,
      {this.onSaved, this.validator, this.passwordFieldKey});

  @override
  PasswordFieldState createState() {
    return new PasswordFieldState();
  }
}

class PasswordFieldState extends State<PasswordField> {
  bool _obsureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.passwordFieldKey,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        helperText: widget.helperText,
        suffixIcon: IconButton(
          icon: Icon(_obsureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _obsureText = !_obsureText;
            });
          },
        ),
      ),
      onSaved: widget.onSaved,
      validator: widget.validator,
      obscureText: _obsureText,
    );
  }
}
