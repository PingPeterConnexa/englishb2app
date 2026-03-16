import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository {
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  Future<UserModel> signInWithEmail(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _currentUser = UserModel(
      userId: 'user_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      displayName: email.split('@').first,
      createdAt: DateTime.now(),
      hasCompletedOnboarding: true,
      hasAcceptedPrivacy: true,
    );
    return _currentUser!;
  }

  Future<UserModel> signInWithApple() async {
    await Future.delayed(const Duration(milliseconds: 800));
    _currentUser = UserModel(
      userId: 'apple_${DateTime.now().millisecondsSinceEpoch}',
      email: 'user@apple.com',
      displayName: 'Apple User',
      createdAt: DateTime.now(),
      hasCompletedOnboarding: true,
      hasAcceptedPrivacy: true,
    );
    return _currentUser!;
  }

  Future<UserModel> signUp(String email, String password, String name) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _currentUser = UserModel(
      userId: 'user_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      displayName: name,
      createdAt: DateTime.now(),
      hasCompletedOnboarding: false,
      hasAcceptedPrivacy: true,
    );
    return _currentUser!;
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _currentUser = null;
  }

  Future<void> deleteAccount() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }
}
