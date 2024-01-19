import 'package:taro_leaf_blight/packages/packages.dart';

class CustomTextStyle {
  static const TextStyle textextraBold24 = TextStyle(
    fontSize: 24,
  );
  static const TextStyle textbold24 = TextStyle(
    fontSize: 24,
  );
  static const TextStyle textxLarge20 = TextStyle(
    fontSize: 20,
  );
  static const TextStyle textlarge18 = TextStyle(
    fontSize: 18,
  );
  static const TextStyle textmedium16 = TextStyle(
    fontSize: 16,
  );
  static const TextStyle textsmall14 = TextStyle(
    fontSize: 14,
  );
  static const TextStyle textxSmall12 = TextStyle(
    fontSize: 12,
  );
  static const TextStyle texttiny10 = TextStyle(
    fontSize: 10,
  );

  static const TextStyle label2XLXBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: 'EudoxusSans',
    letterSpacing: -0.50,
    color: AppColors.baseBlack,
  );

  static const TextStyle labelXLXBold = TextStyle(
    fontSize: 20,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w800,
    letterSpacing: -0.50,
    color: AppColors.baseBlack,
  );

  static const TextStyle labelLXBold = TextStyle(
    fontSize: 18,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w800,
    letterSpacing: -0.50,
    color: AppColors.baseBlack,
  );

  static const TextStyle label2XLBold = TextStyle(
    fontSize: 24,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w700,
    color: AppColors.baseBlack,
  );

  static const TextStyle labelXLBold = TextStyle(
    fontSize: 20,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w700,
    color: AppColors.baseBlack,
  );

  static const TextStyle labelLBold = TextStyle(
    fontSize: 18,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w700,
    color: AppColors.baseBlack,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w700,
    color: AppColors.baseBlack,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 14,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w700,
    color: AppColors.baseBlack,
  );

  static const TextStyle labelXSmall = TextStyle(
    fontSize: 12,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w700,
    color: AppColors.baseBlack,
  );

  static const TextStyle subtitleLarge = TextStyle(
    fontSize: 18,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w500,
    color: AppColors.baseBlack,
  );

  static const TextStyle subtitleMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w500,
    color: AppColors.baseBlack,
  );

  static const TextStyle subtitleSmall = TextStyle(
    fontSize: 14,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w500,
    color: AppColors.baseBlack,
  );

  static const TextStyle subtitleXSmall = TextStyle(
    fontSize: 12,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w500,
    color: AppColors.baseBlack,
  );

  static const TextStyle paragraphLarge = TextStyle(
    fontSize: 18,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w400,
    color: AppColors.baseBlack,
  );

  static const TextStyle paragraphMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w400,
    color: AppColors.baseBlack,
  );

  static const TextStyle paragraphSmall = TextStyle(
    fontSize: 14,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w400,
    color: AppColors.baseBlack,
  );

  static const TextStyle paragraphXSmall = TextStyle(
    fontSize: 12,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w400,
    color: AppColors.baseBlack,
  );

  static const TextStyle paragraphTiny = TextStyle(
    fontSize: 10,
    fontFamily: 'EudoxusSans',
    fontWeight: FontWeight.w400,
    color: AppColors.baseBlack,
  );
}

extension TextStyleExtensions on TextStyle {
  /// w700
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  /// w700
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  /// w400
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  ///w300
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);

  /// w500
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  /// w600
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);

  /// black
  TextStyle get black {
    return copyWith(color: Colors.black);
  }

  /// white
  TextStyle get white {
    return copyWith(color: Colors.white);
  }

  /// With color
  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }

  /// With color hex
  TextStyle withColorHex(int color) {
    return copyWith(color: Color(color));
  }

  /// With size
  TextStyle withSize(double size) {
    return copyWith(fontSize: size);
  }

  /// With weight
  TextStyle withWeight(FontWeight weight) {
    return copyWith(fontWeight: weight);
  }

  /// Heading font (Career)
  TextStyle get careerHeading => copyWith(fontFamily: 'Career');

  /// Body font (General Sans)
  TextStyle get generalSansBody => copyWith(fontFamily: 'GeneralSans');
}
