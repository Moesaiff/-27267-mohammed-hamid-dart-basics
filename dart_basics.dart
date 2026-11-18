// Student: Mohammed Saif Aldeen Ahmed Hamid
// Reg no: 27267
const String regNo = '27267';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by MSAAH
  int count = 0;
  
  for (int i = 0; i < text.length; i++) {
    if ('aeiou'.contains(text[i])) {
      count++;
    }
  }
  return count;
}


String initials(String fullName) {
  // by MSAAH
  String result = '';
  List<String> parts = fullName.trim().split(RegExp(r'\s+'));
  for (String part in parts) {
    if (part.isNotEmpty) {
      result += '${part[0].toUpperCase()}.';
    }
  }
  return result;
}


void drawTriangle(int height) {
  // by MSAAH
  for (int row = 1; row <= height; row++) {
    String symbol = (row % 2 == 1) ? '*' : '#';
    String spaces = List.filled(height - row, ' ').join();
    String symbols = List.filled(row, symbol).join();

    print(' ' * (height - row) + symbol * row);
  }
}

int momoFee(int amount) {
  // by MSAAH
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by MSAAH
  if (phone.length != 10) return 'INVALID';
  String masked = List.filled(phone.length - 5, '*').join();
  return phone.substring(0, 3) +
      masked +
      phone.substring(phone.length - 2);
}

void main() {
  // by MSAAH
  print('Reg no: $regNo | D = $d | T = $t');

  const String myName = 'Mohammed Saif Aldeen Ahmed Hamid';

  print('$myName has ${countVowels(myName)} vowels');

  print("initials('$myName') -> '${initials(myName)}'");
  print("initials(' ana uwase ') -> '${initials(' ana uwase ')}'");
  print("initials(' ') -> '${initials(' ')}'");

  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  const String phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    totalFees += fee;
    i++;
  }
  print('Total fees: $totalFees RWF');
}
