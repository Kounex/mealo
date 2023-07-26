import 'package:isar/isar.dart';
import 'package:mealo/models/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../embeddings/rating_link/rating_link.dart';
import '../persistance.dart';

part 'randomized_run.g.dart';

@riverpod
class RandomizedRuns extends _$RandomizedRuns with Persistance<RandomizedRun> {
  @override
  FutureOr<List<RandomizedRun>> build() async => this.init();
}

@collection
class RandomizedRun extends BaseModel {
  /// [Tag]s which meals should have applied
  List<String> inclusiveTagsUuids = [];

  /// [Tag]s we don't want randomized meals to have
  List<String> exclusiveTagsUuids = [];

  List<RatingLink> ratingLinks = [];

  /// This property will filter for those meals which haven't been feasted at
  /// all or at least before this date so users can get randomized suggestions
  /// of meals which haven't been feast for a selected time
  @utc
  DateTime? mealNotFeastSince;

  late String mealUuid;

  /// Generally we assume a randomized run does not automatically mean the
  /// user will select this meal as their next meal to feast. Once the user
  /// indicated that this meal will be feast, we will set this to true and
  /// we can query this later
  bool feast = false;
}
