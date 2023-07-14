import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits/models/fruit.dart';
import 'package:fruits/models/views/fruit.dart';
// import 'package:http_proxy_override/http_proxy_override.dart';

// httpOverrides() async {
//   HttpProxyOverride httpProxyOverride =
//       await HttpProxyOverride.createHttpProxy();
//   HttpOverrides.global = httpProxyOverride;
// }

Future<void> main() async {
  MyHttpOverrides();
  runApp(MyApp(
    products: fetchFruit(),
  ));
}

class MyApp extends StatelessWidget {
  final Future<List<Fruit>> products;
  const MyApp({super.key, required this.products});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        products: products,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.products});

  final String title;
  final Future<List<Fruit>> products;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: FutureBuilder<List<Fruit>>(builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData
                ? FriutList(items: snapshot.data)
                : const Center(
                    child: Text("Data not returned"),
                  );
          }),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
