import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project_hr/providers/authentication_provider.dart';

class MyMainScreen extends StatelessWidget {
  final bool rootLevel;
  final String title;
  final Widget body;

  const MyMainScreen({Key? key,
    required this.rootLevel,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: rootLevel ? _drawer(context) : null,
      body: body,
    );
  }

  Widget _drawer(BuildContext context) {
    final auth = Provider.of<AuthenticationProvider>(context);
    final user = auth.userProfile;
    // final theme = Theme.of(context);
    // final textTheme = theme.textTheme;

    Uint8List profile;
    if ( user.profile != null) {
      profile = const Base64Decoder().convert(user.profile!);
    } else {
      profile = Uint8List(0);
    }
    return SafeArea(
      child: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          color: Theme.of(context).primaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                        child: Image.memory(
                          profile,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Text("Error");
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              TextButton(
                onPressed: () => auth.clearToken(),
                child: const Text('ចាកចេញ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
