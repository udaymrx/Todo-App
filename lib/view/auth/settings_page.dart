import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nicetodo/const/colors.dart';
import 'package:nicetodo/global_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool notify = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text("Settings"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: background,
        foregroundColor: primaryblue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile.adaptive(
              value: notify,
              title: const Text(
                "Notifications",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryblue,
                ),
              ),
              onChanged: (onChanged) {
                setState(() {
                  notify = onChanged;
                });
              },
            ),
            const ListTile(
              title: Text(
                "Preference",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryblue,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "About Us",
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryblue,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: primaryblue,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text(
                      "Help",
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryblue,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: primaryblue,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () async {
                await ref.read(firebaseProvider).logOut();
                Navigator.pop(context);
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
