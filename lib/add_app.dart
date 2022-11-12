import 'package:flutter/material.dart';
import 'package:yourapps/app_bloc.dart';
import 'package:yourapps/app_model.dart';

class AddApp extends StatefulWidget {
  static String route = '/add/app';
  const AddApp({Key? key}) : super(key: key);

  @override
  State<AddApp> createState() => _AddAppState();
}

class _AddAppState extends State<AddApp> {
  List<String> hashtags = [
    'automation',
    'cycle',
    'engineering',
    'greeny',
    'mariuana',
    'social',
    'system',
    'upgrade',
  ];
  int selectedIndex = 101;
  final titleTextController = TextEditingController();
  final urlTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFFFFFF),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Image.asset(
                    'assets/images/web_url.png',
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.height * 0.13,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: urlTextController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'https://enter app url',
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFFFFFF),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Image.asset(
                      'assets/images/name.png',
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.height * 0.13,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: titleTextController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'enter app title ',
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFFFFFF),
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
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Image.asset(
                          'assets/images/hashtag.png',
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.height * 0.13,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'HASHTAG',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.12,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02),
                    child: ListView.separated(
                      itemCount: hashtags.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == selectedIndex
                                ? const Color(
                                    0xFFE5E5E5,
                                  )
                                : const Color(
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
                              Image.asset(
                                'assets/images/${hashtags[index]}.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.grey,
                            offset: Offset(3, 3),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/back.png',
                              height: MediaQuery.of(context).size.height * 0.10,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            'BACK',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.02,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      final app = App(
                        title: titleTextController.text.trim(),
                        url: urlTextController.text.trim(),
                        hashtag: hashtags[selectedIndex],
                        entryTime: DateTime.now().toUtc().toString(),
                      );
                      appBloc.addAppToStorage(app);
                      Navigator.pop(context);
                      appBloc.fetchApps();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.grey,
                            offset: Offset(3, 3),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/save.png',
                              height: MediaQuery.of(context).size.height * 0.10,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            'SAVE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
