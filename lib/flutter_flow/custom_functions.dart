import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

double? randomDouble(
  double min,
  double max,
  int initialNumber,
) {
  if (min == null || max == null || min > max) {
    return null;
  }
  final random = math.Random();
  double randomValue = min + (random.nextDouble() * (max - min));
  double numeroFormatado = (randomValue * 1000).round() / 1000;

  return numeroFormatado + initialNumber;
}

DateTime? returnExpireDate(
  DateTime creationTimestamp,
  int daysToAdd,
) {
  return creationTimestamp.add(Duration(days: daysToAdd));
}

String gerarCodigoUnico(
  int groupLength,
  int numGroups,
  String separator,
) {
  const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  math.Random _rnd = math.Random.secure();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  List<String> codeGroups = [];
  for (int i = 0; i < numGroups; i++) {
    codeGroups.add(getRandomString(groupLength));
  }

  return codeGroups.join(separator);
}

int returnIdSpinning(double rotationNumber) {
  if ((rotationNumber >= 5.068 && rotationNumber <= 5.187) ||
      (rotationNumber >= 5.314 && rotationNumber <= 5.439) ||
      (rotationNumber >= 5.566 && rotationNumber <= 5.679) ||
      (rotationNumber >= 5.812 && rotationNumber <= 5.933)) {
    return 15;
  }
  if (rotationNumber >= 5.680 && rotationNumber <= 5.811) {
    return 2;
  }
  if (rotationNumber >= 5.440 && rotationNumber <= 5.565) {
    return 3;
  }
  if (rotationNumber >= 5.188 && rotationNumber <= 5.313) {
    return 4;
  }
  return 1;
}

List<String> combineString(String string) {
  // a function that combine a string to "@gmail.com", "@icloud.com" and "@hotmail.com" and returns a list of string
  return [
    '$string@gmail.com',
    '$string@icloud.com',
    '$string@hotmail.com',
  ];
}

bool cpfValidator(String cpf) {
// Remove caracteres não numéricos
  cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

  // Verifica se o CPF tem 11 dígitos
  if (cpf.length != 11) {
    return false;
  }

  // Verifica se todos os dígitos são iguais
  if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
    return false;
  }

  // Cálculo do primeiro dígito verificador
  int soma = 0;
  for (int i = 0; i < 9; i++) {
    soma += int.parse(cpf[i]) * (10 - i);
  }
  int primeiroDigito = (soma % 11 < 2) ? 0 : 11 - (soma % 11);

  // Cálculo do segundo dígito verificador
  soma = 0;
  for (int i = 0; i < 10; i++) {
    soma += int.parse(cpf[i]) * (11 - i);
  }
  int segundoDigito = (soma % 11 < 2) ? 0 : 11 - (soma % 11);

  // Verifica os dígitos calculados com os dígitos do CPF
  return cpf.endsWith('$primeiroDigito$segundoDigito');
}
