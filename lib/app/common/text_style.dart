import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

// String formattting across the app

const headerStyle = TextStyle(
    color: AppColors.white, fontSize: 20, fontWeight: FontWeight.bold);
const titleStyle = TextStyle(color: AppColors.white, fontSize: 20);
const subtitleStyle = TextStyle(color: AppColors.white, fontSize: 13);

TextStyle matchesTitleStyle = TextStyle(
    color: AppColors.black.withAlpha(190),
    fontSize: 24,
    fontWeight: FontWeight.w600);
TextStyle matchesSubtitleStyle =
    TextStyle(color: AppColors.black.withAlpha(120), fontSize: 20);

const authTitleStyle = TextStyle(
    color: AppColors.grayscale, fontSize: 32, fontWeight: FontWeight.bold);
const authSubtitleStyle = TextStyle(
    color: AppColors.primaryDark, fontSize: 14, fontWeight: FontWeight.normal);
const authAltStyle = TextStyle(
    color: AppColors.grayscale, fontSize: 14, fontWeight: FontWeight.normal);

const forgotTitleStyle = TextStyle(
    color: AppColors.primaryDark, fontSize: 18, fontWeight: FontWeight.w600);
const forgotSubtitleStyle = TextStyle(
    color: AppColors.grayscale, fontSize: 14, fontWeight: FontWeight.normal);
