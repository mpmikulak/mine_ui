// Class Server is used to represent a server configuration.
// It stores information such as the server's name, file path, and RAM allocation.

import 'package:hive_ce/hive.dart';

class Server {
  String name = "";
  String path = "";
  double minRam = 0.0;
  double maxRam = 0.0;

  Server({
    required this.name,
    required this.path,
    required this.minRam,
    required this.maxRam,
  });
}

// Class ServerAdapter is a Hive TypeAdapter for the Server class.
class ServerAdapter extends TypeAdapter<Server> {
  @override
  final int typeId = 0;

  @override
  Server read(BinaryReader reader) {
    return Server(
      name: reader.readString(),
      path: reader.readString(),
      minRam: reader.readDouble(),
      maxRam: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Server server) {
    writer.writeString(server.name);
    writer.writeString(server.path);
    writer.writeDouble(server.minRam);
    writer.writeDouble(server.maxRam);
  }
}
