import 'package:flutter/material.dart';

import '../ui/progress_indicator.dart';
import '../ui/result.dart';

class BaseFutureBuilder<T> extends StatelessWidget {
  final Future<T>? future;

  final String? loading;

  final Widget Function(T? data) data;

  const BaseFutureBuilder({
    super.key,
    this.future,
    this.loading,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: this.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasError) {
            return this.data(snapshot.data);
          }
          return Center(
            child: BaseResult(
              icon: BaseResultIcon.negative,
              text: snapshot.error!.toString(),
            ),
          );
        }
        // if (snapshot.connectionState == ConnectionState.none) {
        //   return Center(child: BaseResult(icon: BaseResultIcon.Missing, text: '',),);
        // }
        return Center(
          child: BaseProgressIndicator(
            text: this.loading ?? 'Fetching...',
          ),
        );
      },
    );
  }
}
