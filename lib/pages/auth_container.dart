import 'package:flutter/material.dart';
import 'package:hw_19_test/pages/get_start_page.dart';
import 'package:hw_19_test/pages/home_page.dart';
import 'package:hw_19_test/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authcontainer extends StatefulWidget {
  const Authcontainer({super.key});

  @override
  State<Authcontainer> createState() => _AuthcontainerState();

}
class _AuthcontainerState extends State<Authcontainer> {
  late String token;
  bool initial = true;

  @override
   build(BuildContext context)  async {
    
    if (initial == null) {
      SharedPreferences.getInstance().then((sharedPrefValue) {
        setState(() {
          initial = false;
          token = sharedPrefValue.getString("token")!;
        });
      });
    
      return const CircularProgressIndicator();
    } else {
      if (token == null) {
        return LoginPage();
      }
      return HomePage();
      }
  }
}
