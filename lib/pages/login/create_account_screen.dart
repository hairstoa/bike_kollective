import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create an Account"),
      ),
      body: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "Email",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Email";
                }
                return null;
              },
            ), // Email Form Field
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outlined),
                hintText: "Password",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Password";
                }
                return null;
              },
            ), // Password Form Field
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "Re-enter Password",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please Re-Enter Your Password";
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ));
  }
}
