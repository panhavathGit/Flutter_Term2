import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SearchFormScreen(),
  ));
}

class SearchFormScreen extends StatefulWidget {
  @override
  _SearchFormScreenState createState() => _SearchFormScreenState();
}

class _SearchFormScreenState extends State<SearchFormScreen> {
  String? _selectedLocation = "Toulouse";
  DateTime? _selectedDate;
  int _numTravelers = 1;

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Search Form")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Location Selection
            _buildLocationOption("Toulouse"),
            _buildLocationOption("Bordeaux, France"),

            // Date Picker
            GestureDetector(
              onTap: _pickDate,
              child: _buildInputField(
                icon: Icons.calendar_today,
                text: _selectedDate == null
                    ? "Select Date"
                    : "${_selectedDate!.toLocal()}".split(' ')[0],
              ),
            ),

            // Traveler Count
            _buildInputField(
              icon: Icons.person,
              text: "$_numTravelers",
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (_numTravelers > 1) {
                        setState(() {
                          _numTravelers--;
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _numTravelers++;
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Search Button
            ElevatedButton(
              onPressed: () {
                print("Search button clicked");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Search",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildLocationOption(String location) {
    return RadioListTile<String>(
      title: Text(location),
      value: location,
      groupValue: _selectedLocation,
      onChanged: (String? value) {
        setState(() {
          _selectedLocation = value;
        });
      },
    );
  }

  Widget _buildInputField({required IconData icon, required String text, Widget? trailing}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(width: 12),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
