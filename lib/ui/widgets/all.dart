import 'package:flutter/material.dart';

void navigateTo(context,Widget) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder:(context)=> Widget));