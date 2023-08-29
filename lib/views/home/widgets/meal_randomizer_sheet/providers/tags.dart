import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../models/tag/tag.dart';

part 'tags.g.dart';

@riverpod
class IncludedTags extends _$IncludedTags {
  @override
  List<Tag> build() => [];

  void addTag(Tag tag) => this.state = [...this.state, tag];

  void removeTag(Tag tag) => this.state = [...this.state..remove(tag)];

  void clear() => this.state = [];
}

@riverpod
class ExcludedTags extends _$ExcludedTags {
  @override
  List<Tag> build() => [];

  void addTag(Tag tag) => this.state = [...this.state, tag];

  void removeTag(Tag tag) => this.state = [...this.state..remove(tag)];

  void clear() => this.state = [];
}
