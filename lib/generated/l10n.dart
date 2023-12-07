// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Kermani`
  String get appTitle {
    return Intl.message(
      'Kermani',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Iran Nastaliq`
  String get fontIranNastaliq {
    return Intl.message(
      'Iran Nastaliq',
      name: 'fontIranNastaliq',
      desc: '',
      args: [],
    );
  }

  /// `Iran Yekan`
  String get fontIranYekan {
    return Intl.message(
      'Iran Yekan',
      name: 'fontIranYekan',
      desc: '',
      args: [],
    );
  }

  /// `Bold`
  String get fontBold {
    return Intl.message(
      'Bold',
      name: 'fontBold',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get fontNormal {
    return Intl.message(
      'Normal',
      name: 'fontNormal',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Yekan Bakh`
  String get fontYekanBakh {
    return Intl.message(
      'Yekan Bakh',
      name: 'fontYekanBakh',
      desc: '',
      args: [],
    );
  }

  /// `You do not have an active subscription`
  String get payMessage {
    return Intl.message(
      'You do not have an active subscription',
      name: 'payMessage',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get buttonPay {
    return Intl.message(
      'Pay',
      name: 'buttonPay',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get buttonEdit {
    return Intl.message(
      'Edit',
      name: 'buttonEdit',
      desc: '',
      args: [],
    );
  }

  /// `History Pay`
  String get historyPay {
    return Intl.message(
      'History Pay',
      name: 'historyPay',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number Tow`
  String get phoneNumberTwo {
    return Intl.message(
      'Phone Number Tow',
      name: 'phoneNumberTwo',
      desc: '',
      args: [],
    );
  }

  /// `Phone WhatsApp`
  String get phoneWhatsApp {
    return Intl.message(
      'Phone WhatsApp',
      name: 'phoneWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `ID Skype`
  String get idSkype {
    return Intl.message(
      'ID Skype',
      name: 'idSkype',
      desc: '',
      args: [],
    );
  }

  /// `Not Registered`
  String get notRegistered {
    return Intl.message(
      'Not Registered',
      name: 'notRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Daiet`
  String get daiet {
    return Intl.message(
      'Daiet',
      name: 'daiet',
      desc: '',
      args: [],
    );
  }

  /// `Learning`
  String get learning {
    return Intl.message(
      'Learning',
      name: 'learning',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Abolfazl Ghafuri`
  String get profileName {
    return Intl.message(
      'Abolfazl Ghafuri',
      name: 'profileName',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fa'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
