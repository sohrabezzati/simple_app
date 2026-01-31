import 'package:flutter_riverpod/legacy.dart';

import '../repositories/login_user_repository.dart';

final loginUserRepositoryProvider = ChangeNotifierProvider<LoginUserRepository>(
  (ref) => LoginUserRepository(ref),
);
