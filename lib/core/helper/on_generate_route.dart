import 'package:flutter/material.dart';

import '../../feature/add_event/presentation/view/add_event_view.dart';
import '../../feature/details_event/presentation/view/details_event_view.dart';
import '../../feature/edit_event/presentation/view/edit_event_view.dart';
import '../../feature/main/presentation/view/main_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainView.routeName:
      return MaterialPageRoute(
        builder: (context) => const MainView(),
      );
    case AddEventView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AddEventView(),
      );
    case DetailsEventView.routeName:
      return MaterialPageRoute(
        builder: (context) => const DetailsEventView(),
        settings: settings,
      );
    case EditEventView.routeName:
      return MaterialPageRoute(
        builder: (context) => const EditEventView(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(builder: (context) => const Placeholder());
  }
}
