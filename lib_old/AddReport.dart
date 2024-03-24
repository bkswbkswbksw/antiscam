import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class AddReportPage extends StatefulWidget {
  @override
  _AddReportPageState createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {

  List<String> _attachments = [];

// Upload Attachments 
  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'], // Add more extensions as needed
    );
    if (result != null) {
      List<String> paths = result.paths.map((path) => path!).toList();
      setState(() {
        _attachments.addAll(paths);
      });
    }
  }

// Attachment Image Preview
  Widget _buildPreview(int index, String filePath) {
    if (filePath.endsWith('.jpg') || filePath.endsWith('.png')) {
      return Container(
        width: 100, 
        height: 100, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), 
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), 
              spreadRadius: 2, 
              blurRadius: 5, 
              offset: Offset(0, 3), 
            ),
          ],
          color: Colors.white, 
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8), 
              child: Image.file(
                File(filePath),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Text(
                  '${index + 1}', 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (filePath.endsWith('.pdf')) {
      return Text('PDF Preview');
    } else {
      return Text('** Unsupported File Type **', 
        style: TextStyle(
          color: Colors.red, 
          fontWeight: FontWeight.w900, 
          fontSize: 10, 
          fontStyle: FontStyle.italic,
        ),
      );
    }
  }


  int _currentStep = 1;
  TextEditingController _titleController = TextEditingController();
  String? _selectedScamType = '';
  String? _selectedPlatform;
  String? _selectedLocation;
  bool _isCheckedAge = false;
  bool _isCheckedGender = false;
  bool _isCheckedIncome  = false;
  bool _isCheckedOccupation = false;
  bool _isCheckedLocation = false;
  bool _isCheckedEducation  = false;
  bool _isCheckedSocialMedia   = false;
  bool _isCheckedFamilyStatus = false;
  bool _isCheckedOther = false;
  String? _selectedGender;
  int? _selectedAge;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _incomeLevel;
  String? _educationLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Add Report',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '100',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.monetization_on,
                        size: 16,
                        color: Colors.amber, 
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress bar
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 1; i <= 4; i++)
                    StepWidget(
                      stepNumber: i,
                      isActive: i <= _currentStep,
                    ),
                ],
              ),
            ),
            // // Description
            // Text(
            //   _getDescription(_currentStep),
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 16,
            //   ),
            // ),
            // SizedBox(height: 20.0),
            // Title
            if (_currentStep == 1) ...[
              Text(
                '1. Title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 20),
              TextField(
              style: TextStyle(
                fontSize: 13, 
              ),
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none, 
                labelStyle: TextStyle(
                  fontSize: 12, 
                ),
              ),
              maxLines: 2,
            ),
              SizedBox(height: 20.0),
              // Scam Types Radio Buttons
              Text(
                '2. Scam Types',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio(
                    value: 'Online Scam',
                    groupValue: _selectedScamType,
                    onChanged: (value) {
                      setState(() {
                        _selectedScamType = value;
                      });
                    },
                  ),
                  Text('Online Scam'),
                  Radio(
                    value: 'Physical Scam',
                    groupValue: _selectedScamType,
                    onChanged: (value) {
                      setState(() {
                        _selectedScamType = value;
                      });
                    },
                  ),
                  Text('Physical Scam'),
                ],
              ),   
              SizedBox(height: 20.0),
              // Implement Radio buttons for scam types
              // Implement logic to select online or physical scam
                if (_selectedScamType == 'Online Scam') ...[
                  Text('3. Select Platform:', 
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                    width: 400, 
                    child: Center(
                    child: DropdownButtonFormField<String>(
                      value: _selectedPlatform, 
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPlatform = newValue;
                        });
                      },
                      items: <String>['Platform A', 'Platform B', 'Platform C']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Select Platform', 
                        labelStyle: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.normal, 
                              ),
                            ),
                    ),
                  ),
                  )
                ],
                if (_selectedScamType == 'Physical Scam') ...[
                  Text('3. Select Location:', 
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                    width: 400, 
                    child: Center(
                    child: DropdownButtonFormField<String>(
                      value: _selectedLocation, 
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                        });
                      },
                      items: <String>['Location A', 'Location B', 'Location C']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Select Location', 
                        labelStyle: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.normal, 
                              ),
                            ),
                    ),
                  ),
                  )
                ],
              ],
            if (_currentStep == 2) ...[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
                  Text(
                    '3. Scammer\'s Account Number / Phone Number',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: TextStyle(
                      fontSize: 13, 
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Scammer\'s Account Number / Phone Number',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none, 
                      labelStyle: TextStyle(
                        fontSize: 12, 
                      ),
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '4. Scammer\'s Name / Username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  TextField(
                    style: TextStyle(
                      fontSize: 13, 
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Scammer\'s Name / Username',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none, 
                      labelStyle: TextStyle(
                        fontSize: 12, 
                      ),
                    ),
                    maxLines: 2,
                  ),
                ],
            //   ),
            // ],
            // Attachments
            if (_currentStep == 3) ...[
                Text(
                    '5. How it happens',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  TextField(
                    style: TextStyle(
                      fontSize: 13, 
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'How it happens',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none, 
                      labelStyle: TextStyle(
                        fontSize: 12, 
                      ),
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 20.0),
                Text(
                    '6. Why do you think you were targeted?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
      children: [
        CheckboxListTile(
          title: Text('Age', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),

          ),
          value: _isCheckedAge,
          onChanged: (newValue) {
            setState(() {
              _isCheckedAge = newValue!;
            });
          },
        ),
        Visibility(
  visible: _isCheckedAge,
  child: DropdownButton<int>(
    hint: Text('Select Age'),
    value: _selectedAge,
    onChanged: (newValue) {
      setState(() {
        _selectedAge = newValue;
      });
    },
    items: List.generate(100, (index) => index + 1).map((int value) {
      return DropdownMenuItem<int>(
        value: value,
        child: Text(value.toString()),
      );
    }).toList(),
  ),
),

        CheckboxListTile(
          title: Text('Gender', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          value: _isCheckedGender,
          onChanged: (newValue) {
            setState(() {
              _isCheckedGender = newValue!;
               if (!_isCheckedGender) {
        // Reset the selected gender if the checkbox is unchecked
        _selectedGender = null;
      }
            });
          },
        ),
        Visibility(
  visible: _isCheckedGender,
  child: Column(
    children: [
      RadioListTile<String>(
        title: Text('Male', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
        value: 'male',
        groupValue: _selectedGender,
        onChanged: (value) {
          setState(() {
            _selectedGender = value;
          });
        },
      ),
      RadioListTile<String>(
        title: Text('Female', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
        value: 'female',
        groupValue: _selectedGender,
        onChanged: (value) {
          setState(() {
            _selectedGender = value;
          });
        },
      ),
    ],
  ),
),

        CheckboxListTile(
          title: Text('Income Level', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          value: _isCheckedIncome,
          onChanged: (newValue) {
            setState(() {
              _isCheckedIncome = newValue!;
            });
          },
        ),
        Visibility(
      visible: _isCheckedIncome,
      child: Column(
        children: [
          TextField(
              style: TextStyle(
                fontSize: 13, 
              ),
              // controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Income Level',
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none, 
                labelStyle: TextStyle(
                  fontSize: 12, 
                ),
              ),
              maxLines: 2,
            ),

          SizedBox(height: 20.0),
        ],
      ),
    ),
        CheckboxListTile(
          title: Text('Occupation', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          value: _isCheckedOccupation,
          onChanged: (newValue) {
            setState(() {
              _isCheckedOccupation = newValue!;
            });
          },
        ),
        Visibility(
      visible: _isCheckedOccupation,
      child: Column(
        children: [
          TextField(
                    style: TextStyle(
                      fontSize: 13, 
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Occupation',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none, 
                      labelStyle: TextStyle(
                        fontSize: 12, 
                      ),
                    ),
                    maxLines: 2,
                  ),
          SizedBox(height: 20.0),
        ],
      ),
    ),
        
        CheckboxListTile(
          title: Text('Geographic Location', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          value: _isCheckedLocation,
          onChanged: (newValue) {
            setState(() {
              _isCheckedLocation = newValue!;
            });
          },
        ),
        Visibility(
              visible: _isCheckedLocation,
              child: Column(
                children: [
                  SizedBox(height: 20),

                  TextField(
                    style: TextStyle(
                      fontSize: 13, 
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Geographic Location',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none, 
                      labelStyle: TextStyle(
                        fontSize: 12, 
                      ),
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),

        CheckboxListTile(
          title: Text('Education Level', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          value: _isCheckedEducation,
          onChanged: (newValue) {
            setState(() {
              _isCheckedEducation = newValue!;
            });
          },
        ),
        Visibility(
      visible: _isCheckedEducation,
      child: Column(
        children: [
          TextField(
              style: TextStyle(
                fontSize: 13, 
              ),
              // controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Education Level',
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none, 
                labelStyle: TextStyle(
                  fontSize: 12, 
                ),
              ),
              maxLines: 2,
            ),

          SizedBox(height: 20.0),
        ],
      ),
    ),

        CheckboxListTile(
          title: Text('Social Media Presence', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          value: _isCheckedSocialMedia,
          onChanged: (newValue) {
            setState(() {
              _isCheckedSocialMedia = newValue!;
            });
          },
        ),
        Visibility(
      visible: _isCheckedSocialMedia,
      child: Column(
        children: [
            SizedBox(height: 20),

          TextField(
                    style: TextStyle(
                      fontSize: 13, 
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Social Media Presence',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none, 
                      labelStyle: TextStyle(
                        fontSize: 12, 
                      ),
                    ),
                    maxLines: 2,
                  ),
          SizedBox(height: 20.0),
        ],
      ),
    ),
        CheckboxListTile(
          title: Text('Family Status', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          value: _isCheckedFamilyStatus,
          onChanged: (newValue) {
            setState(() {
              _isCheckedFamilyStatus = newValue!;
            });
          },
        ), Visibility(
      visible: _isCheckedFamilyStatus,
      child: Column(
        children: [
            SizedBox(height: 20),

          TextField(
                    style: TextStyle(
                      fontSize: 13, 
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Family Status',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none, 
                      labelStyle: TextStyle(
                        fontSize: 12, 
                      ),
                    ),
                    maxLines: 2,
                  ),
          SizedBox(height: 20.0),
        ],
      ),
    ),
        CheckboxListTile(
      title: Text('Other', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      ),
      value: _isCheckedOther,
      onChanged: (newValue) {
        setState(() {
          _isCheckedOther = newValue!;
        });
      },
    ),
    Visibility(
      visible: _isCheckedOther,
      child: Column(
        children: [
            SizedBox(height: 20),
          TextField(
                    style: TextStyle(
                      fontSize: 13, 
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Other',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none, 
                      labelStyle: TextStyle(
                        fontSize: 12, 
                      ),
                    ),
                    maxLines: 2,
                  ),
          SizedBox(height: 20.0),
        ],
      ),
    ),

        // Add more CheckboxListTile widgets as needed
      ],
    ),
              SizedBox(height: 20.0),
          Text(
                '7. Ways to prevent',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),              ),
            SizedBox(height: 20),

              TextField(
                    style: TextStyle(
                      fontSize: 13, 
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Ways to prevent',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none, 
                      labelStyle: TextStyle(
                        fontSize: 12, 
                      ),
                    ),
                    maxLines: 2,
                  ),
              SizedBox(height: 20.0),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '9. Attachments (${_attachments.length})',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: _pickFiles,
                    child: Text('Add', 
                    style: TextStyle(
                      color: Colors.blue
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              // Display the list of attachments
              Wrap(
                // spacing: 32.0, 
                spacing: 20.0, 
                runSpacing: 20.0, // spacing between rows
                children: List.generate(_attachments.length, (index) {
                  final file = _attachments[index];
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width) / 2.4, 
                    child: _buildPreview(index, file),
                  );
                }).toList(),
              ),

        SizedBox(height: 20.0),
        Text(
                '10. When did it happen',
              style: TextStyle(
                fontSize: 14, 
                fontWeight: FontWeight.bold
              ),              ),
            SizedBox(height: 20),
        Row(
  children: [
    Expanded(
      child: DateTimeField(
        format: DateFormat("yyyy-MM-dd"),
        decoration: InputDecoration(
          labelText: 'Date',
          labelStyle: TextStyle(fontSize: 12.0),
          prefixIcon: Icon(Icons.calendar_today, size: 15),
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 11.0), // Adjust font size for date
        onChanged: (value) {
          setState(() {
            _selectedDate = value;
          });
        },
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            context: context,
            initialDate: currentValue ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
        },
      ),
    ),
    SizedBox(width: 0.0),
    Expanded(
      child: DateTimeField(
        format: DateFormat("HH:mm"),
        decoration: InputDecoration(
          labelText: 'Time',
          labelStyle: TextStyle(fontSize: 12.0),
          prefixIcon: Icon(Icons.access_time, size: 15),
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 11.0), // Adjust font size for time
        onChanged: (value) {
          setState(() {
            _selectedTime = value as TimeOfDay?;
          });
        },
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return time != null ? DateTimeField.convert(time) : currentValue;
        },
      ),
    ),
  ],
),



        ],
            // Why do you think they target you? and Ways to prevent
            if (_currentStep == 4) ...[
              Text(
                '11. Scam Tactic', 
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0,),
              // Column(
                // children: [
                  // Expanded(
                  //   child: 
                    TextField(
                    style: TextStyle(
                      fontSize: 13, 
                    ),
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Scam Tactic',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none, 
                      labelStyle: TextStyle(
                        fontSize: 12, 
                      ),
                    ),
                    maxLines: 2,
                  ),
                  // ),
                  SizedBox(height: 8.0), // Adjust the width as needed
                  ElevatedButton(
                  onPressed: () {
                    // Button onPressed callback
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Background color
                    onPrimary: Colors.black, // Text color
                    side: BorderSide(color: Colors.black, width: 1), // Border color and width
                  ),
                  child: Text('Auto Detect Scam Tactic'),
                ),

                // ],
              // ),
              SizedBox(height: 20.0,),
              Text(
          '12. Did you get scammed?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Suspicious Scam',
              groupValue: _selectedScamType,
              onChanged: (value) {
                setState(() {
                  _selectedScamType = value!;
                });
              },
            ),
            Text('Suspicious Scam', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ],
        ),

        Row(
          children: [
            Radio<String>(
              value: 'Confirmed Scam',
              groupValue: _selectedScamType,
              onChanged: (value) {
                setState(() {
                  _selectedScamType = value!;
                });
              },
            ),
            Text('Confirmed Scam', 
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
                      ],
        ),
          
        

            ],
            SizedBox(height: 20.0),
            
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    // Back button
    if (_currentStep > 1)
      Container(
        child: TextButton(
          onPressed: () {
            setState(() {
              _currentStep--;
            });
          },
          style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Background color
                    onPrimary: Colors.black, // Text color
                    side: BorderSide(color: Colors.black, width: 1), // Border color and width
                  ),
          child: Text(
            'Back',
            style: TextStyle(color: Colors.black), // Set text color
          ),
        ),
      ),
    // Next button
    if (_currentStep < 4)
      Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black, // Background color
            side: BorderSide(color: Colors.black, width: 2), // Border color and width
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Set the border radius here
            ),
          ),
          onPressed: () {
            setState(() {
              _currentStep++;
            });
          },
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white), // Set text color
          ),
        ),
      ),
    // Submit button
    if (_currentStep == 4)
      Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black, // Change the background color here
          ),
          onPressed: () {
            // Implement submission functionality
          },
          child: Text(
            'Submit',
            style: TextStyle(color: Colors.white), // Set text color
          ),
        ),
      ),

  ],
)
        
          ],
        ),
      ),
    );
  }
}


class StepWidget extends StatelessWidget {
  final int stepNumber;
  final bool isActive;

  const StepWidget({
    required this.stepNumber,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.black : Colors.grey,
          ),
          child: Center(
            child: Text(
              '$stepNumber',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          _getStepDescription(stepNumber),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  String _getStepDescription(int step) {
    switch (step) {
      case 1:
        return 'Title'; 
      case 2:
        return 'Scammer'; 
      case 3:
        return 'Details'; 
      case 4:
        return 'Tactic'; 
      default:
        return '';
    }
  }
}