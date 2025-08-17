// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sinna/core/constants/images.dart';
// import 'package:sinna/core/router/app_router.dart';
// import 'package:sinna/core/theme/customs_box_decoratino.dart';
// import 'package:sinna/core/theme/styles.dart';
// import 'package:sinna/features/categories/data/models/course_path_model.dart';
// import 'package:sinna/features/categories/data/services/firebase_lesson_pathes_services.dart';

// class InstractorViewBody extends StatelessWidget {
//   const InstractorViewBody({super.key, required this.lessonPathModel});
//   final CoursePathModel lessonPathModel;
//   @override
//   Widget build(BuildContext context) {
//     final doctorpath = FirebaseLessonService.instance;
//     return FutureBuilder(
//       future: doctorpath.getDoctors(lessonPathModel),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Error'));
//         }
//         final doctors = snapshot.data ?? [];
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 15),
//           child: GridView.builder(
//             scrollDirection: Axis.horizontal,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               mainAxisSpacing: 10,
//               crossAxisSpacing: 20,
//               childAspectRatio: .9,
//             ),
//             itemBuilder: (context, index) => Column(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       lessonPathModel.update(doctor: doctors[index]);
//                       GoRouter.of(
//                         context,
//                       ).push(AppRouter.kCoursesView, extra: lessonPathModel);
//                     },
//                     child: Container(
//                       decoration: CustomsBoxDecoration().defaultBoxDecoration(
//                         context,
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: Image.asset(AppImages.fav, fit: BoxFit.cover),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(doctors[index], style: AppStyles.textStyle16(context)),
//               ],
//             ),
//             itemCount: doctors.length,
//           ),
//         );
//       },
//     );
//   }
// }
