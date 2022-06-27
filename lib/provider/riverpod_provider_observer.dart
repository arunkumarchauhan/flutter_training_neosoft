import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print(
        '''didUpdateProvider : {"provider": "${provider.name ?? provider.runtimeType}",
    "newValue": "$newValue"}''');
  }

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('''didAddProvider : 
    {"provider: ${provider.name ?? provider.runtimeType} , Value : ${value} ProviderContainer : ${container} "}
    ''');
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer containers,
  ) {
    print('''didDisposeProvider : 
    {"provider: ${provider.name ?? provider.runtimeType} ,ProviderContainer : ${containers} "}
    ''');
  }
}
