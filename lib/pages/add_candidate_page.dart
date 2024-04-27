import 'package:flutter/material.dart';
import '../models/candidate.dart';
import '../pages/strings.dart';

class AddCandidatePage extends StatefulWidget {
  @override
  _AddCandidatePageState createState() => _AddCandidatePageState();
}

class _AddCandidatePageState extends State<AddCandidatePage> {
  final _formKey = GlobalKey<FormState>();

  // Contrôleurs pour les champs du formulaire
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.addCandidateTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: Strings.firstNameLabel),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.requiredFieldError;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: Strings.lastNameLabel),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.requiredFieldError;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: Strings.imageUrlLabel),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.requiredFieldError;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              if (_imageUrlController.text.isNotEmpty)
                Image.network(_imageUrlController.text),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: Strings.descriptionLabel),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.requiredFieldError;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Candidate newCandidate = Candidate(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      imageUrl: _imageUrlController.text,
                      description: _descriptionController.text,
                    );
                    Navigator.pop(context, newCandidate);
                  }
                },
                child: Text(Strings.saveButtonLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
