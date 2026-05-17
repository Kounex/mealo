// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentTabIndex)
final currentTabIndexProvider = CurrentTabIndexProvider._();

final class CurrentTabIndexProvider
    extends $NotifierProvider<CurrentTabIndex, int> {
  CurrentTabIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentTabIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentTabIndexHash();

  @$internal
  @override
  CurrentTabIndex create() => CurrentTabIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentTabIndexHash() => r'879d6992e570023027efb8131f48ec6504de11e3';

abstract class _$CurrentTabIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
