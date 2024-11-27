import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/core/constants/constants.dart';
import 'package:task/core/widgets/custom_app_bar.dart';
import '../../../../../core/services/event_riverpod_service.dart';
import 'category_data.dart';
import 'custom_event_widget.dart';
import 'select_category.dart';

class HomeViewBody extends ConsumerWidget {
  const HomeViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.read(eventProvider);
    final height = context.height;
    return Column(
      children: [
        const HomeAppBar(),
        const SelectCategory(),
        const CategoryFilterData(),
        SizedBox(
          height: height * 0.01,
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: event.length,
            itemBuilder: (context, index) => event.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : CustomEventWidget(
                    eventEntity: event[index],
                  ),
          ),
        ),
      ],
    );
  }
}
