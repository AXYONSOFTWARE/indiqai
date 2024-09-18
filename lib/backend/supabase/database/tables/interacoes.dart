import '../database.dart';

class InteracoesTable extends SupabaseTable<InteracoesRow> {
  @override
  String get tableName => 'interacoes';

  @override
  InteracoesRow createRow(Map<String, dynamic> data) => InteracoesRow(data);
}

class InteracoesRow extends SupabaseDataRow {
  InteracoesRow(super.data);

  @override
  SupabaseTable get table => InteracoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get clientId => getField<String>('client_id');
  set clientId(String? value) => setField<String>('client_id', value);

  int? get empresaId => getField<int>('empresa_id');
  set empresaId(int? value) => setField<int>('empresa_id', value);

  int? get interactionCount => getField<int>('interaction_count');
  set interactionCount(int? value) => setField<int>('interaction_count', value);
}
