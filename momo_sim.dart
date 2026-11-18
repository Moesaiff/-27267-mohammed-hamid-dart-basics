// Student: Mohammed Saif Aldeen Ahmed Hamid
// Reg no: 27267
const String regNo = '27267';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by MSAAH
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by MSAAH
  bool negative = amount < 0;
  String sign = negative ? '-' : '';
  String digits = (negative ? -amount : amount).toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    if (count > 0 && count % 3 == 0) {
      result = ',$result';
    }
    result = digits[i] + result;
    count++;
    i--;
  }
  return '$sign$result RWF';
}


bool isValidPin(String pin) {
  // by MSAAH
  if (pin.length != 5) return false;

  int i = 0;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) return false;
    i++;
  }

  if (pin == '12345') return false;

  bool allSame = true;
  i = 1;
  while (i < pin.length) {
    if (pin[i] != pin[0]) allSame = false;
    i++;
  }
  if (allSame) return false;

  return true;
}

int sendMoney(int balance, int amount) {
  // by MSAAH
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by MSAAH
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be from 100 RWF to 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Airtime bought: ${formatRwf(amount)}. '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by MSAAH
  print('Reg no: $regNo | D = $d | T = $t');

  print("isValidPin('12345') -> ${isValidPin('12345')}");
  print("isValidPin('77777') -> ${isValidPin('77777')}");
  print("isValidPin('4821') -> ${isValidPin('4821')}");
  print("isValidPin('48a21') -> ${isValidPin('48a21')}");
  print("isValidPin('4821$d') -> ${isValidPin('4821$d')}");

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(1000000)); // expect: 1,000,000 RWF
  print(formatRwf(100)); // expect: 100 RWF
  print(formatRwf(-1000)); // expect: -1,000 RWF
  print(formatRwf(-500)); // expect: -500 RWF  (my first draft broke here)
  print(formatRwf(123456789)); // expect: 123,456,789 RWF
  print(isValidPin('00000')); // expect: false (same digit five times)
  print(isValidPin('12346')); // expect: true
  print(isValidPin('')); // expect: false (empty string, must not crash)
  print(isValidPin('1234 ')); // expect: false (a space is not a digit)
}
