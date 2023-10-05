mixin EnumMixin on Enum{
    void displayName(){
    print(name.toUpperCase());
  }
}

enum Day with EnumMixin{
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  Day operator - (int number){
    return Day.values[(index - number)%7];
  }
}

void main(List<String> args) {
  final day = Day.monday;
  (day-4).displayName();
}