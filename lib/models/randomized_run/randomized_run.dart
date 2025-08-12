import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../embeddings/rating_link/rating_link.dart';
import '../model.dart';
import '../persistence.dart';

part 'randomized_run.g.dart';

@riverpod
class RandomizedRuns extends _$RandomizedRuns with Persistence<RandomizedRun> {
  @override
  FutureOr<List<RandomizedRun>> build() async => this.init();
}

@collection
class RandomizedRun extends BaseModel {
  /// [Tag]s which meals should have applied
  List<String> includedTagsUuids = [];

  /// [Tag]s we don't want randomized meals to have
  List<String> excludedTagsUuids = [];

  List<String> includedIngredientUuids = [];

  List<String> excludedIngredientUuids = [];

  List<RatingLink> ratingLinks = [];

  /// The amount of days how long ago we wanted to find a meal we ate the last
  /// time
  int? daysNotEaten;

  late String mealUuid;

  /// We app assumes that users will eat meals based on the result of a
  /// [RandomizedRun]. But in reality users might have just decided to eat a
  /// meal on their own. This would make this data inaccurate since we would
  /// assume a meal hasn't been eaten if we haven't selected a [RandomizedRun]
  /// as eaten. Thats why it's possible to create an empty instance which will
  /// have this flag on true which means a users just wanted to indicate that
  /// a certain meal has been eaten without being randomized so the data keeps
  /// being as accurate as possible for the filters later (see the named
  /// constructor below)
  bool manuallyEaten = false;

  /// Generally we assume a randomized run does not automatically mean the
  /// user will select this meal as their next meal to eat. Once the user
  /// indicated that this meal will be eaten, we will set this to true and
  /// we can query this later
  bool eaten = false;

  RandomizedRun();

  RandomizedRun.manually({
    required this.mealUuid,
    this.manuallyEaten = true,
    this.eaten = true,
  });
}
