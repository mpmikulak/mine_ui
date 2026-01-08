import 'package:flutter/material.dart';

import 'package:mine_ui/views/widgets/text.dart';
import 'package:mine_ui/data/databases/servers.dart' as servers;
import 'package:mine_ui/data/server.dart';

class AddServerPage extends StatelessWidget {
  const AddServerPage({super.key});

  final String name = "New Server";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: NewServerForm(),
    );
  }
}

class NewServerForm extends StatefulWidget {
  const NewServerForm({
    super.key,
  });

  @override
  State<NewServerForm> createState() => _NewServerFormState();
}

class _NewServerFormState extends State<NewServerForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _serverNameController = TextEditingController();

  /// Validates the server name input
  // TODO: Implement proper input validation
  String? _validateServerName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a server name';
    } else if (value.contains(" ")) {
      return 'Server name cannot contain spaces';
    }
    return null;
  }

  /// Creates a new server object from the form inputs, and assumes that
  /// the inputs have already been validated.
  Server createServer() {
    return Server(
      name: _serverNameController.text,
      path: "",
      maxRam: 12.0,
      minRam: 6.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategoryTitleText(text: "Server Details"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _serverNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Server Name',
              ),
              validator: _validateServerName,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                servers.addServer(_serverNameController.text, createServer());
              }
              print(servers.serverList);
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
