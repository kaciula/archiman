class ResponsiveBreakpoints {
  ResponsiveBreakpoints({
    // Phone-like screen widths
    this.phoneLikeSmall = 320,
    this.phoneLikeMedium = 375,
    this.phoneLikeLarge = 414,
    this.phoneLikeExtraLarge = 480,

    // Tablet-like screen widths
    this.tabletLikeSmall = 600,
    this.tabletLikeMedium = 768,
    this.tabletLikeLarge = 850,
    this.tabletLikeExtraLarge = 900,

    // Desktop-like screen widths
    this.desktopLikeSmall = 950,
    this.desktopLikeMedium = 1920,
    this.desktopLikeLarge = 3840,
    this.desktopLikeExtraLarge = 4096,
  });

  // Phone-like screen widths
  final double phoneLikeSmall;
  final double phoneLikeMedium;
  final double phoneLikeLarge;
  final double phoneLikeExtraLarge;

  // Tablet-like screen widths
  final double tabletLikeSmall;
  final double tabletLikeMedium;
  final double tabletLikeLarge;
  final double tabletLikeExtraLarge;

  // Desktop-like screen widths
  final double desktopLikeSmall;
  final double desktopLikeMedium;
  final double desktopLikeLarge;
  final double desktopLikeExtraLarge;
}
