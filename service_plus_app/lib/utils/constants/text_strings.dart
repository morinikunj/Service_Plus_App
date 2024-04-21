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

//customer
const String chooseService = "Choose service \nyou want to need";
const String search = "Search";
const String rating = "Rating";
const String charge = "Charge";
const String book = "Book";
const String location = "Location";
const String timing = "Timing";
const String call = "Call";
const String experience = "Experience";
const String place = "Type Your Place";
const String selectServices = "Select Services";
const String howMuchTimes = "How Much Time Do You Need";
const String selectDate = "Select Date";
const String startTime = "Start Time";
const String endTime = "End Time";
const String selectPayOption = "Select Payment Option";
const String online = "Online";
const String cash = "Cash";
const String proceedToPay = "Proceed to Pay";
const String myBooking = "My Bookings";
const String messages = "Messages";
const String notifications = "Notifications";
const String clear = "Clear";
const String profile = "Profile";
const String editProfile = "Edit Profile";
const String name = "Name";
const String email = "Email";
const String no = "Mobile No";
const String updateProfile = "Update Profile";
const String logout = "Logout";
const String login = "Login";
const String createAccount = "Create an Account";
const String password = "Password";
const String alreadyHaveAccount = "Already have an Account";
const String register = "Register";
const String forgetPassword = "Forget Password";

//service provider
const String bookingId = "Booking ID";
const String callNow = "Call Now";
const String message = "Message";
const String bookingStatus = "Booking Status";
const String requestRecieved = "Request Recieved";
const String bookingConfirmed = "Booking Confirmed";
const String startedJob = "Started a Job";
const String completedJob = "Completed Job";
const String accept = "Accept";
const String reject = "Reject";

//introscreen
const String getStarted = "Get Started";
const String skipNow = "Skip Now";

//text scale
textScale(context) =>
    TextScaler.linear(ResponsiveUtil.instance.textScaleFactor(context));
