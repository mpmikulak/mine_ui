class Server {
  String name = "";
  String path;

  Server(this.path, {name}) {
    this.name = name ?? path.split('/').last;
  }
}
