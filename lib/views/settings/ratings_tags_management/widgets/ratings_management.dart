import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../../models/rating/rating.dart';
import '../../../../stores/shared/ratings/ratings.dart';
import '../../../../utils/isar.dart';
import '../../../../widgets/base/text_form_field.dart';

class RatingsManagement extends ConsumerStatefulWidget {
  const RatingsManagement({super.key});

  @override
  ConsumerState<RatingsManagement> createState() => _RatingsManagementState();
}

class _RatingsManagementState extends ConsumerState<RatingsManagement> {
  final GlobalKey<FormState> _form = GlobalKey();
  final TextEditingController _rating = TextEditingController();

  void _addRating() async {
    await IsarUtils.crud(
      (isar) => isar.ratings.put(Rating()..name = _rating.text),
    );

    _rating.clear();
  }

  List<Widget> _ratingTile(List<Rating> ratings) {
    ratings.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    );
    return ratings
        .map(
          (rating) => ListTile(
            title: Text(rating.name),
            trailing: IconButton(
              onPressed: () => IsarUtils.crud(
                (isar) => isar.ratings.deleteByUuid(rating.uuid),
              ),
              icon: const Icon(CupertinoIcons.delete),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Rating>> asyncRatings = ref.watch(ratingsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...asyncRatings.when(
          skipLoadingOnReload: true,
          data: (ratings) => [
            ..._ratingTile(ratings),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Form(
                      key: _form,
                      child: BaseTextFormField(
                        controller: _rating,
                        hintText: 'New rating...',
                        validator: (text) => IsarUtils.instance.ratings
                                .filter()
                                .nameEqualTo(text!, caseSensitive: false)
                                .isNotEmptySync()
                            ? 'Rating already exists!'
                            : null,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        _addRating();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ],
          error: (error, stackTrace) => [
            Text(error.toString()),
          ],
          loading: () => [
            const CircularProgressIndicator(),
          ],
        ),
      ],
    );
  }
}
