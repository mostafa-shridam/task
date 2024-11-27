import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../edit_event/presentation/view/edit_event_view.dart';
import '../../../home/presentation/model/event_entity.dart';
import 'widgets/details_event_view_body.dart';

class DetailsEventView extends ConsumerWidget {
  const DetailsEventView({
    super.key,
  });

  static const String routeName = 'details_event';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    EventEntity eventEntity =
        ModalRoute.of(context)?.settings.arguments as EventEntity;

    return Scaffold(
      appBar: detailsAppBar(
        onTap: () {
          Navigator.pushNamed(
            context,
            EditEventView.routeName,
            arguments: eventEntity,
          );
                },
      ),
      body: DetailsEventViewBody(
        eventEntity: eventEntity,
      ),
    );
  }
}
