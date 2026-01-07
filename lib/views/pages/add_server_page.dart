import 'package:flutter/material.dart';
import 'package:mine_ui/views/widgets/text.dart';

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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTitleText("Server Details"),
          buildTextField("Server Name"),
          buildTextField("Server Path"),
          CategoryTitleText("RAM Allocation"),
          RangeSlider(
              values: RangeValues(100, 200),
              min: 0,
              max: 1000,
              onChanged: (RangeValues values) {}),
          ElevatedButton(
            onPressed: () {
              _formKey.currentState?.validate();
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}

Widget buildTextField(String labelText) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
  );
}
