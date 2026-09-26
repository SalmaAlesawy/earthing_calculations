// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/counter1.svg
  SvgGenImage get counter1 => const SvgGenImage('assets/icons/counter1.svg');

  /// File path: assets/icons/counter2.svg
  SvgGenImage get counter2 => const SvgGenImage('assets/icons/counter2.svg');

  /// File path: assets/icons/counter3.svg
  SvgGenImage get counter3 => const SvgGenImage('assets/icons/counter3.svg');

  /// File path: assets/icons/counter4.svg
  SvgGenImage get counter4 => const SvgGenImage('assets/icons/counter4.svg');

  /// List of all assets
  List<SvgGenImage> get values => [counter1, counter2, counter3, counter4];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Single.png
  AssetGenImage get single => const AssetGenImage('assets/images/Single.png');

  /// File path: assets/images/a.png
  AssetGenImage get a => const AssetGenImage('assets/images/a.png');

  /// File path: assets/images/bahra_logo.png
  AssetGenImage get bahraLogo =>
      const AssetGenImage('assets/images/bahra_logo.png');

  /// File path: assets/images/bahra_name.png
  AssetGenImage get bahraName =>
      const AssetGenImage('assets/images/bahra_name.png');

  /// File path: assets/images/connection.png
  AssetGenImage get connection =>
      const AssetGenImage('assets/images/connection.png');

  /// File path: assets/images/correct.png
  AssetGenImage get correct => const AssetGenImage('assets/images/correct.png');

  /// File path: assets/images/grounding_rods_background.png
  AssetGenImage get groundingRodsBackground =>
      const AssetGenImage('assets/images/grounding_rods_background.png');

  /// File path: assets/images/k.png
  AssetGenImage get k => const AssetGenImage('assets/images/k.png');

  /// File path: assets/images/multible_result.png
  AssetGenImage get multibleResult =>
      const AssetGenImage('assets/images/multible_result.png');

  /// File path: assets/images/multiple_earth_rods.png
  AssetGenImage get multipleEarthRods =>
      const AssetGenImage('assets/images/multiple_earth_rods.png');

  /// File path: assets/images/multiple_rods.png
  AssetGenImage get multipleRods =>
      const AssetGenImage('assets/images/multiple_rods.png');

  /// File path: assets/images/single_earth_rod.png
  AssetGenImage get singleEarthRod =>
      const AssetGenImage('assets/images/single_earth_rod.png');

  /// File path: assets/images/single_result.png
  AssetGenImage get singleResult =>
      const AssetGenImage('assets/images/single_result.png');

  /// File path: assets/images/winner4-pins.png
  AssetGenImage get winner4Pins =>
      const AssetGenImage('assets/images/winner4-pins.png');

  /// File path: assets/images/winner_formula.png
  AssetGenImage get winnerFormula =>
      const AssetGenImage('assets/images/winner_formula.png');

  /// File path: assets/images/wire.png
  AssetGenImage get wire => const AssetGenImage('assets/images/wire.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    single,
    a,
    bahraLogo,
    bahraName,
    connection,
    correct,
    groundingRodsBackground,
    k,
    multibleResult,
    multipleEarthRods,
    multipleRods,
    singleEarthRod,
    singleResult,
    winner4Pins,
    winnerFormula,
    wire,
  ];
}

abstract final class Assets {
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
