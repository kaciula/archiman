class ResponsiveHeightBreakpoints {
  ResponsiveHeightBreakpoints({
    // Phone-like screen heights
    this.minHeight320 = 320,
    this.minHeight375 = 375,
    this.minHeight414 = 414,
    this.minHeight480 = 480,

    // Tablet-like screen heights
    this.minHeight600 = 600,
    this.minHeight768 = 768,
    this.minHeight850 = 850,
    this.minHeight900 = 900,

    // Desktop-like screen heights
    this.minHeight950 = 950,
    this.minHeight1920 = 1920,
    this.minHeight3840 = 3840,
    this.minHeight4096 = 4096,
  });

  // Phone-like screen heights
  final double minHeight320;
  final double minHeight375;
  final double minHeight414;
  final double minHeight480;

  // Tablet-like screen heights
  final double minHeight600;
  final double minHeight768;
  final double minHeight850;
  final double minHeight900;

  // Desktop-like screen heights
  final double minHeight950;
  final double minHeight1920;
  final double minHeight3840;
  final double minHeight4096;
}
