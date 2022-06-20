import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/models/db_demo/user_model.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class SharedPreferenceDemo extends StatefulWidget {
  const SharedPreferenceDemo({Key? key}) : super(key: key);
  static const String url = "SHARED_PREFERENCE_DEMO_SCREEN";
  @override
  State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
}

class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // SharedPreferences.setMockInitialValues({});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreference Demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 100,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Name"),
                )),
            SizedBox(
                height: 100,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _ageController,
                  decoration: InputDecoration(hintText: "Age"),
                )),
            buildElevatedButton("Save User In Pref", () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setString(
                  "user",
                  User(
                          id: 0,
                          name: _nameController.text,
                          age: int.tryParse(_ageController.text) ?? 10)
                      .toJsonString());
              User user =
                  await User.fromJsonString(await prefs.getString("user")!);
              _ageController.clear();
              _nameController.clear();
              setState(() {});
            }),
            FutureBuilder<User?>(
                future: getUser(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData && snapshot.data != null) {
                    User user = snapshot.data!;
                    return Column(
                      children: [
                        const Text("Selected User"),
                        Text("Name : ${user.name}"),
                        Text("AGE : ${user.age}"),
                        Text("ID : ${user.id}")
                      ],
                    );
                  }
                  return const Text("No User found");
                })
          ],
        ),
      ),
    );
  }

  Future<User?> getUser() async {
    final pref = await SharedPreferences.getInstance();
    String? userString = pref.getString("user");
    print("Users : ${userString}");
    if (userString != null) {
      return User.fromJsonString(userString);
    }
    return null;
  }
}
