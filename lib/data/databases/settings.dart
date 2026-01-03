/// Library Settings is used to store global settings for the entire program.
/// This library utilizes the Hive package to persist these settings from session to session.
/// In the case that the user hasn't changed a setting, this library provides a default value.
library settings;

import "package:hive_ce/hive.dart";
import 'package:hive_ce_flutter/hive_flutter.dart';

// Defaults section
String _boxName = "globalSettings";
bool _defaultDarkMode = false;
String _defaultStoragePath = "./storage/";

double _maxAllowedRam = 10240.0;
double _minAllowedRam = 2048.0;

double _defaultMaxRam = 4096.0;
double _defaultMinRam = 2048.0;

// Get the box
Box get _box => Hive.box(_boxName);

// Getters and setters
// darkMode
bool get darkMode => _box.get("darkMode", defaultValue: _defaultDarkMode);
set darkMode(bool value) => _box.put("darkMode", value);

// Storage path for server files
String get serverPath =>
    _box.get("serverPath", defaultValue: "$_defaultStoragePath/servers/");
set serverPath(String value) => _box.put("serverPath", value);

// Storage path for backups
String get backupsPath =>
    _box.get("backupsPath", defaultValue: "$_defaultStoragePath/backups/");
set backupsPath(String value) => _box.put("backupsPath", value);

// Maximum possible RAM that can be allocated to a single server.
// This is used to set the upper limit of the RAM slider in the global settings page.
get maxAllowedRam => _maxAllowedRam;

// The minimum possible amount of RAM that can be allocated to a single server.
// This is used to set the lower limit of the RAM slider in the global settings page.
get minAllowedRam => _minAllowedRam;

// The default maximum RAM allocated to new servers. Per server settings can override this.
double get defaultMaxRam =>
    _box.get("defaultMaxRam", defaultValue: _defaultMaxRam);
set defaultMaxRam(double value) {
  (value > defaultMinRam) ? value = value : defaultMinRam;
  _box.put("defaultMaxRam", value);
}

// The default minimum RAM allocated to new servers. Per server settings can override this.
double get defaultMinRam =>
    _box.get("defaultMinRam", defaultValue: _defaultMinRam);
set defaultMinRam(double value) {
  (value < defaultMinRam) ? value = value : defaultMaxRam;
  _box.put("defaultMinRam", value);
}
