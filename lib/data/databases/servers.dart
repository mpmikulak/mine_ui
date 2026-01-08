/// A library that is used to store, retrieve and update
/// server configurations. This library utilizes the Hive
/// package to persist server data from session to session.
library servers;

import "package:hive_ce/hive.dart";
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mine_ui/data/server.dart';

String _boxName = "servers";

Box get _box => Hive.box(_boxName);

// TODO: Change to return a List<String>
List<dynamic> get serverList => _box.values.toList();

/// Adds a new server to the database. This uses the server name
/// as the key and the server object as the value.
void addServer(String name, Server server) {
  _box.put(name, server);
}

/// Removes a single server from the database.
void removeServer(String name) {
  _box.delete(name);
}

/// Clears all servers from the database.
void clearServers() {
  _box.clear();
}

/// Retrieves a list of all server names stored in the database.
List<String> getServerNames() {
  return _box.keys.cast<String>().toList();
}
