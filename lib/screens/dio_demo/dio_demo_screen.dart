import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/models/networking/dio_demo_model.dart';
import 'package:training/provider/post_notifier.dart';
import 'package:training/provider/user_notifier.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class DioDemoScreen extends StatefulWidget {
  const DioDemoScreen({Key? key}) : super(key: key);
  static const String url = "DIO_DEMO_SCREEN";

  @override
  State<DioDemoScreen> createState() => _DioDemoScreenState();
}

class _DioDemoScreenState extends State<DioDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserNotifier(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Dio Demo Screen"),
          ),
          body: SingleChildScrollView(
            child: Center(
                child: Column(
              children: [
                buildElevatedButton("Fetch Data", () {
                  Provider.of<UserNotifier>(context, listen: false)
                      .getPageInfo();
                }),
                Consumer<UserNotifier>(
                  builder: (context, userNotifier, _) {
                    return _buildBody(userNotifier);
                  },
                )
              ],
            )),
          ),
        );
      }),
    );
  }

  Widget _buildBody(UserNotifier _notifier) {
    if (_notifier.state == NotifierState.loaded) {
      return _notifier.pageInfo.fold(
          (l) => Text("Error message : ${l.message}"),
          (r) => _buildUsersList(r));
    } else if (_notifier.state == NotifierState.loading) {
      return const CircularProgressIndicator();
    } else if (_notifier.state == NotifierState.initial) {
      return Text("Click on fetch Data to load data");
    }
    return Text("something went wrong");
  }

  Widget _buildUsersList(PageInfo pageInfo) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          User user = pageInfo.data[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: Image.network(
                user.avatar,
                fit: BoxFit.contain,
              ).image,
              child: Container(
                alignment: Alignment.bottomRight,
                child: const Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.orange,
                ),
              ),
            ),
            title: Text("${user.firstName} ${user.lastName}"),
            subtitle: Text("${user.email}"),
          );
        },
        itemCount: pageInfo.data.length,
      ),
    );
  }
}
