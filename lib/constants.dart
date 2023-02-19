import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Colors
Color kPrimaryColor = Color(0xFF1C254E);

final Reference storageRef = FirebaseStorage.instance.ref();
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// Social Media
const kSocialIcons = [
  "assets/instagram.png",
  'assets/twitter.png',
  'assets/meta.png',
  'assets/gmail.png',
];

const kSocialLink = [
  'https://www.instagram.com/venomch/',
  'https://twitter.com/maniipoint',
  'https://www.facebook.com/venomch',
  'https://mail.google.com/mail/u/0/#inbox',
];

// URL Launcher
void launchURL(Uri _url) async => await canLaunchUrl(_url)
    ? await launchUrl(_url)
    : throw 'Could not launch $_url';

final kTools1 = [];

// services
final kServicesIcons = [
  "assets/services/booking.png",
  "assets/services/progress.png",
  "assets/services/hand.png",
];

final kServicesTitles = [
  'Facilitate investment in technology',
  'Develop your financial resources',
  'Securing your financial future',
];

final kServicesDescriptions = [
  'Today, it is possible for you to invest locally and globally in the easiest and fastest way by completing the process in an automated manner by harnessing technology',
  'Investing preserves the actual value of your money from inflation and grows it over the years to increase in value.',
  "Long-term investment guarantees your future financial freedom after retirement or when you decide to work towards achieving your dreams.",
];
