import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picker and DatePicker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picker and DatePicker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _CupertinoPickerExample(),
            SizedBox(height: 32), // Espacio entre los ejemplos
            _MaterialPickerExample(),
            SizedBox(height: 32), // Espacio entre los ejemplos
            _CupertinoDatePickerExample(),
            SizedBox(height: 32), // Espacio entre los ejemplos
            _MaterialDatePickerExample(),
          ],
        ),
      ),
    );
  }
}

class _CupertinoPickerExample extends StatefulWidget {
  const _CupertinoPickerExample({Key? key}) : super(key: key);

  @override
  State<_CupertinoPickerExample> createState() =>
      _CupertinoPickerExampleState();
}

class _CupertinoPickerExampleState extends State<_CupertinoPickerExample> {
  int _selectedFruit = 0;
  final List<String> _fruitNames = [
    'Apple',
    'Mango',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Cupertino Picker Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16), // Espacio entre el título y el picker
        CupertinoButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 216,
                  child: CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: 32.0,
                    scrollController: FixedExtentScrollController(
                      initialItem: _selectedFruit,
                    ),
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedFruit = selectedItem;
                      });
                    },
                    children: List<Widget>.generate(
                      _fruitNames.length,
                      (int index) {
                        return Center(child: Text(_fruitNames[index]));
                      },
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            'Selected fruit: ${_fruitNames[_selectedFruit]}',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class _MaterialPickerExample extends StatefulWidget {
  const _MaterialPickerExample({Key? key}) : super(key: key);

  @override
  State<_MaterialPickerExample> createState() =>
      _MaterialPickerExampleState();
}

class _MaterialPickerExampleState extends State<_MaterialPickerExample> {
  int _selectedFruit = 0;
  final List<String> _fruitNames = [
    'Apple',
    'Mango',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Material Picker Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16), // Espacio entre el título y el picker
        DropdownButton<String>(
          value: _fruitNames[_selectedFruit],
          onChanged: (String? newValue) {
            setState(() {
              _selectedFruit = _fruitNames.indexOf(newValue!);
            });
          },
          items: _fruitNames.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _CupertinoDatePickerExample extends StatefulWidget {
  const _CupertinoDatePickerExample({Key? key}) : super(key: key);

  @override
  State<_CupertinoDatePickerExample> createState() =>
      _CupertinoDatePickerExampleState();
}

class _CupertinoDatePickerExampleState
    extends State<_CupertinoDatePickerExample> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Cupertino DatePicker Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16), // Espacio entre el título y el picker
        CupertinoButton(
          onPressed: () async {
            final DateTime? pickedDate = await showModalBottomSheet<DateTime>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 216,
                  child: CupertinoDatePicker(
                    initialDateTime: _selectedDate,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime newDateTime) {
                      setState(() {
                        _selectedDate = newDateTime;
                      });
                    },
                  ),
                );
              },
            );
            if (pickedDate != null && pickedDate != _selectedDate) {
              setState(() {
                _selectedDate = pickedDate;
              });
            }
          },
          child: Text(
            'Selected date: ${_selectedDate.toString().substring(0, 10)}',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class _MaterialDatePickerExample extends StatefulWidget {
  const _MaterialDatePickerExample({Key? key}) : super(key: key);

  @override
  State<_MaterialDatePickerExample> createState() =>
      _MaterialDatePickerExampleState();
}

class
_MaterialDatePickerExampleState extends State<_MaterialDatePickerExample> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Material DatePicker Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16), // Espacio entre el título y el picker
        ElevatedButton(
          onPressed: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null && pickedDate != _selectedDate) {
              setState(() {
                _selectedDate = pickedDate;
              });
            }
          },
          child: Text(
            'Selected date: ${_selectedDate.toString().substring(0, 10)}',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
