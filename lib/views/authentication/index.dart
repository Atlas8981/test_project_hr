import 'package:flutter/material.dart';

import 'login_form.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    print("AuthenticationPage");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(32, 50.0, 32, 0),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/mptc-logo@3x.png',
                      height: 130,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'ក្រសួងប្រៃសណីយ៍និងទូរគមនាគមន៍',
                    style: TextStyle(
                        fontFamily: 'Moul',
                        fontSize: 16.0,
                    ),
                  ),
                  const Text(
                    'Ministry of Post and Telecommunications',
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'ប្រព័ន្ធព័ត៌មានមន្រ្ដីរាជការ',
                    style: TextStyle(
                        fontFamily: 'Moul',
                        fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  LoginForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
