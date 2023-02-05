import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/rating/rating.dart';
import '../../persistance.dart';

part 'ratings.g.dart';

@riverpod
class Ratings extends _$Ratings with Persistance<Rating> {
  @override
  FutureOr<List<Rating>> build() async => this.init();
}
