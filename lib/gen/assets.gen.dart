/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_compelte_test.svg
  SvgGenImage get icCompelteTest =>
      const SvgGenImage('assets/icons/ic_compelte_test.svg');

  /// File path: assets/icons/ic_complete_lesson.svg
  SvgGenImage get icCompleteLesson =>
      const SvgGenImage('assets/icons/ic_complete_lesson.svg');

  /// File path: assets/icons/ic_home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/icons/ic_home.svg');

  /// File path: assets/icons/ic_pencil.svg
  SvgGenImage get icPencil => const SvgGenImage('assets/icons/ic_pencil.svg');

  /// File path: assets/icons/ic_profile.svg
  SvgGenImage get icProfile => const SvgGenImage('assets/icons/ic_profile.svg');

  /// File path: assets/icons/ic_rank.svg
  SvgGenImage get icRank => const SvgGenImage('assets/icons/ic_rank.svg');

  /// File path: assets/icons/ic_setting.svg
  SvgGenImage get icSetting => const SvgGenImage('assets/icons/ic_setting.svg');

  /// File path: assets/icons/ic_start.svg
  SvgGenImage get icStart => const SvgGenImage('assets/icons/ic_start.svg');

  /// File path: assets/icons/ic_video.svg
  SvgGenImage get icVideo => const SvgGenImage('assets/icons/ic_video.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    icCompelteTest,
    icCompleteLesson,
    icHome,
    icPencil,
    icProfile,
    icRank,
    icSetting,
    icStart,
    icVideo,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/arrow-left.svg
  SvgGenImage get arrowLeft =>
      const SvgGenImage('assets/images/arrow-left.svg');

  /// File path: assets/images/ic_main_svg.svg
  SvgGenImage get icMainSvg =>
      const SvgGenImage('assets/images/ic_main_svg.svg');

  /// File path: assets/images/ic_ok_check.svg
  SvgGenImage get icOkCheck =>
      const SvgGenImage('assets/images/ic_ok_check.svg');

  /// File path: assets/images/ic_place.svg
  SvgGenImage get icPlace => const SvgGenImage('assets/images/ic_place.svg');

  /// File path: assets/images/ic_place_2.svg
  SvgGenImage get icPlace2 => const SvgGenImage('assets/images/ic_place_2.svg');

  /// File path: assets/images/ic_star.svg
  SvgGenImage get icStar => const SvgGenImage('assets/images/ic_star.svg');

  /// File path: assets/images/img_enot_profile.png
  AssetGenImage get imgEnotProfile =>
      const AssetGenImage('assets/images/img_enot_profile.png');

  /// File path: assets/images/onboard1.svg
  SvgGenImage get onboard1 => const SvgGenImage('assets/images/onboard1.svg');

  /// File path: assets/images/splash_screen1.png
  AssetGenImage get splashScreen1 =>
      const AssetGenImage('assets/images/splash_screen1.png');

  /// List of all assets
  List<dynamic> get values => [
    arrowLeft,
    icMainSvg,
    icOkCheck,
    icPlace,
    icPlace2,
    icStar,
    imgEnotProfile,
    onboard1,
    splashScreen1,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
