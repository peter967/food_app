import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/api/api.dart';

final provider = Provider((_) {
  return Api().getData();
});
