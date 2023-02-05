import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseAsyncValueBuilder<T> extends StatelessWidget {
  final AsyncValue<T> asyncValue;

  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;

  final Widget Function(T data) data;
  final Widget Function(Object error, StackTrace stackTrace)? error;
  final Widget Function()? loading;

  const BaseAsyncValueBuilder({
    super.key,
    required this.asyncValue,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = true,
    required this.data,
    this.error,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return this.asyncValue.when(
          skipLoadingOnReload: this.skipLoadingOnReload,
          skipLoadingOnRefresh: this.skipLoadingOnRefresh,
          data: this.data,
          error: this.error ??
              (error, stackTrace) => Center(
                    child: Text(
                      error.toString(),
                    ),
                  ),
          loading: this.loading ??
              () => const Center(
                    child: CircularProgressIndicator(),
                  ),
        );
  }
}
