import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_auth/utilities/auth_api.dart';
import 'package:appwrite_auth/utilities/constants.dart';

class DatabaseAPI {
  Client client = Client();
  late final Account account;
  late final Databases databases;
  final AuthAPI auth = AuthAPI();

  DatabaseAPI() {
    init();
  }

  init() {
    client.setEndpoint(endPoint).setProject(projectId).setSelfSigned();
    account = Account(client);
    databases = Databases(client);
  }

  Future<DocumentList> getMessages() {
    return databases.listDocuments(
      databaseId: databaseId,
      collectionId: collectionId,
    );
  }

  Future<Document> addMessage({required String message}) {
    return databases.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: ID.unique(),
        data: {
          'text': message,
          'date': DateTime.now().toString(),
          'user_id': auth.userid
        });
  }

  Future<dynamic> deleteMessage({required String id}) {
    return databases.deleteDocument(
        databaseId: databaseId, collectionId: collectionId, documentId: id);
  }
}
