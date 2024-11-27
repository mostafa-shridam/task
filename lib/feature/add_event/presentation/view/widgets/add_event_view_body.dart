// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:task/core/constants/app_colors.dart';
// import 'package:task/core/constants/constants.dart';
// import 'package:task/core/widgets/custom_divider.dart';
// import 'package:task/core/widgets/custom_list_tile_category_items.dart';
// import 'package:task/core/widgets/custom_text_filed.dart';
// import '../../../../../core/widgets/build_modal_bottom_sheet.dart';
// import '../../../../../core/widgets/list_tile_category.dart';
// import 'name_date.dart';



// class AddEventViewBody extends ConsumerWidget {
//   const AddEventViewBody({
//     super.key,
//     required this.titleController,
//     required this.detailsController,
//     required this.startsAt,
//     required this.createdAt,
//     required this.startsEn,
//     required this.hijriStartsAt,
//     required this.eventDate,
//     required this.eventDateEn,
//     required this.eventDay,
//     required this.eventDateAr,
//     required this.endsAt,
//     required this.hijriEndsAt,
//     required this.publishedAt,
//     required this.remainingDays,
//     required this.pinned,
//     required this.color,
//     required this.interval,
//   });

//   final TextEditingController titleController, detailsController;
//   final ValueChanged<String>? startsAt, createdAt, startsEn, hijriStartsAt;
//   final ValueChanged<String> eventDate,
//       eventDateEn,
//       eventDay,
//       eventDateAr,
//       endsAt;
//   final String hijriEndsAt, publishedAt, remainingDays;
//   final bool pinned;
//   final ValueChanged<int> interval, color;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final height = context.height;
//     final width = context.width;
//     int? colorSelect = ref.watch(colorProvider.notifier).state;
//     final category = ref.watch(categoryProvider);
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: height * 0.03),
//           Center(
//             child: CustomTextFiled(
//               onChanged: (value) => titleController.text = value,
//               controller: titleController,
//               hint: "Add title",
//               keyboardType: TextInputType.text,
//               maxLines: 1,
//               horizntalPadding: width * 0.05,
//               validator: (value) =>
//                   value!.isEmpty ? "Please enter title" : null,
//             ),
//           ),
//           SizedBox(height: height * 0.03),
//           Container(
//             color: Colors.white,
//             child: Column(
//               children: [
//                 DateWidget(
//                   nameDate: "Start date",
//                   startsAt: startsAt ?? (value) => "Select date",
//                 ),
//                 const CustomDivider(),
//                 ListTileCategory(
//                   onTap: () {
//                     buildModalBottomSheet(
//                       context: context,
//                       selectedCategory: (selectedCategory) {
//                         ref.read(categoryProvider.notifier).state =
//                             selectedCategory;
//                       },
//                       selectedColor: (selectedColor) {
//                         colorSelect = ref.read(colorProvider.notifier).state =
//                             selectedColor.value;
//                         color(selectedColor.value);
//                       },
//                     );
//                   },
//                   color: colorSelect,
//                   isSelectedCategory: true,
//                   categoryName: category,
//                   title: 'Category',
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: height * 0.03),
//           Container(
//             color: Colors.white,
//             child: Column(
//               children: [
//                 DateWidget(
//                   nameDate: "End date",
//                   startsAt: endsAt,
//                 ),
//                 const CustomDivider(),
//                 CustomListTileCategoryItems(
//                   alert: (value) {
//                     eventDate(value);
//                   },
//                   repeat: (value) {
//                     eventDay(value);
//                   },
//                   priority: eventDay,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: height * 0.03),
//           CustomTextFiled(
//             onChanged: (value) => detailsController.text = value,
//             controller: detailsController,
//             hint: "Description",
//             keyboardType: TextInputType.text,
//             maxLines: 4,
//             horizntalPadding: width * 0.05,
//           ),
//         ],
//       ),
//     );
//   }
// }
