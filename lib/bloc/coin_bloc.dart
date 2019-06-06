import 'package:coin_web/model/koineks.dart';
import 'package:coin_web/model/paribu.dart';
import 'package:rxdart/rxdart.dart';
import 'package:coin_web/repository/repository.dart';

class CoinBloc {
  final _repository = Repository();

  Stream<List<Koineks>> get koineks => _koineksSubject.stream;
  final _koineksSubject = BehaviorSubject<List<Koineks>>();

  Stream<List<Paribu>> get paribu => _paribuSubject.stream;
  final _paribuSubject = BehaviorSubject<List<Paribu>>();

  fetchKoineks() async {
    List<Koineks> koineksCoins = await _repository.fetchKoineks();
    _koineksSubject.add(koineksCoins);
  }

  fetchParibu() async {
    List<Paribu> paribuCoins = await _repository.fetchParibu();
    _paribuSubject.add(paribuCoins);
  }

  void dispose() {
    _koineksSubject.close();
    _paribuSubject.close();
  }
}
