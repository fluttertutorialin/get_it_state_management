import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import '../utility/logging.dart';
import '../utility/string_utils.dart';

enum Flavor { DEVELOPMENT, STAGING, RELEASE }

class BuildConfig {
  const BuildConfig._(
      {required this.baseUrl,
      required this.socketUrl,
      required this.connectTimeout,
      required this.receiveTimeout,
      required this.flavor,
      this.color = Colors.blue});

  const BuildConfig._development()
      : this._(
          baseUrl: 'https://api.first.org/data/v1/',
          socketUrl: 'https://api.first.org/data/v1/',
          connectTimeout: 5000,
          receiveTimeout: 5000,
          flavor: Flavor.DEVELOPMENT,
        );

  const BuildConfig._staging()
      : this._(
            baseUrl: 'http://.../',
            socketUrl: '',
            connectTimeout: 5000,
            receiveTimeout: 5000,
            flavor: Flavor.STAGING);

  const BuildConfig._release()
      : this._(
            baseUrl: 'http://.../',
            socketUrl: '',
            connectTimeout: 5000,
            receiveTimeout: 5000,
            flavor: Flavor.RELEASE);

  static BuildConfig? _instance;

  static init({flavor}) {
    if (_instance == null) {
      print('╔══════════════════════════════════════════════════════════════╗');
      print('                    Build Flavor: $flavor                       ');
      print('╚══════════════════════════════════════════════════════════════╝');
      switch (flavor) {
        case 'development':
          _instance = const BuildConfig._development();
          break;
        case 'staging':
          _instance = const BuildConfig._staging();
          break;
        default:
          _instance = const BuildConfig._release();
          break;
      }
    }
    _iniLog(flavor);
    Log.info("BuildConfig", _instance.toString());
  }

  static BuildConfig? get() {
    return _instance;
  }

  static _iniLog(flavor) async {
    await Log.init();
    switch (_instance?.flavor) {
      case Flavor.DEVELOPMENT:
      case Flavor.STAGING:
        Log.setLevel(Level.ALL);
        break;
      case Flavor.RELEASE:
        Log.setLevel(Level.OFF);
        break;
      default:
        break;
    }
  }

  final String baseUrl;
  final String socketUrl;
  final int connectTimeout;
  final int receiveTimeout;
  final Flavor flavor;
  final Color color;

  @override
  String toString() {
    return '{baseUrl: $baseUrl, socketUrl: $socketUrl, connectTimeout: $connectTimeout, receiveTimeout: $receiveTimeout, flavor: $flavor, color: $color}';
  }

  static String flavorName() =>
      StringUtils.enumToName(_instance?.flavor.toString() ?? "");

  static bool isRelease() => _instance?.flavor == Flavor.RELEASE;

  static bool isStaging() => _instance?.flavor == Flavor.STAGING;

  static bool isDevelopment() => _instance?.flavor == Flavor.DEVELOPMENT;
}
