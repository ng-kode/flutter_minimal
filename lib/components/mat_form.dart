import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import '../validators.dart';
import './mat_password.dart';

class MatForm extends StatefulWidget {
  @override
  MatFormState createState() {
    return new MatFormState();
  }
}

class _Person {
  String name = '';
  String email = '';
  String phone = '';
  String bio = '';
  String donation = '';
  String password = '';

  @override
  String toString() {
    return [name, email, phone, bio, donation, password].join(', ');
  }
}

class MatFormState extends State<MatForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: 'The Form Key');
  final _hkPhoneController = new MaskedTextController(mask: '0000-0000');
  final _passwordFieldKey =
      GlobalKey<FormFieldState>(debugLabel: 'The Password Key');
  bool _autovalidate = false;
  _Person person = _Person();

  void _handleFormSubmit() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        _autovalidate = true;
      });
    } else {
      form.save();
      print(person);
    }
  }

  Widget _buildSpacer() {
    return SizedBox(
      height: 30.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Form(
        key: _formKey,
        autovalidate: _autovalidate,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildSpacer(),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  icon: Icon(Icons.person),
                  labelText: 'Name*',
                  hintText: 'How do you want to be called ?',
                ),
                onSaved: (String value) {
                  person.name = value;
                },
                validator: Validators.required,
              ),
              _buildSpacer(),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  icon: Icon(Icons.email),
                  labelText: 'Email*',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String value) {
                  person.email = value;
                },
                validator: (String value) {
                  final validators = [Validators.required, Validators.isEmail];
                  for (var validator in validators) {
                    final result = validator(value);
                    if (result != null) {
                      return result;
                    }
                  }
                  return null;
                },
              ),
              _buildSpacer(),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  icon: Icon(Icons.phone),
                  labelText: 'Phone',
                  prefixText: '+852 ',
                ),
                keyboardType: TextInputType.phone,
                onSaved: (String value) {
                  person.phone = value;
                },
                validator: (String value) {},
                controller: _hkPhoneController,
                inputFormatters: [],
              ),
              _buildSpacer(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bio',
                  hintText: 'I am ...',
                  helperText: 'What\'s your story ?',
                ),
                maxLines: 3,
                onSaved: (String value) {
                  person.bio = value;
                },
              ),
              _buildSpacer(),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(signed: false),
                decoration: InputDecoration(
                  labelText: 'Donation',
                  prefixText: '\$',
                  suffixText: 'HKD',
                  suffixStyle: TextStyle(color: Colors.green),
                ),
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                onSaved: (String value) {
                  person.donation = value;
                },
              ),
              _buildSpacer(),
              PasswordField(
                'Password*',
                'My secrete passowrd ...',
                'Just don\'t use common patterns, like birthday or so',
                onSaved: (String value) {
                  person.password = value;
                },
                passwordFieldKey: _passwordFieldKey,
              ),
              PasswordField(
                'Confirm Password*',
                'My secrete passowrd again ...',
                'We\'ll double-check for you',
                validator: (value) {
                  final password = _passwordFieldKey.currentState;
                  if (password != null && value != password.value) {
                    return 'Passwords don\'t match';
                  }
                  return null;
                },
              ),
              _buildSpacer(),
              RaisedButton(
                child: Text('Submit'),
                onPressed: _handleFormSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
