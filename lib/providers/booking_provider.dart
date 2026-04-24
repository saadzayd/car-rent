import 'package:flutter/material.dart';
import '../models/reservation.dart';

class BookingProvider extends ChangeNotifier {
  String _pickUpLocation = 'Nygatan 11, 24231 Horby';
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  bool _skiRack = false;
  bool _carSeat = false;
  bool _navigation = false;
  String _paymentMethod = 'paypal';
  final double _dailyPrice = 120.0;
  final double _extraHour = 20.0;
  final double _tax = 15.0;

  String get pickUpLocation => _pickUpLocation;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  TimeOfDay? get startTime => _startTime;
  TimeOfDay? get endTime => _endTime;
  bool get skiRack => _skiRack;
  bool get carSeat => _carSeat;
  bool get navigation => _navigation;
  String get paymentMethod => _paymentMethod;
  double get dailyPrice => _dailyPrice;
  double get extraHour => _extraHour;
  double get tax => _tax;

  double get totalAmount => _dailyPrice + _extraHour + _tax;

  void setPickUpLocation(String location) {
    _pickUpLocation = location;
    notifyListeners();
  }

  void setStartDate(DateTime date) {
    _startDate = date;
    notifyListeners();
  }

  void setEndDate(DateTime date) {
    _endDate = date;
    notifyListeners();
  }

  void setStartTime(TimeOfDay time) {
    _startTime = time;
    notifyListeners();
  }

  void setEndTime(TimeOfDay time) {
    _endTime = time;
    notifyListeners();
  }

  void toggleSkiRack() {
    _skiRack = !_skiRack;
    notifyListeners();
  }

  void toggleCarSeat() {
    _carSeat = !_carSeat;
    notifyListeners();
  }

  void toggleNavigation() {
    _navigation = !_navigation;
    notifyListeners();
  }

  void setPaymentMethod(String method) {
    _paymentMethod = method;
    notifyListeners();
  }

  // Test data for reservations
  List<Reservation> getUpcomingReservations() {
    return [
      Reservation(id: 1, carName: 'Porche Fx', pickUpLocation: 'Vildansvagen 20, 24273 Lund, Sweden', pickUpDate: 'July 30, 2027', pickUpTime: 'Time: 8:40 am', price: '\$145'),
      Reservation(id: 2, carName: 'BMW X5', pickUpLocation: 'Stockholm Central, Sweden', pickUpDate: 'Aug 15, 2027', pickUpTime: 'Time: 10:00 am', price: '\$250'),
      Reservation(id: 3, carName: 'Audi A6', pickUpLocation: 'Gothenburg Airport, Sweden', pickUpDate: 'Sep 1, 2027', pickUpTime: 'Time: 2:30 pm', price: '\$320'),
    ];
  }

  List<Reservation> getCompletedReservations() {
    return [
      Reservation(id: 4, carName: 'Toyota Camry', pickUpLocation: 'Malmo Centrum, Sweden', pickUpDate: 'Jan 10, 2027', pickUpTime: 'Time: 9:00 am', price: '\$180'),
      Reservation(id: 5, carName: 'VW Golf', pickUpLocation: 'Uppsala Station, Sweden', pickUpDate: 'Feb 22, 2027', pickUpTime: 'Time: 11:30 am', price: '\$145'),
    ];
  }

  List<Reservation> getCancelledReservations() {
    return [
      Reservation(id: 6, carName: 'Mercedes E-Class', pickUpLocation: 'Lund University, Sweden', pickUpDate: 'Mar 5, 2027', pickUpTime: 'Time: 7:00 am', price: '\$420'),
    ];
  }

  void resetBooking() {
    _startDate = null;
    _endDate = null;
    _startTime = null;
    _endTime = null;
    _skiRack = false;
    _carSeat = false;
    _navigation = false;
    _paymentMethod = 'paypal';
    notifyListeners();
  }
}
