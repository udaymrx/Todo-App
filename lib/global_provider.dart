import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nicetodo/util/service/firebase_service.dart';

final firebaseProvider = Provider((ref) => FirebaseService());
