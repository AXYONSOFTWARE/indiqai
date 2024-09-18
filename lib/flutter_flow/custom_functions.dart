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
  if (rotationNumber >= 5.085 && rotationNumber <= 5.192) {
    // Originalmente 5.068 e 5.187
    return 50;
  } else if (rotationNumber >= 5.331 && rotationNumber <= 5.444) {
    // Originalmente 5.314 e 5.439
    return 100;
  } else if (rotationNumber >= 5.583 && rotationNumber <= 5.684) {
    // Originalmente 5.566 e 5.679
    return 150;
  } else if (rotationNumber >= 5.829 && rotationNumber <= 5.938) {
    // Originalmente 5.812 e 5.933
    return 200;
  } else if (rotationNumber >= 5.697 && rotationNumber <= 5.828) {
    // Originalmente 5.680 e 5.811
    return 2;
  } else if (rotationNumber >= 5.457 && rotationNumber <= 5.570) {
    // Originalmente 5.440 e 5.565
    return 3;
  } else if (rotationNumber >= 5.205 && rotationNumber <= 5.318) {
    // Novo intervalo dado
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

double? generateFinalTurnsBasedOnProbability(
  double prob50,
  double probP4,
  double prob100,
  double probP3,
  double prob150,
  double probP2,
  double prob200,
  double probP1,
) {
// Passo 1: Definir os produtos e seus intervalos
  Map<int, List<double>> productRanges = {
    1: [5.085, 5.192], // Produto 1 (Original: 5.068, 5.187)
    2: [5.205, 5.318], // Produto 2 (Original: 5.188, 5.313)
    3: [5.331, 5.444], // Produto 3 (Original: 5.314, 5.439)
    4: [5.457, 5.570], // Produto 4 (Original: 5.440, 5.565)
    5: [5.583, 5.684], // Produto 5 (Original: 5.566, 5.679)
    6: [5.697, 5.828], // Produto 6 (Original: 5.680, 5.811)
    7: [5.829, 5.938], // Produto 7 (Original: 5.812, 5.933)
    8: [5.951, 6.005], // Produto 8 (Original: 5.934, 6.000)
  };

  // Passo 2: Criar uma lista de probabilidades com base nos argumentos
  List<double> probabilities = [
    prob50 = prob50 / 100,
    probP4 = probP4 / 100,
    prob100 = prob100 / 100,
    probP3 = probP3 / 100,
    prob150 = prob150 / 100,
    probP2 = probP2 / 100,
    prob200 = prob200 / 100,
    probP1 = probP1 / 100,
  ];

  // Passo 3: Gerar um número baseado nas probabilidades
  double randomValue = math.Random().nextDouble();
  double cumulativeProbability = 0.0;

  for (int i = 0; i < probabilities.length; i++) {
    cumulativeProbability += probabilities[i];
    if (randomValue <= cumulativeProbability) {
      // Gerar um número dentro do intervalo do produto selecionado
      double minTurn = productRanges[i + 1]![0];
      double maxTurn = productRanges[i + 1]![1];
      return minTurn + (maxTurn - minTurn) * math.Random().nextDouble();
    }
  }

  // Retorno padrão (caso não caia em nenhum intervalo, mas isso não deve acontecer)
  return null;
}

int addNumber(
  int num1,
  int num2,
) {
  return num1 + num2;
}

int chancesRestantes(int points) {
  return points ~/ 250;
}
