abstract class FirebaseNetworkService {
  // Authentication methods
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(String email, String password);
  Future<void> signOut();
  Future<bool> isUserSignedIn();

  // Firestore data operations
  Future<void> createDocument(String collection, Map<String, dynamic> data);
  Future<Map<String, dynamic>?> getDocument(String collection, String docId);
  Future<void> updateDocument(String collection, String docId, Map<String, dynamic> data);
  Future<void> deleteDocument(String collection, String docId);
}