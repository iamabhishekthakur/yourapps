import 'package:flutter/material.dart';
import 'package:yourapps/add_app.dart';
import 'package:yourapps/app_bloc.dart';
import 'package:yourapps/app_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE5E5E5),
      ),
      home: const MyHomePage(),
      routes: {
        AddApp.route: (context) => const AddApp(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    appBloc.fetchApps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
            stream: appBloc.apps,
            builder: (context, AsyncSnapshot<List<App>> snapshot) {
              final apps = snapshot.data ?? [];
              return Wrap(
                spacing: MediaQuery.of(context).size.height * 0.05,
                runSpacing: MediaQuery.of(context).size.height * 0.05,
                children: createdAppWithAddView(apps),
              );
            }),
      ),
    );
  }

  List<Widget> createdAppWithAddView(List<App> apps) {
    List<Widget> widgets = [];
    for (var app in apps) {
      widgets.add(
        InkWell(
          onTap: () {
            // Navigator.pushNamed(context, AddApp.route);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(
                0xFFFFFFFF,
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey,
                  offset: Offset(3, 3),
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/${app.hashtag}.png',
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                Text(
                  app.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    widgets.add(
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, AddApp.route);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(
              0xFF73CE99,
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey,
                offset: Offset(3, 3),
              )
            ],
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/add_apps.png',
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Text(
                'Add New App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return widgets;
  }
}
