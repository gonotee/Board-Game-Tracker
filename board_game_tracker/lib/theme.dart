// ignore_for_file: use_full_hex_values_for_flutter_colors

import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4287581235),
      surfaceTint: Color(4287581235),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294958031),
      onPrimaryContainer: Color(4281863424),
      secondary: Color(4286011212),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294958031),
      onSecondaryContainer: Color(4281079309),
      tertiary: Color(4285095471),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294107816),
      onTertiaryContainer: Color(4280359680),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294965494),
      onBackground: Color(4280490518),
      surface: Color(4294965494),
      onSurface: Color(4280490518),
      surfaceVariant: Color(4294303446),
      onSurfaceVariant: Color(4283646782),
      outline: Color(4286935917),
      outlineVariant: Color(4292395707),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937451),
      inverseOnSurface: Color(4294962663),
      inversePrimary: Color(4294948251),
      primaryFixed: Color(4294958031),
      onPrimaryFixed: Color(4281863424),
      primaryFixedDim: Color(4294948251),
      onPrimaryFixedVariant: Color(4285675038),
      secondaryFixed: Color(4294958031),
      onSecondaryFixed: Color(4281079309),
      secondaryFixedDim: Color(4293377711),
      onSecondaryFixedVariant: Color(4284301365),
      tertiaryFixed: Color(4294107816),
      onTertiaryFixed: Color(4280359680),
      tertiaryFixedDim: Color(4292200078),
      onTertiaryFixedVariant: Color(4283451162),
      surfaceDim: Color(4293449425),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963692),
      surfaceContainer: Color(4294765284),
      surfaceContainerHigh: Color(4294436063),
      surfaceContainerHighest: Color(4294041561),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4285346331),
      surfaceTint: Color(4287581235),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289290823),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284038194),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287589729),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283187991),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286608451),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294965494),
      onBackground: Color(4280490518),
      surface: Color(4294965494),
      onSurface: Color(4280490518),
      surfaceVariant: Color(4294303446),
      onSurfaceVariant: Color(4283318330),
      outline: Color(4285291350),
      outlineVariant: Color(4287199089),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937451),
      inverseOnSurface: Color(4294962663),
      inversePrimary: Color(4294948251),
      primaryFixed: Color(4289290823),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287384113),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287589729),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285814089),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286608451),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284898349),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449425),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963692),
      surfaceContainer: Color(4294765284),
      surfaceContainerHigh: Color(4294436063),
      surfaceContainerHighest: Color(4294041561),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282520065),
      surfaceTint: Color(4287581235),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285346331),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281605139),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284038194),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280885760),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283187991),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294965494),
      onBackground: Color(4280490518),
      surface: Color(4294965494),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4294303446),
      onSurfaceVariant: Color(4281213213),
      outline: Color(4283318330),
      outlineVariant: Color(4283318330),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937451),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4294961119),
      primaryFixed: Color(4285346331),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283440135),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284038194),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282394141),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283187991),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281674755),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449425),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963692),
      surfaceContainer: Color(4294765284),
      surfaceContainerHigh: Color(4294436063),
      surfaceContainerHighest: Color(4294041561),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294948251),
      surfaceTint: Color(4294948251),
      onPrimary: Color(4283768842),
      primaryContainer: Color(4285675038),
      onPrimaryContainer: Color(4294958031),
      secondary: Color(4293377711),
      onSecondary: Color(4282657313),
      secondaryContainer: Color(4284301365),
      onSecondaryContainer: Color(4294958031),
      tertiary: Color(4292200078),
      onTertiary: Color(4281937925),
      tertiaryContainer: Color(4283451162),
      onTertiaryContainer: Color(4294107816),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279898382),
      onBackground: Color(4294041561),
      surface: Color(4279898382),
      onSurface: Color(4294041561),
      surfaceVariant: Color(4283646782),
      onSurfaceVariant: Color(4292395707),
      outline: Color(4288712070),
      outlineVariant: Color(4283646782),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041561),
      inverseOnSurface: Color(4281937451),
      inversePrimary: Color(4287581235),
      primaryFixed: Color(4294958031),
      onPrimaryFixed: Color(4281863424),
      primaryFixedDim: Color(4294948251),
      onPrimaryFixedVariant: Color(4285675038),
      secondaryFixed: Color(4294958031),
      onSecondaryFixed: Color(4281079309),
      secondaryFixedDim: Color(4293377711),
      onSecondaryFixedVariant: Color(4284301365),
      tertiaryFixed: Color(4294107816),
      onTertiaryFixed: Color(4280359680),
      tertiaryFixedDim: Color(4292200078),
      onTertiaryFixedVariant: Color(4283451162),
      surfaceDim: Color(4279898382),
      surfaceBright: Color(4282529587),
      surfaceContainerLowest: Color(4279503881),
      surfaceContainerLow: Color(4280490518),
      surfaceContainer: Color(4280753434),
      surfaceContainerHigh: Color(4281477156),
      surfaceContainerHighest: Color(4282200623),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294949795),
      surfaceTint: Color(4294948251),
      onPrimary: Color(4281272832),
      primaryContainer: Color(4291525984),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293640884),
      onSecondary: Color(4280684808),
      secondaryContainer: Color(4289563004),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4292463506),
      onTertiary: Color(4279965184),
      tertiaryContainer: Color(4288516445),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279898382),
      onBackground: Color(4294041561),
      surface: Color(4279898382),
      onSurface: Color(4294965752),
      surfaceVariant: Color(4283646782),
      onSurfaceVariant: Color(4292658879),
      outline: Color(4289961880),
      outlineVariant: Color(4287790969),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041561),
      inverseOnSurface: Color(4281477156),
      inversePrimary: Color(4285740831),
      primaryFixed: Color(4294958031),
      onPrimaryFixed: Color(4280682240),
      primaryFixedDim: Color(4294948251),
      onPrimaryFixedVariant: Color(4284294671),
      secondaryFixed: Color(4294958031),
      onSecondaryFixed: Color(4280290309),
      secondaryFixedDim: Color(4293377711),
      onSecondaryFixedVariant: Color(4283052070),
      tertiaryFixed: Color(4294107816),
      onTertiaryFixed: Color(4279636224),
      tertiaryFixedDim: Color(4292200078),
      onTertiaryFixedVariant: Color(4282332683),
      surfaceDim: Color(4279898382),
      surfaceBright: Color(4282529587),
      surfaceContainerLowest: Color(4279503881),
      surfaceContainerLow: Color(4280490518),
      surfaceContainer: Color(4280753434),
      surfaceContainerHigh: Color(4281477156),
      surfaceContainerHighest: Color(4282200623),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294965752),
      surfaceTint: Color(4294948251),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949795),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965752),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293640884),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966005),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292463506),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279898382),
      onBackground: Color(4294041561),
      surface: Color(4279898382),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4283646782),
      onSurfaceVariant: Color(4294965752),
      outline: Color(4292658879),
      outlineVariant: Color(4292658879),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041561),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4283243013),
      primaryFixed: Color(4294959318),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949795),
      onPrimaryFixedVariant: Color(4281272832),
      secondaryFixed: Color(4294959318),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293640884),
      onSecondaryFixedVariant: Color(4280684808),
      tertiaryFixed: Color(4294371244),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4292463506),
      onTertiaryFixedVariant: Color(4279965184),
      surfaceDim: Color(4279898382),
      surfaceBright: Color(4282529587),
      surfaceContainerLowest: Color(4279503881),
      surfaceContainerLow: Color(4280490518),
      surfaceContainer: Color(4280753434),
      surfaceContainerHigh: Color(4281477156),
      surfaceContainerHighest: Color(4282200623),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
