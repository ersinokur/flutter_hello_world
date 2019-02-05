import 'package:flutter/material.dart';
import 'package:hello_world/ornekler/eoModelDenemeAnlama/model/account.dart';

class Listele extends StatefulWidget {
  _ListeleState createState() => _ListeleState();
}

class _ListeleState extends State<Listele> {
  final liste = initialAccountsData;
  final _biggerFont =
      const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: initialAccountsData.length,
          itemBuilder: (context, int index) {
            return _buildCard(
                liste[index]); // Text(initialAccountsData[index].accountName);
          }),
    );
  }

  Widget _buildRow(Account account) {
    return ListTile(
      leading: Icon(Icons.account_balance),
      title: Text(
        account.accountName,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildCard(Account account) {
    //inwell widgeti butona cevirir.
    return InkWell(
      onTap: () {
        print(account.accountName);
      },
      child: Card(
        //1. satir
        child: Column(
          children: <Widget>[
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(account.accountName, style: _biggerFont),
            ),
            Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                        '${account.accountAmount.toString()} - ${account.accountCurrencyUnit} ',
                        style: TextStyle(fontSize: 14.0)),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                          'Son Güncelleme: ${account.amountLastUpdate}  ',
                          style: TextStyle(fontSize: 14.0)),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
