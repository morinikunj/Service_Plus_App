import 'package:flutter/material.dart';
import '../responsive_util/responsive_util.dart';

//admin pannel
const String dashboard = "Dashboard";
const String userManagement = "User Management";
const String providerManagement = "Provider Management";
const String category = "Category";
const String serviceManagement = "Service Management";
const String bookings = "Bookings";
const String users = "Users";
const String serviceProvider = "Service Provider";
const String payments = "Payments";
const String service = "Services";


//text scale
textScale(context) =>
    TextScaler.linear(ResponsiveUtil.instance.textScaleFactor(context));
