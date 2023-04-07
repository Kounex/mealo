import 'dart:convert';
import 'dart:ui' as ui show Codec, ImmutableBuffer;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CachedMemoryImage extends StatelessWidget {
  final String imageBase64;
  final String? id;

  final double? height;
  final double? width;

  final BoxFit fit;

  const CachedMemoryImage({
    super.key,
    required this.imageBase64,
    this.id,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: CacheMemoryImageProvider(
        this.imageBase64.substring(0, 64),
        base64Decode(this.imageBase64),
      ),
      height: this.height,
      width: this.width,
      fit: this.fit,
    );
  }
}

/// From: https://gist.github.com/darmawan01/9be266df44594ea59f07032e325ffa3b
class CacheMemoryImageProvider extends ImageProvider<CacheMemoryImageProvider> {
  final String tag; //the cache id use to get cache
  final Uint8List img; //the bytes of image to cache

  CacheMemoryImageProvider(this.tag, this.img);

  @override
  ImageStreamCompleter loadBuffer(
      CacheMemoryImageProvider key, DecoderBufferCallback decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(decode),
      scale: 1.0,
      debugLabel: tag,
      informationCollector: () sync* {
        yield ErrorDescription('Tag: $tag');
      },
    );
  }

  Future<ui.Codec> _loadAsync(DecoderBufferCallback decode) async {
    // the DefaultCacheManager() encapsulation, it get cache from local storage.
    final Uint8List bytes = img;

    if (bytes.lengthInBytes == 0) {
      // The file may become available later.
      PaintingBinding.instance.imageCache.evict(this);
      throw StateError('$tag is empty and cannot be loaded as an image.');
    }
    final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);

    return await decode(buffer);
  }

  @override
  Future<CacheMemoryImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<CacheMemoryImageProvider>(this);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    bool res = other is CacheMemoryImageProvider && other.tag == tag;
    return res;
  }

  @override
  int get hashCode => tag.hashCode;

  @override
  String toString() =>
      '${objectRuntimeType(this, 'CacheImageProvider')}("$tag")';
}
