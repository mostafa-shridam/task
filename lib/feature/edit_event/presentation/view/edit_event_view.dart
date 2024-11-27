import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:task/core/constants/constants.dart';
import 'package:task/core/widgets/custom_show_snack_bar.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/custom_dates.dart';
import '../../../../core/widgets/build_modal_bottom_sheet.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/widgets/custom_list_tile_category_items.dart';
import '../../../../core/widgets/custom_text_filed.dart';
import '../../../../core/widgets/list_tile_category.dart';
import '../../../../core/services/event_riverpod_service.dart';
import '../../../add_event/presentation/view/widgets/name_date.dart';
import '../../../home/presentation/model/event_entity.dart';

final categoryProvider = StateProvider<String>((ref) => "General");
final colorProvider = StateProvider<int>((ref) => AppColors.primaryColor.value);

class EditEventView extends ConsumerStatefulWidget {
  const EditEventView({
    super.key,
  });
  static const String routeName = "edit_event_view";
  @override
  ConsumerState<EditEventView> createState() => _EditEventViewState();
}

class _EditEventViewState extends ConsumerState<EditEventView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController? titleController;
  TextEditingController? detailsController;
  DateTime? selectStartDate;
  DateTime? selectEndDate;
  String? startsAt, id;
  ValueChanged<String>? eventDate;
  ValueChanged<int>? color;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController?.dispose();
    detailsController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final width = context.width;
    EventEntity eventEntity =
        ModalRoute.of(context)?.settings.arguments as EventEntity;
    titleController = TextEditingController(text: eventEntity.title);
    detailsController = TextEditingController(text: eventEntity.details ?? "");
    selectStartDate = DateTime.parse(eventEntity.startsAt.split(" ")[0]);
    selectEndDate = DateTime.parse(eventEntity.startsAt.split(" ")[0]);
    startsAt = eventEntity.startsAt.split(" ")[0];
    eventDate = (value) => eventEntity.eventDate = value;
    color = (value) => eventEntity.color = value;
    id = eventEntity.id;
    final category = ref.watch(categoryProvider);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: LoaderOverlay(
        overlayWholeScreen: true,
        child: Scaffold(
          backgroundColor: const Color(0xffF1F5F9),
          appBar: eventAppBar(
            textButton: "Edit",
            title: "Edit Event",
            context: context,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.loaderOverlay.show();
                eventEntity.save();
                eventEntity.title = titleController!.text.trim();
                eventEntity.details = detailsController!.text.trim();
                updateEventValues(eventEntity);
                ref.read(eventProvider.notifier).editEvent(
                      event: eventEntity,
                    );
                context.loaderOverlay.hide();
                customShowSnackBar(context, message: "Event updated");
                Navigator.pop(context);
              }
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.03),
                CustomTextFiled(
                  onChanged: (value) => titleController!.text = value,
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
                        date: customFormatSelectedDate(selectStartDate!),
                        time: customFormatSelectedTime(selectStartDate!),
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
                              ref.read(colorProvider.notifier).state =
                                  selectedColor.value;
                              color!(selectedColor.value);
                            },
                          );
                        },
                        color: eventEntity.color,
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
                        startsAt: (value) => eventDate!(value),
                      ),
                      const CustomDivider(),
                      CustomListTileCategoryItems(
                        alert: (value) {
                          eventDate!(value);
                        },
                        repeat: (value) {
                          eventDate!(value);
                        },
                        priority: eventDate ?? (value) => "",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                CustomTextFiled(
                  onChanged: (value) => detailsController?.text = value,
                  controller: detailsController,
                  hint: "Description",
                  keyboardType: TextInputType.text,
                  maxLines: 4,
                  horizntalPadding: width * 0.05,
                ),
                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateEventValues(EventEntity eventEntity) {
    eventEntity.title = titleController?.text ?? '';
    eventEntity.details = detailsController?.text ?? "";
    eventEntity.startsAt = selectStartDate!.toString();
    eventEntity.eventDate = customFormatSelectedDate(selectEndDate!);
    eventEntity.color = ref.read(colorProvider);
  }
}
