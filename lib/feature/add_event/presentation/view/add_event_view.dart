import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:task/core/constants/constants.dart';
import 'package:task/core/widgets/custom_show_snack_bar.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/build_modal_bottom_sheet.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/widgets/custom_list_tile_category_items.dart';
import '../../../../core/widgets/custom_text_filed.dart';
import '../../../../core/widgets/list_tile_category.dart';
import '../../../home/presentation/model/event_entity.dart';
import '../../../../core/services/event_riverpod_service.dart';
import 'widgets/name_date.dart';

final categoryProvider = StateProvider<String>((ref) => "General");
final colorProvider = StateProvider<int>((ref) => AppColors.primaryColor.value);

class AddEventView extends ConsumerStatefulWidget {
  const AddEventView({
    super.key,
  });
  static const String routeName = "add_event_view";
  @override
  ConsumerState<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends ConsumerState<AddEventView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  String? startsAt, createdAt, startsEn, hijriStartsAt;
  String? eventDate, eventDateEn, eventDay, eventDateAr;
  String? alertDate, category, priority, repeat;
  String? endsAt, hijriEndsAt, publishedAt, remainingDays;
  bool? pinned;
  int? interval;
  String? id;
  int? color;

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    detailsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? colorSelect = ref.watch(colorProvider.notifier).state;
    final category = ref.watch(categoryProvider);
    final height = context.height;
    final width = context.width;
    const String defaultDate = "Select date";
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: LoaderOverlay(
        overlayWholeScreen: true,
        child: Scaffold(
          backgroundColor: const Color(0xffF1F5F9),
          appBar: eventAppBar(
            textButton: "Add",
            title: "Add Event",
            context: context,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                if (startsAt == defaultDate || startsAt == null || startsAt == "Select time") {
                  customShowSnackBar(context,
                      message: "Please select date and time");
                } else {
                  context.loaderOverlay.show();

                  final newEvent = EventEntity(
                    id: id ?? "",
                    title: titleController.text,
                    hijriStartsAt: hijriStartsAt ?? defaultDate,
                    startsAt: startsAt ?? defaultDate,
                    remainingDays: remainingDays ?? defaultDate,
                    eventDate: eventDate ?? defaultDate,
                    eventDateEn: eventDateEn ?? defaultDate,
                    eventDay: eventDay ?? defaultDate,
                    eventDateAr: eventDateAr ?? defaultDate,
                    interval: interval ?? 0,
                    startsEn: startsEn ?? defaultDate,
                    createdAt: createdAt ?? defaultDate,
                    publishedAt: publishedAt ?? defaultDate,
                    pinned: pinned ?? false,
                    color: color ?? AppColors.primaryColor.value,
                  );
                  context.loaderOverlay.hide();
                  ref.read(eventProvider.notifier).addEvent(event: newEvent);
                  Navigator.pop(context);
                }
              }
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.03),
                CustomTextFiled(
                  onChanged: (value) => titleController.text = value,
                  controller: titleController,
                  hint: "Add title",
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  horizntalPadding: width * 0.05,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter title" : null,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      DateWidget(
                        nameDate: "Start date",
                        startsAt: (value) => startsAt = value,
                      ),
                      const CustomDivider(),
                      ListTileCategory(
                        onTap: () {
                          buildModalBottomSheet(
                            context: context,
                            selectedCategory: (selectedCategory) {
                              ref.read(categoryProvider.notifier).state =
                                  selectedCategory;
                            },
                            selectedColor: (selectedColor) {
                              colorSelect = ref
                                  .read(colorProvider.notifier)
                                  .state = selectedColor.value;
                              color = selectedColor.value;
                            },
                          );
                        },
                        color: colorSelect,
                        isSelectedCategory: true,
                        categoryName: category,
                        title: 'Category',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      DateWidget(
                        nameDate: "End date",
                        startsAt: (value) => endsAt = value,
                      ),
                      const CustomDivider(),
                      CustomListTileCategoryItems(
                        alert: (value) {
                          eventDate = value;
                        },
                        repeat: (value) {
                          eventDay = value;
                        },
                        priority: (value) {
                          eventDay = value;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                CustomTextFiled(
                  onChanged: (value) => detailsController.text = value,
                  controller: detailsController,
                  hint: "Description",
                  keyboardType: TextInputType.text,
                  maxLines: 4,
                  horizntalPadding: width * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
