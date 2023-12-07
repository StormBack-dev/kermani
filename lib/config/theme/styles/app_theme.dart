import 'package:flutter/material.dart';
import 'package:kermani/config/theme/styles/app_size.dart';
import 'package:kermani/core/data/model/app_theme.dart';
import 'package:kermani/features/settings/data/dto/font_family.dart';

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData.light().copyWith(
    
    // colorScheme: lightColorScheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    cardColor: Colors.white,
    hintColor: Colors.grey[500],
    appBarTheme: const AppBarTheme(color: Color(0xffff5757)),
    scaffoldBackgroundColor: const Color(0xffff5757),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xffff5757),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
    // focusColor: Colors.amber[300],
    // chipTheme: ChipThemeData.fromDefaults(
    //   secondaryColor: Colors.white70,
    //   brightness: Brightness.light,
    //   labelStyle: getTextStyle(
    //     fontSize: mediumSize,
    //     color: const Color(0xff0369E7),
    //   ),
    // ),
    // checkboxTheme: CheckboxThemeData(
    //   fillColor: MaterialStateProperty.resolveWith(
    //     (states) {
    //       if (states.contains(MaterialState.disabled)) return Colors.grey[400];
    //       if (states.contains(MaterialState.selected)) return const Color(0xff0369E7);
    //       return Colors.grey[800];
    //     },
    //   ),
    // ),
    // scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: getTextStyle(fontSize: xxLargeSize,fontFamily: FontFamily.yekanBakh.name),
      displayMedium: getTextStyle(fontSize: xxLargeSize,fontFamily: FontFamily.yekanBakh.name),
      displaySmall: getTextStyle(fontSize: xLargeSize,fontFamily: FontFamily.yekanBakh.name),
      headlineMedium: getTextStyle(fontSize: xLargeSize,fontFamily: FontFamily.yekanBakh.name),
      headlineSmall: getTextStyle(fontSize: xLargeSize,fontFamily: FontFamily.yekanBakh.name),
      titleLarge: getTextStyle(fontSize: xLargeSize,fontFamily: FontFamily.yekanBakh.name),
      titleMedium: getTextStyle(
        fontSize: normalSize,
        fontWeight: FontWeight.bold,
        color: const Color(0xff0369E7),
        fontFamily: FontFamily.yekanBakh.name
      ),
      titleSmall: getTextStyle(fontSize: smallSize,fontFamily: FontFamily.yekanBakh.name),
      bodyLarge: getTextStyle(fontSize: mediumSize, color: Colors.black87,fontFamily: FontFamily.yekanBakh.name),
      bodyMedium: getTextStyle(fontSize: mediumSize, color: Colors.black87,fontFamily: FontFamily.yekanBakh.name),
    ).apply(displayColor: Colors.black87,fontFamily: FontFamily.yekanBakh.name),
    iconTheme: const IconThemeData(color: Colors.white),
    shadowColor: Colors.grey.withOpacity(0.5),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    dividerTheme: const DividerThemeData(color: Colors.grey),
    // inputDecorationTheme: InputDecorationTheme(
    //   fillColor: Colors.grey[100],
    //   border: InputBorder.none,
    //   focusedBorder: InputBorder.none,
    //   enabledBorder: InputBorder.none,
    //   errorBorder: InputBorder.none,
    //   disabledBorder: InputBorder.none,
    //   hintStyle: getTextStyle(color: Colors.grey),
    // ),
    dialogTheme: DialogTheme(
      titleTextStyle: getTextStyle(),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          primary: const Color(0xFFBE044D),
          primaryContainer: Colors.grey[900],
          background: const Color(0xffffffff),
          secondaryContainer: const Color(0xFFDE766F),
          secondary: const Color(0xFFFD867E),
          onPrimary: Colors.white,
          onBackground: Colors.black87,
          error: Colors.redAccent,
          surface: Colors.white,
          onSurface: Colors.black87,
        )
        .copyWith(background: Colors.white),
  ),
  AppTheme.dark: ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    // primarySwatch: DarkColors.primarySwatchColor,
    // scaffoldBackgroundColor: Colors.grey[800],
    textTheme: TextTheme(
      displayLarge: getTextStyle(fontSize: xxLargeSize),
      displayMedium: getTextStyle(fontSize: xxLargeSize),
      displaySmall: getTextStyle(fontSize: xLargeSize),
      headlineMedium: getTextStyle(fontSize: xLargeSize),
      headlineSmall: getTextStyle(fontSize: xLargeSize),
      titleLarge: getTextStyle(fontSize: xLargeSize),
      titleMedium: getTextStyle(fontSize: normalSize),
      titleSmall: getTextStyle(fontSize: smallSize),
      bodyLarge: getTextStyle(fontSize: mediumSize),
      bodyMedium: getTextStyle(fontSize: mediumSize),
    ),
    dividerTheme: const DividerThemeData(color: Colors.grey),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) return Colors.teal[400]!;
          if (states.contains(MaterialState.disabled)) return Colors.grey[800];
          return Colors.grey;
        },
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.teal[400]!,
      ),
    ),
    chipTheme: ChipThemeData.fromDefaults(
      brightness: Brightness.dark,
      secondaryColor: Colors.teal[400]!,
      labelStyle: getTextStyle(
        fontSize: mediumSize,
        color: const Color(0xffDFB75F),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[800],
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintStyle: getTextStyle(color: Colors.grey),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Color(0xff2D2D2D),
    ),

    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Colors.teal[400]!,
          width: 2,
        ),
      ),
      labelColor: Colors.teal[400]!,
      unselectedLabelColor: Colors.white70,
      // labelStyle: getTextStyle(
      //   fontFamily: FontFamily.adobeArabicBold.name,
      //   fontSize: FontFamily.adobeArabicBold.getRatio() * mediumSize,
      //   fontWeight: FontWeight.w500,
      // ),
      // unselectedLabelStyle: getTextStyle(
      //   fontFamily: FontFamily.adobeArabic.name,
      //   fontSize: FontFamily.adobeArabicBold.getRatio() * mediumSize,
      //   fontWeight: FontWeight.normal,
      // ),
      // labelPadding: EdgeInsets.zero,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xff2D2D2D),
    ),

    iconTheme: const IconThemeData(color: Colors.white70),
    dividerColor: Colors.grey[800],
    // toggleableActiveColor: const Color(0xffDFB75F),
    toggleButtonsTheme: ToggleButtonsThemeData(
      selectedColor: const Color(0xffDFB75F),
      fillColor: const Color(0xffDFB75F).withOpacity(.1),
    ),

    drawerTheme: const DrawerThemeData(),
    cardTheme: const CardTheme(color: Color(0xff2D2D2D)),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xff2D2D2D),
      contentTextStyle: getTextStyle(),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.teal[400]!,
      primaryContainer: Colors.teal[400]!,
      background: const Color(0xff121212),
      secondaryContainer: const Color(0xFF98824C),
      secondary: const Color(0xffDFB75F),
      onPrimary: Colors.black87,
      onBackground: Colors.white.withOpacity(.8),
      error: Colors.redAccent,
      surface: const Color(0xff2D2D2D),
      onSurface: Colors.white.withOpacity(.8),
    ),
    highlightColor: Colors.amber.withOpacity(.2),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xff2D2D2D),
    ),
  ),
};
