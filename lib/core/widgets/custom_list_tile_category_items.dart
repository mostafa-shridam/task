import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/core/widgets/build_modal_bottom_sheet.dart';
import 'package:task/core/widgets/category_list.dart';
import 'package:task/feature/add_event/presentation/view/widgets/select_event_date.dart';

import 'custom_divider.dart';
import 'list_tile_category.dart';

class CustomListTileCategoryItems extends ConsumerStatefulWidget {
  const CustomListTileCategoryItems({
    super.key,
    required this.alert,
    required this.repeat,
    required this.priority,
  });
  final ValueChanged<String> alert, repeat, priority;

  @override
  ConsumerState<CustomListTileCategoryItems> createState() =>
      _CustomListTileCategoryItemsState();
}

class _CustomListTileCategoryItemsState
    extends ConsumerState<CustomListTileCategoryItems> {
  TimeOfDay? timeValue;
  String? repeatValue = 'Never';
  String? priorityValue = 'Low';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileCategory(
          onTap: () async {
            final time = await selectTime(
              context: context,
              isSelectedTime: timeValue != null ? timeValue! : TimeOfDay.now(),
            );
            // ignore: use_build_context_synchronously
            widget.alert(time!.format(context));
            setState(() {
              timeValue = time;
            });
          },
          isSelectedCategory: false,
          categoryName: timeValue?.format(context) ?? "At time",
          title: 'Alert',
        ),
        const CustomDivider(),
        ListTileCategory(
          onTap: () {
            customModalBottomSheet(
              context: context,
              isSelcected: (value) {
                setState(() {
                  repeatValue = value;
                });
                widget.repeat(value);
              },
              title: RepeatList.repeatList,
            );
          },
          isSelectedCategory: false,
          categoryName: repeatValue!,
          title: 'Repeat',
        ),
        const CustomDivider(),
        ListTileCategory(
          onTap: () {
            customModalBottomSheet(
              context: context,
              isSelcected: (value) {
                setState(() {
                  priorityValue = value;
                });
                widget.priority(value);
              },
              title: PriorityList.repeatList,
            );
          },
          isSelectedCategory: false,
          categoryName: priorityValue!,
          title: 'Priority',
        ),
      ],
    );
  }
}
