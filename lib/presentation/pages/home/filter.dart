import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Filter values
  double _selectedPrice = 100;
  DateTime? _selectedDate;
  String? _selectedLocation;
  String? _selectedCategory;

  final List<String> _locations = ['Cairo', 'Alexandria', 'Giza'];
  final List<String> _categories = ['Flight', 'Hotel', 'Tour'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // White back arrow
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text('Filter Results', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the whole body
        child: SingleChildScrollView( // Allow scrolling if content overflows
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price Slider
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Padding for Price text
                child: Text('Price: \$${_selectedPrice.toStringAsFixed(0)}', style: TextStyle(fontSize: 16)),
              ),
              Slider(
                value: _selectedPrice,
                min: 0,
                max: 500,
                divisions: 10,
                activeColor: Colors.blueAccent,
                onChanged: (value) {
                  setState(() {
                    _selectedPrice = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Date Picker
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Padding for Select Date text
                child: Text('Select Date', style: TextStyle(fontSize: 16)),
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  _selectedDate == null
                      ? 'Choose a Date'
                      : _selectedDate!.toLocal().toString().split(' ')[0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),

              // Location Dropdown
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Padding for Select Location text
                child: Text('Select Location', style: TextStyle(fontSize: 16)),
              ),
              DropdownButton<String>(
                value: _selectedLocation,
                hint: Text('Choose Location'),
                items: _locations.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLocation = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Category Dropdown
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Padding for Select Category text
                child: Text('Select Category', style: TextStyle(fontSize: 16)),
              ),
              DropdownButton<String>(
                value: _selectedCategory,
                hint: Text('Choose Category'),
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Apply Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Apply filter logic here
                    Navigator.pop(context); // Go back to the previous screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text(
                    'Apply Filters',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
