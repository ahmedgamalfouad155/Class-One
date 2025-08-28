import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';
import 'package:sinna/features/profile/data/account_service.dart';
import 'package:sinna/features/profile/presentation/manager/account_cubit/account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

  final AccountService service = AccountServiceImpl();
  final String uid = AuthServicesImpl().currentUser!.email!;

  void updateUser(UserAcademicModel userAcademicModel) async {
    emit(AccountInitial());
    await service.updateAccount(uid, userAcademicModel);
    emit(AccountUpdateSuccessState());
  }
}
