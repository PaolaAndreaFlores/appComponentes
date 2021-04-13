import 'package:flutter/cupertino.dart';

class GlobalSobLocalizations{
  final String localeName;

  GlobalSobLocalizations( this.localeName );
  static const LocalizationsDelegate<GlobalSobLocalizations> delegate = _GlobalSobLocalizationsDelegate();

  String get emptyList{
    switch (localeName) {
      case 'en': return 'From..';
      break;
      case 'pt': return 'Para fora..';
      break;
      case 'zh': return '从..';
      break;
      default: return 'Desde..' ;
    }
  }
}

class _GlobalSobLocalizationsDelegate extends LocalizationsDelegate<GlobalSobLocalizations>{
  const _GlobalSobLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return [ 'en', 'pt', 'zh', 'es' ].contains(locale.languageCode);
  }

  @override
  Future<GlobalSobLocalizations> load(Locale locale) async{
    return GlobalSobLocalizations(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<GlobalSobLocalizations> old) {
    return false;
  }

}