import 'package:flutter/material.dart';
import 'package:syria_meds/common/widgets/app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(),
        body: Center(
          child: Text("Profile Page"),
        ));
  }
}
