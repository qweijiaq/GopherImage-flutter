import 'package:mobx/mobx.dart';
part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  _AppStore() {
    // initReactions();
  }

  List<ReactionDisposer> reactionDisposers = [];

  @observable
  bool loading = false;

  @action
  setLoading(bool data) {
    loading = data;
  }

  initReactions() {
    reactionDisposers.add(
      autorun((_) {
        print('autorun - loading: $loading');
      }),
    );

    reactionDisposers.add(
      reaction((_) => loading, (value) {
        print('reaction - loading: $value');
      }),
    );
  }

  disposeReactions() {
    reactionDisposers.forEach((disposer) => disposer());
  }
}
