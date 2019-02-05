import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/ornekler/yakit_takip/mixins/validation_mixin.dart';
import 'package:hello_world/ornekler/yakit_takip/models/stations.dart';
import 'package:hello_world/ornekler/yakit_takip/models/tuketim.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:hello_world/ornekler/yakit_takip/tools/numericTextFormatter.dart';
import 'package:intl/intl.dart';

class YakitGir extends StatefulWidget {
  _YakitGirState createState() => _YakitGirState();
}

class _YakitGirState extends State<YakitGir> {
  final tuketim = new Tuketim();
  final _formKey = GlobalKey<FormState>();

  final _stations = stationList;
  // List<String> _stations = <String>[
  //   '',
  //   'Shell',
  //   'Opet',
  //   'BP',
  //   'Total',
  //   'Petrol Ofisi'
  // ];

  Station _station;

  double _lastKm = 10000;

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 200.0,
        // color: Colors.grey.shade300,
        margin: EdgeInsets.all(8.0),
        padding:
            EdgeInsets.all(8.0), //const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text('Son sayaç: $_lastKm'),
              _stationsField(),
              _yakitKilometreSayaciField(),
              _unitPriceField(),
              _buyingDate(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: submitButton(),
              )
            ],
          ),
        )));
  }

  _yakitKilometreSayaciField() {
    return TextFormField(
      validator: (val) {
        if (val == "") {
          return 'Lüftden bir değer giriniz';
        }
        if (double.tryParse(val) <= 10) {
          return "sayac sifirdan büyük olmalı!";
        } else if (double.parse(val) <= _lastKm) {
          return "sayac onceki sayactan büyük olmalı!";
        }
        return null;
      },
      maxLength: 6,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next, //TextInputAction.done,
      //      textAlign: TextAlign.right,kkk
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
          labelText: 'Enter current km counter',
          icon: Icon(Icons.drag_handle),
          fillColor: Colors.white),
      onSaved: (value) {
        tuketim.yakitKilometreSayaci = double.tryParse(value);
      },
    );
  }

  _stationsField() {
    return FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: InputDecoration(
            icon: const Icon(Icons.battery_charging_full),
            labelText: 'Station',
          ),
          isEmpty: _station == null,
          child: DropdownButtonHideUnderline(
              child: DropdownButton(
            value: _station,
            isDense: true,
            onChanged: (Station newValue) {
              setState(() {
                tuketim.istasyon = newValue.stationName;
                _station = newValue;
                state.didChange(newValue.stationName);
              });
            },
            items: _stations.map((Station value) {
              return DropdownMenuItem(
                value: value,
                child: new Text(value.stationName),
              );
            }).toList(),
          )),
        );
      },
      validator: (val) {
        if (val == null) {
          return "Select your gas station";
        }
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text(
        "Save",
        style: TextStyle(fontSize: 16.9),
      ),
      color: Colors.pinkAccent,
      textColor: Colors.white70,
      onPressed: () {
        if (this._formKey.currentState.validate()) {
          _formKey.currentState.save();
          saveTuketim(tuketim);
        }
      },
    );
  }

  _buyingDate() {
    final dateFormat = DateFormat("dd-MM-yyyy");
    return DateTimePickerFormField(
      dateOnly: true,
      format: dateFormat,
      decoration: InputDecoration(
        labelText: 'Select Date',
        icon: Icon(Icons.calendar_today),
      ),
      initialValue: DateTime.now(),
      validator: (val) {
        if (val != null) {
          return null;
        } else {
          return 'Date Field is Empty';
        }
      },
      onSaved: (value) {
        // debugPrint(value.toString());
        tuketim.tarih = value;
      },
    );
  }

  _unitPriceField() {
    return TextFormField(
      validator: (val) {
        if (val == "") {
          return 'Lüftden bir değer giriniz';
        }
        if (double.tryParse(val) <= 0) {
          return "unit price >=0";
        }
        return null;
      },
      // maxLength: 6,

      textInputAction: TextInputAction.next, //TextInputAction.done,
      //      textAlign: TextAlign.right,kkk
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
        new NumericTextFormatter(),
      ],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Enter unit price',
          icon: Icon(Icons.pause_circle_outline),
          fillColor: Colors.white),
      onSaved: (value) {
        tuketim.yakitKilometreSayaci = double.tryParse(value);
      },
    );
  }

  void saveTuketim(Tuketim tuketim) {
    print(tuketim.yakitKilometreSayaci);
    print(tuketim.istasyon);
    print(tuketim.tarih);
  }

//-------------
}
