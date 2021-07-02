import 'package:covid_tracker/app/app_controller.dart';
import 'package:covid_tracker/app/tracker/tracker_controller.dart';
import 'package:covid_tracker/infra/config/api_config.dart';
import 'package:covid_tracker/infra/repositories/cases_repository.dart';
import 'package:get_it/get_it.dart';

void setUpTrackerProvider() async {
  final casesRepository = CasesRepository(api: api);
  GetIt.I.registerSingletonWithDependencies(
    () => TrackerController(
      casesRepository: casesRepository,
      appController: GetIt.I.get<AppController>(),
    ),
    dependsOn: [AppController],
  );
}
