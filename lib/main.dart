import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:training/models/db_demo/hive_note.dart';
import 'package:training/provider/custom_counter_provider.dart';
import 'package:training/provider/theme_manager_provider.dart';
import 'package:training/screens/build_custom_layout/flutter_layout_demo_screen.dart';
import 'package:training/screens/dio_demo/dio_demo_screen.dart';
import 'package:training/screens/either_demo/either_demo_screen.dart';
import 'package:training/screens/lifecycle/deactivate_demo.dart';
import 'package:training/screens/lifecycle/lifecycle.dart';
import 'package:training/screens/local_db_demo/hive_demo_screen.dart';
import 'package:training/screens/local_db_demo/local_db_demo.dart';
import 'package:training/screens/local_db_demo/mooor_demo_screen.dart';
import 'package:training/screens/local_db_demo/sharedpreference_demo_screen.dart';
import 'package:training/screens/local_db_demo/sqflite_demo_screen.dart';
import 'package:training/screens/navigator/navigate_first_screen.dart';
import 'package:training/screens/navigator/navigator_fifth_screen.dart';
import 'package:training/screens/navigator/navigator_fourth_screen.dart';
import 'package:training/screens/navigator/navigator_second_screen.dart';
import 'package:training/screens/navigator/navigator_third_screen.dart';
import 'package:training/screens/networking/networking_demo.dart';
import 'package:training/screens/proxyprovider_demo/provider_assignment_first_screen.dart';
import 'package:training/screens/proxyprovider_demo/proxy_provider_demo_screen.dart';
import 'package:training/screens/responsive/responsive_demo.dart';
import 'package:training/screens/responsive/stack_demo.dart';
import 'package:training/screens/responsive/wrap_demo.dart';
import 'package:training/screens/restoration/restoration_first_screen.dart';
import 'package:training/screens/restoration/restoration_second_screen.dart';
import 'package:training/screens/riverpod/riverpod_demo_screen.dart';
import 'package:training/screens/selection_screen.dart';
import 'package:training/screens/slivers/sliver_screen.dart';
import 'package:training/services/string_stream_provider.dart';
import 'package:training/theme_data_constants.dart';
import './screens/build_your_own_widget/category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveNoteAdapter());
  await Hive.openBox<HiveNote>("notes");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CustomCounterProvider _customCounterProvider;
  @override
  void initState() {
    super.initState();
    _customCounterProvider = CustomCounterProvider();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(
          create: (context) => ThemeManager(),
        ),
        ChangeNotifierProvider<CustomCounterProvider>.value(
          value: _customCounterProvider,
        ),
        // StreamProvider<int>(
        //   create: (_) => StringStreamGenerator().counterStream,
        //   initialData: 0,
        //   catchError: (_, error) {
        //     print(error);
        //     return -1;
        //   },
        // )
        Provider(create: (_) => CounterStreamGenerator()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          restorationScopeId: "app",
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: "/",
          routes: {
            "/": ((context) => const SelectionScreen()),
            Category.url: (context) => const Category(),
            SelectionScreen.url: (context) => const SelectionScreen(),
            SliverScreen.url: (context) => const SliverScreen(),
            LayoutDemoScreen.url: (context) => LayoutDemoScreen(),
            NavigatorFirstScreen.url: (context) => const NavigatorFirstScreen(),
            NavigatorSecondScreen.url: (context) =>
                const NavigatorSecondScreen(),
            NavigatorFourthScreen.url: (context) =>
                const NavigatorFourthScreen(),
            NavigatorFifthScreen.url: (context) => const NavigatorFifthScreen(),
            LifecycleApp.url: (context) => const LifecycleApp(),
            DeactivateDemoScreen.url: (context) => const DeactivateDemoScreen(),
            ResponsiveDemo.url: (_) => const ResponsiveDemo(),
            WrapDemo.url: (_) => const WrapDemo(),
            StackDemo.url: (_) => const StackDemo(),
            NetworkingDemo.url: (_) => const NetworkingDemo(),
            LocalDbDemoScreen.url: (_) => const LocalDbDemoScreen(),
            SqfliteDemoScreen.url: (_) => const SqfliteDemoScreen(),
            MoorDemoScreen.url: (_) => const MoorDemoScreen(),
            HiveDemoScreen.url: (_) => const HiveDemoScreen(),
            SharedPreferenceDemo.url: (_) => const SharedPreferenceDemo(),
            EitherDemoScreen.url: (_) => const EitherDemoScreen(),
            DioDemoScreen.url: (_) => const DioDemoScreen(),
            RestorationFistScreen.url: (_) => const RestorationFistScreen(),
            ProxyProviderDemoScreen.url: (_) => const ProxyProviderDemoScreen(),
            ProviderAssignmentFirstScreen.url: (_) =>
                const ProviderAssignmentFirstScreen(),
            RiverpodDemoScreen.url: (_) => const RiverpodDemoScreen(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == NavigatorThirdScreen.url) {
              final args = settings.arguments;
              print(args);
              return MaterialPageRoute(
                  builder: (context) => const NavigatorThirdScreen());
            }

            var uri = Uri.parse(settings.name ?? "");
            if (uri.pathSegments.length == 2 &&
                uri.pathSegments.first == NavigatorThirdScreen.url) {
              var id = uri.pathSegments[1];
              print("Extracted id from url : $id");
              return MaterialPageRoute(
                  builder: (context) => const NavigatorThirdScreen());
            }
          },
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: Provider.of<ThemeManager>(context).themeMode,

          //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
          // home: const SelectionScreen(),
        );
      }),
    );
  }
}
