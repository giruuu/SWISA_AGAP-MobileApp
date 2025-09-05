import 'package:flutter/material.dart';

// Enum to represent the status of an event.
enum EventStatus {
  upcoming,
  cannotCancel,
  attended,
  available,
}

class Event {
  final String title;
  final String date;
  final String time;
  final int attendees;
  final String description;
  final EventStatus status;

  const Event({
    required this.title,
    required this.date,
    required this.time,
    required this.attendees,
    required this.description,
    required this.status,
  });
}
