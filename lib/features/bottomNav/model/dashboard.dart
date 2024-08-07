// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DashboardModel {
  final bool active;
  final List<String> access;
  final String name;
  final String icon;
  final String route;
  final String? arabicName;

  DashboardModel(this.active, this.access, this.name, this.icon, this.route,
      this.arabicName);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'active': active,
      'access': access,
      'name': name,
      'icon': icon,
      'route': route,
      'arabicName': arabicName,
    };
  }

  factory DashboardModel.fromMap(Map<String, dynamic> map) {
    return DashboardModel(
      map['active'] as bool,
      List<String>.from(map['access'] ?? []),
      map['name'] as String,
      map['icon'] as String,
      map['route'] as String,
      map['arabicName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardModel.fromJson(String source) =>
      DashboardModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
