import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(FormApp());
}

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormPage(),
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.red.shade50,
      ),
            debugShowCheckedModeBanner: false, 
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  // State variables
  List<String> _textFieldValues = List<String>.filled(9, '');
  String _selectedGender = '';
  List<String> _selectedOptions = List<String>.filled(4, '');
  String _selectedEightOption = '';
  String _fileName = 'No file selected';
  DateTime? _selectedDate;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileName = file.name;
      });
    }
  }

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Handle form submission
      print('Text Fields: $_textFieldValues');
      print('Gender: $_selectedGender');
      print('Options: $_selectedOptions');
      print('Eight Option: $_selectedEightOption');
      print('File: $_fileName');
      print('Date: ${_selectedDate != null ? DateFormat('yyyy-MM-dd').format(_selectedDate!) : 'No date selected'}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donor Registration', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Blood Donor Registration', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Divider(),
              // First group of text fields
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email ID:'),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter your email ID'),
                      onSaved: (value) => _textFieldValues[0] = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email ID';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name of the Donor:'),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter your name'),
                      onSaved: (value) => _textFieldValues[1] = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('USN:'),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter your USN'),
                      onSaved: (value) => _textFieldValues[2] = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your USN';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Donor Age:'),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter your age'),
                      onSaved: (value) => _textFieldValues[3] = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Donor Blood Group:', style: TextStyle(fontSize: 18)),
              ),
              RadioListTile(
                title: Text('A RhD positive (A+)'),
                value: 'A+',
                groupValue: _selectedEightOption,
                onChanged: (value) {
                  setState(() {
                    _selectedEightOption = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('A RhD negative (A-)'),
                value: 'A-',
                groupValue: _selectedEightOption,
                onChanged: (value) {
                  setState(() {
                    _selectedEightOption = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('B RhD positive (B+)'),
                value: 'B+',
                groupValue: _selectedEightOption,
                onChanged: (value) {
                  setState(() {
                    _selectedEightOption = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('B RhD negative (B-)'),
                value: 'B-',
                groupValue: _selectedEightOption,
                onChanged: (value) {
                  setState(() {
                    _selectedEightOption = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('O RhD positive (O+)'),
                value: 'O+',
                groupValue: _selectedEightOption,
                onChanged: (value) {
                  setState(() {
                    _selectedEightOption = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('O RhD negative (O-)'),
                value: 'O-',
                groupValue: _selectedEightOption,
                onChanged: (value) {
                  setState(() {
                    _selectedEightOption = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('AB RhD positive (AB+)'),
                value: 'AB+',
                groupValue: _selectedEightOption,
                onChanged: (value) {
                  setState(() {
                    _selectedEightOption = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('AB RhD negative (AB-)'),
                value: 'AB-',
                groupValue: _selectedEightOption,
                onChanged: (value) {
                  setState(() {
                    _selectedEightOption = value ?? '';
                  });
                },
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Donor Gender:', style: TextStyle(fontSize: 18)),
              ),
              RadioListTile(
                title: Text('Male'),
                value: 'Male',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('Female'),
                value: 'Female',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('Non-Binary'),
                value: 'Non-Binary',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value ?? '';
                  });
                },
              ),
              Divider(),
              // Second group of text fields
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Donor Mobile Number:'),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter your mobile number'),
                      onSaved: (value) => _textFieldValues[4] = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Donor Additional Mobile Number:'),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter an additional mobile number'),
                      onSaved: (value) => _textFieldValues[5] = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an additional mobile number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address Pin Code:'),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter your address pin code'),
                      onSaved: (value) => _textFieldValues[6] = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address pin code';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Have you donated platelets?', style: TextStyle(fontSize: 18)),
              ),
              RadioListTile(
                title: Text('Yes'),
                value: 'Yes',
                groupValue: _selectedOptions[0],
                onChanged: (value) {
                  setState(() {
                    _selectedOptions[0] = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('No'),
                value: 'No',
                groupValue: _selectedOptions[0],
                onChanged: (value) {
                  setState(() {
                    _selectedOptions[0] = value ?? '';
                  });
                },
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Number of Donations:'),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter the number of donations'),
                      onSaved: (value) => _textFieldValues[7] = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the number of donations';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Are you under any medical condition?', style: TextStyle(fontSize: 18)),
              ),
              RadioListTile(
                title: Text('Yes'),
                value: 'Yes',
                groupValue: _selectedOptions[1],
                onChanged: (value) {
                  setState(() {
                    _selectedOptions[1] = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('No'),
                value: 'No',
                groupValue: _selectedOptions[1],
                onChanged: (value) {
                  setState(() {
                    _selectedOptions[1] = value ?? '';
                  });
                },
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Drinking and smoking?', style: TextStyle(fontSize: 18)),
              ),
              RadioListTile(
                title: Text('Yes'),
                value: 'Yes',
                groupValue: _selectedOptions[2],
                onChanged: (value) {
                  setState(() {
                    _selectedOptions[2] = value ?? '';
                  });
                },
              ),
              RadioListTile(
                title: Text('No'),
                value: 'No',
                groupValue: _selectedOptions[2],
                onChanged: (value) {
                  setState(() {
                    _selectedOptions[2] = value ?? '';
                  });
                },
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Write a few lines about your blood donation experience:', style: TextStyle(fontSize: 18)),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter your experience'),
                maxLines: 3,
                onSaved: (value) => _textFieldValues[8] = value ?? '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your experience';
                  }
                  return null;
                },
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Upload Blood Donation Photo (for activity points):', style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: _pickFile,
                child: Text('Pick a file'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              Text(_fileName),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Select Donation Date:', style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: _pickDate,
                child: Text('Pick a date'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              Text(_selectedDate != null ? DateFormat('yyyy-MM-dd').format(_selectedDate!) : 'No date selected'),
              Divider(),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
