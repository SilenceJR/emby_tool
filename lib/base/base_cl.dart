import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


export 'package:get/get.dart';

mixin ApiMixin {
  // Api get api => Api.instance;
}

mixin BaseControllerMixin implements DisposableInterface {
  // Api get api => Api.instance;

  final List<Worker> _workers = [];

  void registerWorker(Worker worker) {
    if (!_workers.contains(worker)) {
      _workers.add(worker);
    }
  }

  void unRegisterWorker(Worker worker) {
    if (_workers.contains(worker)) {
      _workers.remove(worker);
    }
    worker.dispose();
  }

  @override
  void onClose() {
    for (final worker in _workers) {
      worker.dispose();
    }
    _workers.clear();
  }
}

abstract class BaseController extends GetxController with BaseControllerMixin {}

abstract class BaseFullLifeCycleController extends FullLifeCycleController
    with BaseControllerMixin, FullLifeCycleMixin {}

abstract class BaseService extends GetxService with BaseControllerMixin {}

extension RefreshStateExt on RefreshController {
  void finishState(bool complete, [bool noData = false]) {
    if (isRefresh) {
      complete ? refreshCompleted() : refreshFailed();
    }
    if (isLoading) {
      complete ? loadComplete() : loadFailed();
    }
    noData ? loadNoData() : resetNoData();
  }
}
