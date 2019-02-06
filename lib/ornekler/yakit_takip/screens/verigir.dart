import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/ornekler/yakit_takip/mixins/validation_mixin.dart';
import 'package:hello_world/ornekler/yakit_takip/models/stations.dart';
import 'package:hello_world/ornekler/yakit_takip/models/tuketim.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
//import 'package:hello_world/ornekler/yakit_takip/tools/input_validation_page.dart';
import 'package:hello_world/ornekler/yakit_takip/tools/validator.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YakitGir extends StatefulWidget {
  _YakitGirState createState() => _YakitGirState();
}

class _YakitGirState extends State<YakitGir> {
  final tuketim = new Tuketim();
  final _formKey = GlobalKey<FormState>();

  final _stations = stationList;
  Station _station;

  @override
  void initState() {
    super.initState();

    tuketim.sonKilometreSayaci = 0;
    tuketim.alinanYakitMiktari=0;
    tuketim.birimFiyat=0;
    tuketim.yakitKilometreSayaci=0;
    tuketim.alinanMesafe=0;
    tuketim.toplamTutar=0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 200.0,
        // color: Colors.grey.shade300,
        margin: EdgeInsets.all(8.0),
        padding:
            EdgeInsets.all(8.0), //const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text('Son sayaç: ${tuketim.sonKilometreSayaci.toStringAsFixed(0)}'),
              _stationsField(),
              _currentKilometreSayaciField(),
              _unitPriceField(),
              _buyingFuelVolumeField(),
              _buyingDate(),
              _calculatedValuesArea(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: submitButton(),
              )
            ],
          ),
        )));
  }

  _currentKilometreSayaciField() {
    return TextFormField(
      validator: (val) {
        if (val == "") {
          return 'Lüftden bir değer giriniz';
        }
        if (double.tryParse(val) <= 10) {
          return "sayac sifirdan büyük olmalı!";
        } else if (double.parse(val) <= tuketim.sonKilometreSayaci) {
          return "sayac onceki sayactan büyük olmalı!";
        }
        return null;
      },
      maxLength: 6,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      //      textAlign: TextAlign.right,kkk
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
          labelText: 'Enter current km counter',
          icon: Icon(FontAwesomeIcons.car),
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
            icon: const Icon(FontAwesomeIcons.mapMarkerAlt),
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
      textInputAction: TextInputAction.done,
      inputFormatters: [
        ValidatorInputFormatter(
          editingValidator: DecimalNumberEditingRegexValidator(1),
        )
      ],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Enter unit price',
          hintText: '\$0.00',
          icon: new Icon(FontAwesomeIcons.liraSign),
          fillColor: Colors.white),
      onSaved: (value) {
        tuketim.birimFiyat = double.tryParse(value);
      },
    );
  }

  _buyingFuelVolumeField() {
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
      textInputAction: TextInputAction.done,
      inputFormatters: [
        ValidatorInputFormatter(
          editingValidator: DecimalNumberEditingRegexValidator(2),
        )
      ],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Enter total liters',
          hintText: '\00.0000 lt',
          icon: new Icon(FontAwesomeIcons.gasPump),
          fillColor: Colors.white),
      onSaved: (value) {
        tuketim.alinanYakitMiktari = double.tryParse(value);
        _calculated();
      },
    );
  }

  submitButton() {
    return RaisedButton(
      child: Text(
        "Save",
        style: TextStyle(fontSize: 16.9),
      ),
      color: Theme.of(context).accentColor,
      textColor: Colors.white70,
      onPressed: () {
        if (this._formKey.currentState.validate()) {
          _formKey.currentState.save();
          // setState(() {
          //   tuketim.toplamTutar =
          //       tuketim.alinanYakitMiktari * tuketim.birimFiyat;
          // });

          saveTuketim(tuketim);
        }
      },
    );
  }

  void _calculated() {
    setState(() {
      tuketim.toplamTutar = tuketim.alinanYakitMiktari * tuketim.birimFiyat;
      tuketim.alinanMesafe =
          tuketim.yakitKilometreSayaci - tuketim.sonKilometreSayaci;
    });
  }

  _calculatedValuesArea() {
    return Card(
        margin: const EdgeInsets.only(top: 20.0),
        color: Colors.lightGreenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        child: Row(
          children: <Widget>[
            Text(
                '${tuketim.birimFiyat} x ${tuketim.alinanYakitMiktari.toStringAsFixed(2)} = ${tuketim.toplamTutar.toStringAsFixed(2)} TL'),
            SizedBox(
              width: 10.0,
            ),
            Text('${tuketim.alinanMesafe} km')
          ],
        ));
  }

  void saveTuketim(Tuketim tuketim) {
    print(tuketim.yakitKilometreSayaci);
    print(tuketim.istasyon);
    print(tuketim.tarih);
    print(tuketim.birimFiyat);
    print(tuketim.alinanYakitMiktari);
  }

//-------------
}
