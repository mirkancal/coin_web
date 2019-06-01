import 'package:coin_web/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_web/material.dart';

class CoinRates extends StatefulWidget {
  CoinRates({this.coinMarket});
  final String coinMarket;

  @override
  _CoinRatesState createState() => _CoinRatesState();
}

class _CoinRatesState extends State<CoinRates> {
  final http.Client client = http.Client();
  Function fetchFunction;
  @override
  void initState() {
    setFetchFunction(widget.coinMarket);
    super.initState();
  }

  void setFetchFunction(String marketName) {
    if (marketName == 'paribu') {
      setState(() {
        fetchFunction = fetchParibu;
      });
    } else if (marketName == 'koineks') {
      setState(() {
        fetchFunction = fetchKoineks;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List>(
          future: fetchFunction(client),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.blueAccent,
                ));
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(snapshot.data[index].shortCode),
                          trailing: Text(snapshot.data[index].current + " TRY"),
                        ),
                        Divider(
                          height: 2.0,
                        ),
                      ],
                    );
                  },
                );
            }
            return null;
          } // unreachable
          ),
    );
  }
}
