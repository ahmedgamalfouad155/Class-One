// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sinna/core/theme/colors.dart';
// import 'package:sinna/core/widgets/custom_animated_dialod.dart';
// import 'package:sinna/core/widgets/custom_buton.dart';
// import 'package:sinna/features/admin_tools/presentation/manager/institutions_cubit/institutions_cubit.dart';

// class DeleteInstitutionButtonWidget extends StatelessWidget {
//   const DeleteInstitutionButtonWidget({
//     super.key,
//     required this.specializationId,
//     required this.institutionId,
//   });

//   final String specializationId, institutionId;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<InstitutionsCubit, InstitutionsState>(
//       buildWhen: (previous, current) =>
//           current is InstitutionDeletingState ||
//           current is InstitutionDeletedSuccessState ||
//           current is InstitutionDeleteFailureState ||
//           current is InstitutionsInitial,
//       listener: (context, state) {
//         if (state is InstitutionDeletedSuccessState) {
//           CustomAnimatedDialog.show(
//             context: context,
//             message: "Instructor deleted successfully ✅🎉",
//             animationType: DialogAnimationType.success,
//           );
//         }
//       },
//       builder: (context, state) {
//         if (state is InstitutionDeletingState) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (state is InstitutionDeletedSuccessState ||
//             state is InstitutionsInitial) {
//           return CustomButton(
//             text: "Delete",
//             onPressed: () {
//               context.read<InstitutionsCubit>().deleteInstitution(
//                 specializationId: specializationId,
//                 institutionId: institutionId,
//               );
//             },
//             bacgrouncColor: context.appColors.greyMoonlight,
//             textColor: context.appColors.red,
//             borderSideColor: context.appColors.greyMoonlight,
//           );
//         } else if (state is InstitutionDeleteFailureState) {
//           return Text(state.errMessage);
//         } else {
//           return const Text("error");
//         }
//       },
//     );
//   }
// }
