import 'dart:async';
import 'package:examination/model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  bool loatData = true;
  ApiResponse? data = null;
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  Color colorgb = Colors.white;
  Color colortxt = const Color.fromARGB(255, 53, 53, 53);
  Icon icon = Icon(Icons.wb_sunny_rounded);

  @override
  void initState() {
    super.initState();
    getdata();
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      colorgb = _themeMode == ThemeMode.light
          ? Colors.white
          : Color.fromARGB(255, 53, 53, 53);
      colortxt = _themeMode == ThemeMode.light ? Colors.black : Colors.white;
    });
  }

  void getdata() async {
    setState(() {
      loatData = true;
    });
    final dio = Dio();
    final response =
        await dio.get('https://wv-interview.web.app/resource/data.json');
    print(response.data);
    setState(() {
      data = ApiResponse.fromJson(response.data);
      loatData = false;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page! < 2) {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: _themeMode,
      home: Scaffold(
        body: loatData
            ? const Center(child: CircularProgressIndicator())
            :
            SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: PageView(
                        controller: _pageController,
                        children: [
                          _buildImage(data!.responseObject.contentShelfs[0]
                              .items![0].coverUrl
                              .toString()), 
                          _buildImage(data!.responseObject.contentShelfs[0]
                              .items![1].coverUrl
                              .toString()), 
                          _buildImage(data!.responseObject.contentShelfs[0]
                              .items![2].coverUrl
                              .toString()), 
                        ],
                      ),
                    ),

                  const  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Header',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                            const  SizedBox(
                                width: 20,
                              ),

                              _buildImage1(data!.responseObject.contentShelfs[1]
                                  .items![0].coverUrl
                                  .toString()),
                             const SizedBox(
                                width: 20,
                              ),
                              _buildImage1(data!.responseObject.contentShelfs[1]
                                  .items![1].coverUrl
                                  .toString()),
                             const SizedBox(
                                width: 20,
                              ),
                              _buildImage1(data!.responseObject.contentShelfs[1]
                                  .items![2].coverUrl
                                  .toString()),
                              const SizedBox(
                                width: 20,
                              ),
                                  _buildImage1(data!.responseObject.contentShelfs[1]
                                  .items![3].coverUrl
                                  .toString()),
                              const SizedBox(
                                width: 20,
                              ),

                            ],
                          ),
                        )),
                      ],
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left:  20.0,top: 20),
                      child: Text(
                        'Header',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorgb,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20.0)),
                              child: Image.network(
                                data!.responseObject.contentShelfs[2].coverUrl.toString(),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200, 
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0, left: 16, top: 16, bottom: 8),
                              child: Text(
                                data!.responseObject.contentShelfs[2].title
                                    .toString(),
    
                                style: TextStyle(
                                    color: colortxt,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0, left: 16, bottom: 20),
                              child: Text(
                                data!.responseObject.contentShelfs[2].subTitle
                                    .toString(),
                                style: TextStyle(
                                  color: colortxt,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Header',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                             const SizedBox(
                                width: 20,
                              ),
                               _buildImage1(data!.responseObject.contentShelfs[3]
                                  .items![0].coverUrl
                                  .toString()),
                             const SizedBox(
                                width: 20,
                              ),
                              _buildImage1(data!.responseObject.contentShelfs[3]
                                  .items![1].coverUrl
                                  .toString()),
                             const SizedBox(
                                width: 20,
                              ),
                              _buildImage1(data!.responseObject.contentShelfs[3]
                                  .items![1].coverUrl
                                  .toString()),
                              const SizedBox(
                                width: 20,
                              ),
                              _buildImage1(data!.responseObject.contentShelfs[3]
                                  .items![1].coverUrl
                                  .toString()),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),

                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),

        floatingActionButton: FloatingActionButton(
          onPressed: _toggleTheme,
          tooltip: 'Set Theme',
          child: const Icon(Icons.brightness_medium),
        ), 
      ),
    );
  }
}

Widget _buildImage(String imageUrl) {
  return ClipRRect(
    child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
      return Container(
        color: Colors.grey[200],
        width: 100,
        height: 100,
        child: const Center(
          child: Text(
            'ไม่มีรูปภาพ',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }),
  );
}

Widget _buildImage1(String imageUrl) {
  return SizedBox(
    height: 120,
    width: 130,
    child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: 200,
      height: 200,
      errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
        return Container(
          color: Colors.grey[200],
          width: 100,
          height: 100,
          child: const Center(
            child: Text(
              'ไม่มีรูปภาพ',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
}),
  );
}
