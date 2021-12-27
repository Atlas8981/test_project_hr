import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project_hr/components/text_field.dart';
import 'package:test_project_hr/models/authentication.dart';
import 'package:test_project_hr/providers/authentication_provider.dart';
import 'package:test_project_hr/services/users_service.dart' as users_service;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String username = '';
  String password = '';
  bool remember = false;
  bool authorized = true;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationProvider>(context);
    final theme = Theme.of(context);

    List<Widget> controls = <Widget>[
      MyTextFormField(
          onChanged: (value) => username = value,
          hintText: 'ឈ្មោះចូលប្រើប្រាស់'),
      const SizedBox(height: 10),
      MyTextFormField(
        onChanged: (value) => password = value,
        hintText: 'ពាក្យសម្ងាត់',
        obscureText: true,
      ),
      const SizedBox(height: 10),
    ];

    if (!authorized) {
      controls.add(
        const Text(
          'ឈ្មោះចូល ឬពាក្យសម្ងាត់មិនត្រឹមត្រូវ',
          style: TextStyle(color: Colors.red),
        ),
      );
      controls.add(
        const SizedBox(height: 10),
      );
    }
    controls.add(
      SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: () async {
            var authModel = Authentication(
              username: username,
              password: password,
            );
            bool res = await authModel.login();
            if (res) {
              auth.updateToken(authModel.token!);
              final profile = await users_service.getUserProfile();
              auth.updateUserProfile(profile!);
            } else {
              setState(() {
                authorized = false;
              });
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => theme.colorScheme.primary),
          ),
          child: const Text(
            'ចូលប្រើប្រាស់',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: controls,
    );
  }
}
