class Account {
  String accountName;
  String accountCurrencyUnit;
  double accountAmount;
  String amountLastUpdate;

  Account(this.accountName, this.accountCurrencyUnit, this.accountAmount,
      this.amountLastUpdate);
}

List<Account> initialAccountsData = [
  Account('YKB1', 'USD', 500.0, '30.05.2018'),
  Account('YKB1', 'USD', 500.0, '30.05.2018'),
  Account('YKB2', 'TRL', 40.0, '30.05.2018'),
  Account('ENP2', 'TRL', 49000.0, '25.06.2018'),
  Account('ENP3', 'USD', 800.0, '15.09.2018'),
];
