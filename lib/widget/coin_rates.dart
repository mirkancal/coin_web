import 'package:coin_web/bloc/coin_bloc.dart';
import 'package:coin_web/bloc/coin_bloc_provider.dart';
import 'package:flutter_web/material.dart';

class CoinRates extends StatefulWidget {
  CoinRates(this._coinMarket);
  final String _coinMarket;
  @override
  _CoinRatesState createState() => _CoinRatesState();
}

class _CoinRatesState extends State<CoinRates> {
  CoinBloc bloc;
  String get coinMarket => widget._coinMarket;
  Stream coins;
  @override
  void didChangeDependencies() {
    bloc = CoinBlocProvider.of(context);

    switch (coinMarket) {
      case 'koineks':
        bloc.fetchKoineks();
        coins = bloc.koineks;
        break;
      case 'paribu':
        bloc.fetchParibu();
        coins = bloc.paribu;
        break;
    }
    super.didChangeDependencies();
  }

  // @override
  // void dispose() {
  //   bloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List>(
        stream: coins,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
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
        },
      ),
    );
  }
}
