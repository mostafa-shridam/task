import 'package:get_it/get_it.dart';
import 'package:task/core/services/dio_service.dart';

import 'event_riverpod_service.dart';
import '../../feature/add_event/presentation/repos/event_repo_impl.dart';
import 'get_data_service.dart';

final GetIt getIt = GetIt.instance;

void getItSetup() async {
  getIt.registerSingleton<DioService>(
    DioService(),
  );
  getIt.registerSingleton<GetDataService>(GetDataService());
  getIt.registerSingleton<EventRepoImpl>(EventRepoImpl());
  getIt.registerSingleton<EventRiverpod>(EventRiverpod(
    getIt.get<EventRepoImpl>(),
  ));
}
