import 'package:flutter/material.dart';

class AccountInfo {
  final IconData icon;
  final String title;
  final String info;

  const AccountInfo({required this.icon, required this.title, required this.info});
}

List<AccountInfo> accountInfos = [
  const AccountInfo(icon: Icons.email, title: "Email", info: "a.ojei@techneo.ng"),
  const AccountInfo(icon: Icons.phone, title: "Phone", info: "+2347044559944"),
  const AccountInfo(icon: Icons.location_city, title: "Address", info: "Abuja, Nigeria"),
  const AccountInfo(icon: Icons.group, title: "Faculty", info: "School of Programming"),
  const AccountInfo(icon: Icons.pending_rounded, title: "Designation", info: "Website Development"),
];