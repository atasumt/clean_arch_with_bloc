import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/app/const/design/const_design.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(),
    ),
    scaffoldBackgroundColor: kScaffoldColor,
    textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme)
        .apply(
          bodyColor: Colors.grey,
          displayColor: Colors.grey,
        )
        .copyWith(
          displayLarge: GoogleFonts.nunito(
            textStyle: ThemeData.light().textTheme.displayLarge,
            fontWeight: FontWeight.w900,
            fontSize: 43,
            letterSpacing: 0.86,
            color: kSecondaryColor,
          ),
          titleMedium: GoogleFonts.nunito(
            textStyle: ThemeData.light().textTheme.titleMedium,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            height: 1.1,
            color: kSecondaryColor,
          ),
          titleSmall: GoogleFonts.nunito(
            textStyle: ThemeData.light().textTheme.titleSmall,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 1.1,
            color: kSecondaryColor,
          ),
          bodySmall: GoogleFonts.inter(
            textStyle: ThemeData.light().textTheme.bodySmall,
            fontWeight: FontWeight.w400,
            fontSize: 15,
            height: 1.1,
            color: kSecondaryColor,
          ),
          labelLarge: GoogleFonts.nunito(
            textStyle: ThemeData.light().textTheme.labelLarge,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
    primaryColor: kPrimaryColor,
    chipTheme: ChipThemeData(
      checkmarkColor: Colors.white,
      selectedColor: Theme.of(context).primaryColor,
      brightness: Theme.of(context).brightness,
      secondarySelectedColor: Theme.of(context).primaryColor,
      selectedShadowColor: Colors.white,
      shadowColor: Colors.white,
      padding: const EdgeInsets.all(0),
      labelStyle: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      secondaryLabelStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 18),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return kSecondaryColor;
          }

          return kPrimaryColor;
        },
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      side: MaterialStateProperty.all(const BorderSide(
        color: kSecondaryColor,
      )),
      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: const BorderSide(
            color: kSecondaryColor,
          ))),
    )),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(Colors.grey),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Theme.of(context).primaryColor;
        }
        return Colors.grey;
      }),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF13B9FF),
    ),
    dialogTheme: DialogTheme(
        titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: kSecondaryColor),
        contentTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: kSecondaryColor)),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(kPrimaryColor),
      checkColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(kSecondaryColor),
      side: const BorderSide(width: 2, color: kThirdColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
