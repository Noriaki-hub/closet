import 'package:closet_app_xxx/controllers/global/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_login_controller.freezed.dart';

@freezed
class AdminState with _$AdminState {
  const factory AdminState({
    @Default('') String email,
    @Default('') String password,
  }) = _AdminState;
}

final adminProvider = StateNotifierProvider<AdminStateController, AdminState>(
    (ref) => AdminStateController(ref.read));

class AdminStateController extends StateNotifier<AdminState> {
  final Reader _read;

  AdminStateController(this._read) : super(const AdminState()) {}

  Future<void> email({required String email}) async {
    state = state.copyWith(email: email);
  }

  Future<void> password({required String password}) async {
    state = state.copyWith(password: password);
  }

  Future<void> login() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: state.email,
      password: state.password,
    );
    _read(userProvider.notifier).fetchCurrentUser();
  }
}
