// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CpfStruct extends FFFirebaseStruct {
  CpfStruct({
    int? whatsapp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _whatsapp = whatsapp,
        super(firestoreUtilData);

  // "whatsapp" field.
  int? _whatsapp;
  int get whatsapp => _whatsapp ?? 0;
  set whatsapp(int? val) => _whatsapp = val;

  void incrementWhatsapp(int amount) => whatsapp = whatsapp + amount;

  bool hasWhatsapp() => _whatsapp != null;

  static CpfStruct fromMap(Map<String, dynamic> data) => CpfStruct(
        whatsapp: castToType<int>(data['whatsapp']),
      );

  static CpfStruct? maybeFromMap(dynamic data) =>
      data is Map ? CpfStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'whatsapp': _whatsapp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'whatsapp': serializeParam(
          _whatsapp,
          ParamType.int,
        ),
      }.withoutNulls;

  static CpfStruct fromSerializableMap(Map<String, dynamic> data) => CpfStruct(
        whatsapp: deserializeParam(
          data['whatsapp'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CpfStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CpfStruct && whatsapp == other.whatsapp;
  }

  @override
  int get hashCode => const ListEquality().hash([whatsapp]);
}

CpfStruct createCpfStruct({
  int? whatsapp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CpfStruct(
      whatsapp: whatsapp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CpfStruct? updateCpfStruct(
  CpfStruct? cpf, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cpf
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCpfStructData(
  Map<String, dynamic> firestoreData,
  CpfStruct? cpf,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cpf == null) {
    return;
  }
  if (cpf.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && cpf.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cpfData = getCpfFirestoreData(cpf, forFieldValue);
  final nestedData = cpfData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cpf.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCpfFirestoreData(
  CpfStruct? cpf, [
  bool forFieldValue = false,
]) {
  if (cpf == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cpf.toMap());

  // Add any Firestore field values
  cpf.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCpfListFirestoreData(
  List<CpfStruct>? cpfs,
) =>
    cpfs?.map((e) => getCpfFirestoreData(e, true)).toList() ?? [];
