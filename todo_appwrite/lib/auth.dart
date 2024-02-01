import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint('https://appwrite.rajdeepthakare.com/v1')
    .setProject('65ba551a6ed53516acb2');

final account = Account(client);

Future<String> registerUser(String name, String email, String password) async {
  try {
    final user = await account.create(
      userId: ID.unique(),
      name: name,
      email: email,
      password: password,
    );
    return 'success';
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

Future loginUser(String email, String password) async {
  try {
    final user = await account.createEmailSession(
      email: email,
      password: password,
    );
    return 'success';
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

Future logoutUser() async {
  await account.deleteSession(sessionId: 'current');
  print('User Logged Out');
}

Future checkUserAuth() async {
  try {
    await account.getSession(sessionId: 'current');
    return true;
  } on Exception catch (e) {
    print(e);
    return false;
  }
}
