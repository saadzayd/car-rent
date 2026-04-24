import 'package:flutter/material.dart';
import '../models/car.dart';
import '../models/car_category.dart';
import '../models/search_result.dart';

class CarProvider extends ChangeNotifier {
  List<CarCategory> _categories = [];
  List<Car> _carsInCategory = [];
  List<SearchResult> _searchResults = [];
  Car? _selectedCar;
  double _priceFilter = 0;

  List<CarCategory> get categories => _categories;
  List<Car> get carsInCategory => _carsInCategory;
  List<SearchResult> get searchResults => _searchResults;
  Car? get selectedCar => _selectedCar;
  double get priceFilter => _priceFilter;

  CarProvider() {
    loadCategories();
    loadSearchResults();
  }

  void loadCategories() {
    _categories = [
      CarCategory(name: 'BMW', imagePath: ''),
      CarCategory(name: 'TOYOTA', imagePath: ''),
      CarCategory(name: 'FORD', imagePath: ''),
      CarCategory(name: 'NISSAN', imagePath: ''),
      CarCategory(name: 'SAAB', imagePath: ''),
      CarCategory(name: 'VOLVO', imagePath: ''),
      CarCategory(name: 'AUDI', imagePath: ''),
      CarCategory(name: 'MERCEDES', imagePath: ''),
    ];
    notifyListeners();
  }

  void loadCarsForCategory(String categoryName) {
    _carsInCategory = [
      Car(catId: 1, name: 'Camry', price: 100),
      Car(catId: 1, name: 'Golf', price: 150),
      Car(catId: 1, name: 'Passat', price: 120),
      Car(catId: 1, name: 'Yaris', price: 130),
      Car(catId: 1, name: 'Benz', price: 200),
    ];
    notifyListeners();
  }

  void loadSearchResults() {
    _searchResults = [
      SearchResult(name: 'VW GOLF', price: '320 \$', features: 'Automatic, 5-seater, Petrol, Wifi', duration: 'Daily'),
      SearchResult(name: 'BMW 3 Series', price: '450 \$', features: 'Automatic, 5-seater, Diesel, GPS', duration: 'Daily'),
      SearchResult(name: 'Toyota Camry', price: '280 \$', features: 'Automatic, 5-seater, Hybrid, Wifi', duration: 'Daily'),
      SearchResult(name: 'Audi A4', price: '520 \$', features: 'Automatic, 5-seater, Petrol, Premium', duration: 'Daily'),
      SearchResult(name: 'Ford Focus', price: '250 \$', features: 'Manual, 5-seater, Petrol, AC', duration: 'Daily'),
      SearchResult(name: 'Mercedes C-Class', price: '580 \$', features: 'Automatic, 5-seater, Diesel, Luxury', duration: 'Daily'),
    ];
    notifyListeners();
  }

  void selectCar(Car car) {
    _selectedCar = car;
    notifyListeners();
  }

  void setPriceFilter(double price) {
    _priceFilter = price;
    notifyListeners();
  }
}
