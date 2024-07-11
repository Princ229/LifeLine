import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class ProfileSetupScreen extends StatefulWidget {
  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _sexe;
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _dateNaissanceController = TextEditingController();
  TextEditingController _adresseController = TextEditingController();
  TextEditingController _villeController = TextEditingController();
  TextEditingController _codePostalController = TextEditingController();
  TextEditingController _telephoneController = TextEditingController();
  TextEditingController _groupeSanguinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  'Configurez votre profil',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildTextField(_nomController, 'Nom'),
                _buildTextField(_prenomController, 'Prénom'),
                _buildDropdown(),
                _buildTextField(_dateNaissanceController, 'Date de naissance'),
                _buildTextField(_adresseController, 'Adresse'),
                _buildTextField(_villeController, 'Ville'),
                _buildTextField(_codePostalController, 'Code postal'),
                _buildTextField(_telephoneController, 'Téléphone'),
                _buildTextField(_groupeSanguinController, 'Groupe sanguin'),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Enregistrer',
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez remplir ce champ';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown() {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
        value: _sexe,
        decoration: InputDecoration(
          labelText: 'Sexe',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: ['Homme', 'Femme', 'Autre']
            .map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _sexe = value;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez sélectionner une option';
          }
          return null;
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Ici, vous pouvez ajouter la logique pour sauvegarder les informations du profil
      // Par exemple, les envoyer à votre base de données
      print('Formulaire valide, données à sauvegarder');
      // Naviguer vers l'écran suivant après la sauvegarde
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
