import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String image = "";
  Future<void> getData() async {
    Dio dio = Dio(); //дио отвечает за запрос, благодаря дио можем обращаться к серверу и получать данные
    Response response = //респонз(ответ) идет из дио
        await dio.get('https://dog.ceo/api/breeds/image/random');
    // ignore: avoid_print
    image = response.data["message"];
    setState(() {});
  }
  @override
  void initState() { //будет появляться картинка автоматически
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(image, errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          ),
          Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                  onPressed: getData, 
                  child: const Text('Get Data'),
                ),
              ),
        ],
      ),
    );
  }
}
