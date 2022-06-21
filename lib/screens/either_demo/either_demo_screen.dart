import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/provider/post_notifier.dart';
import 'package:training/screens/navigator/widgets/build_elevated_button.dart';

class EitherDemoScreen extends StatefulWidget {
  const EitherDemoScreen({Key? key}) : super(key: key);
  static const String url = "EITHER_DEMO_SCREEN";
  @override
  State<EitherDemoScreen> createState() => _EitherDemoScreenState();
}

class _EitherDemoScreenState extends State<EitherDemoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostNotifier(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Either Demo Screen"),
          ),
          body: Center(
              child: Column(
            children: [
              buildElevatedButton("Fetch Data", () {
                Provider.of<PostNotifier>(context, listen: false).getOnePost();
              }),
              Consumer<PostNotifier>(
                builder: (context, post, _) {
                  return buildBody(post);
                },
              )
            ],
          )),
        );
      }),
    );
  }

  Widget buildBody(PostNotifier _notifier) {
    if (_notifier.state == NotifierState.loaded) {
      return Text(_notifier.post.fold((l) => l.message, (r) => r.title));
    } else if (_notifier.state == NotifierState.loading) {
      return const CircularProgressIndicator();
    } else if (_notifier.state == NotifierState.initial) {
      return Text("Click on fetch Data to load data");
    }
    return Text("something went wrong");
  }
}
