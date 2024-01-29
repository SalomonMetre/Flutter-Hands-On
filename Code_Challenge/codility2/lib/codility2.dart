int solution(List<int> A, List<int> B) {
  int lengthCandyShop = A.length;
  int goldCoins = lengthCandyShop ~/ 2, silverCoins = lengthCandyShop ~/ 2;
  final setA = A.toSet();
  final setB = B.toSet();
  return (setA.length > goldCoins ? goldCoins : setA.length) +
      (setB.length > silverCoins ? silverCoins : setB.length);
}

void main(List<String> args) {
  print(solution([2, 2, 2, 2, 2, 2], [7, 4, 2, 5, 1, 2]));
}
