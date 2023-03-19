import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/constants.dart';
import './models/initial_data_model.dart';
import '../../repositories/home_base_repository.dart';

class HomeBaseController {
  final ProviderRef _ref;
  final HomeBaseRepository _homeBaseRepository;
  final _navigationBarIndexProvider = StateProvider<int>((_ref) => 0);

  InitialDataModel? _initialData;

  late FutureProvider<InitialDataModel> _initialDataProvider;

  HomeBaseController(this._ref, this._homeBaseRepository) {
    _initialDataProvider = createInitialDataProvider();
  }

  InitialDataModel? getInitialData() {
    return _initialData;
  }

  StateProvider<int> getNavigationBarIndexProvider() {
    return _navigationBarIndexProvider;
  }

  FutureProvider<InitialDataModel> getInitialDataProvider() {
    return _initialDataProvider;
  }

  void invalidateInitialDataProviderNow() {
    _ref.invalidate(_initialDataProvider);
  }

  Future<void> invalidateInitialDataProvider() async {
    _ref.invalidate(_initialDataProvider);
    return await Future<void>.delayed(const Duration(seconds: 3));
  }

  void setNavigationBarIndexProvider(int navigationBarIndex) {
    _ref.read(_navigationBarIndexProvider.notifier).state = navigationBarIndex;
  }

  bool isParticipant(InitialDataModel initialData) {
    return initialData.user?.roleName == roleUser;
  }

  // It decides if we should show the floating button for creating events or not.
  bool isFloatingButtonRequired(InitialDataModel initialData) {
    return _ref.read(_navigationBarIndexProvider) == 0 &&
        initialData.operationResult == operationResultSuccess &&
        (initialData.user?.roleName == roleAdmin || initialData.user?.roleName == roleOrganizer);
  }

  FutureProvider<InitialDataModel> createInitialDataProvider() {
    return FutureProvider((ref) async {
      InitialDataModel response = InitialDataModel();

      var eventResponse = _homeBaseRepository.getAllEventRepo();
      var userResponse = _homeBaseRepository.getUserByIdRepo();

      response.user = await userResponse;
      response.events = await eventResponse;

      if (response.user?.operationResult == operationResultSuccess &&
          response.events?.operationResult == operationResultSuccess) {
        response.operationResult = operationResultSuccess;
      }

      _initialData = response;

      return response;
    });
  }
}

final homeBaseControllerProvider = Provider((ref) {
  final homeBaseRepository = ref.watch(homeBaseRepositoryProvider);
  return HomeBaseController(ref, homeBaseRepository);
});
