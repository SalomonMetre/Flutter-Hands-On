// using the compute function from a package
// compute is generally available only in Flutter apps
import 'package:compute/compute.dart';

num double([num number = 0]) => 2 * number;

void main(List<String> args) async {
  final doubleTen = await compute(double, 10);
  print(doubleTen);
}
