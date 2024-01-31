import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_auth/utilities/constants.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class AuthAPI extends ChangeNotifier {
  Client client = Client();
  late final Account account;
  late User _currentUser;

  AuthStatus _status = AuthStatus.uninitialized;

  //Getter Methods
  User get currentUser => _currentUser;
  AuthStatus get status => _status;
  String? get username => _currentUser.name;
  String? get email => _currentUser.email;
  String? get userid => _currentUser.$id;

  //Constructor
  AuthAPI() {
    init();
    loadUser();
  }

  init() {
    client.setEndpoint(endPoint).setProject(projectId);
    account = Account(client);
  }

  loadUser() async {
    try {
      final user = await account.get();
      _status = AuthStatus.authenticated;
      _currentUser = user;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future<User> createUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final user = await account.create(
          userId: ID.unique(), name: name, email: email, password: password);
      return user;
    } finally {
      notifyListeners();
    }
  }

  Future<Session> createEmailSession(
      {required String email, required String password}) async {
    try {
      final session =
          await account.createEmailSession(email: email, password: password);
      _currentUser = await account.get();
      _status = AuthStatus.authenticated;
      return session;
    } finally {
      notifyListeners();
    }
  }

  signOut() async {
    try {
      await account.deleteSession(sessionId: 'current');
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future<Preferences> getUserPreferences() async {
    return await account.getPrefs();
  }

  updatePreferences({required String bio}) async {
    return account.updatePrefs(prefs: {'bio': bio});
  }
}
