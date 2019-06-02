import 'package:coin_web/widget/coin_rates.dart';
import 'package:flutter_web/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Türk Coin Borsası',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        fontFamily: "Montserrat",
        indicatorColor: Colors.blueAccent,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: TabBar(
              tabs: <Widget>[
                Tab(text: "koineks"),
                Tab(text: "paribu"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CoinRates(
              coinMarket: 'koineks',
            ),
            CoinRates(
              coinMarket: 'paribu',
            ),
          ],
        ),
      ),
    );
  }
}
