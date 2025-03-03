import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:my_app/week3/widgets/display/bla_divider.dart';
import 'package:my_app/week3/widgets/inputs/input_field.dart';
import 'package:my_app/week3/screens/test_screen/location_detail_test_screen.dart';

class SearchFormScreen extends StatefulWidget {
  @override
  _SearchFormScreenState createState() => _SearchFormScreenState();
}

class _SearchFormScreenState extends State<SearchFormScreen> {
  // String? _selectedLocation = "Toulouse";
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
            LocationOptionBtn(
              location: "Toulouse",
            ),
            LocationOptionBtn(
              location: "Bordeaux, France",
            ),

            //Date picker
            GestureDetector(
              onTap: _pickDate,
              child: InputField(
                icon: Icons.calendar_today,
                text: _selectedDate == null
                    ? "Select Date"
                    : DateFormat('yyyy-MM-dd')
                        .format(_selectedDate!), // Simplified formatting
              ),
            ),
               
            //Seat number
            InputField(
              icon: Icons.person,
              text: "$_numTravelers",
              trailing: Row(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (_numTravelers > 1) {
                        setState(() => _numTravelers--);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => setState(() => _numTravelers++),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () => print("Search button clicked"),
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
}

class LocationOptionBtn extends StatelessWidget {
  final String location;
  final IconData icon;
  final Color color;

  const LocationOptionBtn({
    required this.location,
    this.icon = Icons.location_on, // Default icon
    this.color = Colors.white, // Default color
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LocationDetailScreen(location: location),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align items to the left
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 12), // Space between icon and text
            Expanded(
              child: Text(
                location,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
