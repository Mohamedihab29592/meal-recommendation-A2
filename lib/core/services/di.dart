import 'package:get_it/get_it.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network_impl.dart';
import 'package:meal_recommendations_a2/features/auth/register/data/data_source/data_source.dart';
import 'package:meal_recommendations_a2/core/network/firebase_network_impl.dart';
import 'package:meal_recommendations_a2/features/auth/login/data/data_source/data_source.dart';

final s1 = GetIt.instance;

void setup() {
  // Register services
  // s1.registerSingleton<AuthService>(AuthService());
  // s1.registerSingleton<FirestoreService>(FirestoreService());
  // s1.registerSingleton<StorageService>(StorageService());
  s1.registerSingleton<RegisterDataSource>(
      RegisterDataSource(FirebaseNetworkServiceImpl()));
  s1.registerSingleton<LoginDataSource>(
      LoginDataSource(FirebaseNetworkServiceImpl()));

  // Register repositories
  // s1.registerSingleton<AuthRepository>(AuthRepository());
  // s1.registerSingleton<FirestoreRepository>(FirestoreRepository());
  // s1.registerSingleton<StorageRepository>(StorageRepository());
 

  // Register use cases
  // s1.registerSingleton<SignInWithGoogle>(SignInWithGoogle());
  // s1.registerSingleton<SignInWithFacebook>(SignInWithFacebook());
  // s1.registerSingleton<SignInWithTwitter>(SignInWithTwitter());

  // Register controllers
  // s1.registerSingleton<AuthController>(AuthController());
  // s1.registerSingleton<FirestoreController>(FirestoreController());
  // s1.registerSingleton<StorageController>(StorageController());
  


  // Register providers
  // s1.registerSingleton<AuthProvider>(AuthProvider());
  // s1.registerSingleton<FirestoreProvider>(FirestoreProvider());
  // s1.registerSingleton<StorageProvider>(StorageProvider());
  


  // Register factories
  // s1.registerFactory<AuthFactory>(() => AuthFactory());
  // s1.registerFactory<FirestoreFactory>(() => FirestoreFactory());
  // s1.registerFactory<StorageFactory>(() => StorageFactory());


  // Register blocs
  // s1.registerSingleton<AuthBloc>(AuthBloc());
  // s1.registerSingleton<FirestoreBloc>(FirestoreBloc());
  // s1.registerSingleton<StorageBloc>(StorageBloc());
  
}

