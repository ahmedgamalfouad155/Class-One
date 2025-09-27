import 'package:flutter/material.dart';

@immutable
abstract class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthCodeSent extends PhoneAuthState {
  final String verificationId;
  PhoneAuthCodeSent(this.verificationId);
}

class PhoneAuthVerified extends PhoneAuthState {}

class PhoneAuthError extends PhoneAuthState {
  final String message;
  PhoneAuthError(this.message);
}
