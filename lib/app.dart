import 'package:coin_web/bloc/coin_bloc_provider.dart';
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
        brightness: Brightness.dark,
        fontFamily: "Lato",
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
            CoinBlocProvider(
              child: CoinRates('koineks'),
            ),
            CoinBlocProvider(
              child: CoinRates('paribu'),
            )
          ],
        ),
      ),
    );
  }
}
