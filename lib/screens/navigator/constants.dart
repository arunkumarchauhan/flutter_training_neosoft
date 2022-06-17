import 'package:flutter/material.dart';

enum Pages{
  Splash,
  Login,
  CreateAccount,
  ListPage,
  Details,
  Checkout,
  Settings
}
enum PageState {
  none,
  addPage,
  addAll,
  addWidget,
  pop,
  replace,
  replaceAll
}

const String SplashPath="/splash";
const String LoginPath="/login";
const String CreateAccountPath="/register";
const String ListItemsPath="/listitems";
const String DetailsPath="/details";
const String CartPath="/cart";
const String CheckoutPath='/checkout';
const String SettingPath="/settings";
