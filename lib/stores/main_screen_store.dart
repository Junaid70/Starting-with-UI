import 'package:mobx/mobx.dart';

part 'main_screen_store.g.dart';

class MainScreenStore = _MainScreenStore with _$MainScreenStore;

abstract class _MainScreenStore with Store {
  @observable
  int indexPage = 0;
  @observable
  int talentIndexPage = 3;
  @observable
  bool isfirst = true;
}
