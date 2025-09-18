import 'drink.dart';

class Shai extends Drink {
  const Shai() : super(name: 'Shai', price: 2.0);

  @override
  String getDescription() => 'Traditional Egyptian tea';
}

class TurkishCoffee extends Drink {
  const TurkishCoffee() : super(name: 'Turkish Coffee', price: 5.0);

  @override
  String getDescription() => 'Rich and strong Turkish coffee';
}

class HibiscusTea extends Drink {
  const HibiscusTea() : super(name: 'Hibiscus Tea', price: 3.0);

  @override
  String getDescription() => 'Refreshing hibiscus flower tea';
}

class Cappuccino extends Drink {
  const Cappuccino() : super(name: 'Cappuccino', price: 4.0);

  @override
  String getDescription() => 'Espresso';
}

class Latte extends Drink {
  const Latte() : super(name: 'Latte', price: 4.0);

  @override
  String getDescription() => 'Espresso with steamed milk and foam';
}

class Americano extends Drink {
  const Americano() : super(name: 'Americano', price: 3.0);

  @override
  String getDescription() => 'Espresso with hot water';
}

class Espresso extends Drink {
  const Espresso() : super(name: 'Espresso', price: 2.0);

  @override
  String getDescription() => 'Strong and concentrated coffee';
}

class Mocha extends Drink {
  const Mocha() : super(name: 'Mocha', price: 4.0);

  @override
  String getDescription() => 'Espresso with chocolate';
}

class CaramelMacchiato extends Drink {
  const CaramelMacchiato() : super(name: 'Caramel Macchiato', price: 4.0);

  @override
  String getDescription() => 'Espresso with caramel';
}

class FlatWhite extends Drink {
  const FlatWhite() : super(name: 'Flat White', price: 4.0);

  @override
  String getDescription() => 'Espresso with steamed milk';
}

class IcedCoffee extends Drink {
  const IcedCoffee() : super(name: 'Iced Coffee', price: 3.0);

  @override
  String getDescription() => 'Cold coffee with ice';
}

class IcedTea extends Drink {
  const IcedTea() : super(name: 'Iced Tea', price: 3.0);

  @override
  String getDescription() => 'Cold tea with ice';
}
