import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/categories/data/models/leson_model.dart';
import 'package:sinna/features/categories/presentation/manager/leason_cubit/lesson_cubit.dart';
import 'package:sinna/features/categories/presentation/manager/leason_cubit/lesson_state.dart';

class LessonsViewBody extends StatelessWidget {
  const LessonsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      builder: (context, state) {
        if (state is LessonLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LessonSuccessState) {
          final sortedLessons = List<LessonModel>.from(state.lesson)
            ..sort((a, b) => a.number.compareTo(b.number)); 
          return Column(
            children: [
              ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.amber,
                      child: Text(sortedLessons[index].name),
                    ),
                  ),
                ),
                itemCount: sortedLessons.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          );
        } else if (state is LessonFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text('error');
        }
      },
    );
  }
}

// Future<void> getSubCollections() async {
//   final doctorsSnapshot = await FirebaseFirestore.instance
//       .collection('egypt')
//       .doc("mansoura")
//       .collection('Bachelors')
//       // .doc("level one")
//       // .collection('science')
//       .get();

//   for (var doc in doctorsSnapshot.docs) {
//     print("Doctor ID: ${doc.id}");
//   } // اسم الـ collection
// }

// lesonCubit.getLeson(
//       country: 'egypt',
//       university: "mansoura",
//       system: "Bachelors",
//       level: "level one",
//       subject: "science",
//       term: "first term",
//       doctor: "Dr Ezzat",
//     );
