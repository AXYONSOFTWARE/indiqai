import '../database.dart';

class FormsTable extends SupabaseTable<FormsRow> {
  @override
  String get tableName => 'forms';

  @override
  FormsRow createRow(Map<String, dynamic> data) => FormsRow(data);
}

class FormsRow extends SupabaseDataRow {
  FormsRow(super.data);

  @override
  SupabaseTable get table => FormsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String get numeroCelular => getField<String>('numero_celular')!;
  set numeroCelular(String value) => setField<String>('numero_celular', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get idade => getField<String>('idade');
  set idade(String? value) => setField<String>('idade', value);

  String? get profissao => getField<String>('profissao');
  set profissao(String? value) => setField<String>('profissao', value);

  String? get avaliacaoAbordagemPromotoras =>
      getField<String>('avaliacao_abordagem_promotoras');
  set avaliacaoAbordagemPromotoras(String? value) =>
      setField<String>('avaliacao_abordagem_promotoras', value);

  String? get facilidadePrecadastro =>
      getField<String>('facilidade_precadastro');
  set facilidadePrecadastro(String? value) =>
      setField<String>('facilidade_precadastro', value);

  String? get facilidadeCadastroQrCode =>
      getField<String>('facilidade_cadastro_qr_code');
  set facilidadeCadastroQrCode(String? value) =>
      setField<String>('facilidade_cadastro_qr_code', value);

  String? get facilidadeNavegarPlataforma =>
      getField<String>('facilidade_navegar_plataforma');
  set facilidadeNavegarPlataforma(String? value) =>
      setField<String>('facilidade_navegar_plataforma', value);

  String? get conseguiuResgatarPremio =>
      getField<String>('conseguiu_resgatar_premio');
  set conseguiuResgatarPremio(String? value) =>
      setField<String>('conseguiu_resgatar_premio', value);

  String? get pontosPositivos => getField<String>('pontos_positivos');
  set pontosPositivos(String? value) =>
      setField<String>('pontos_positivos', value);

  String? get pontosMelhorar => getField<String>('pontos_melhorar');
  set pontosMelhorar(String? value) =>
      setField<String>('pontos_melhorar', value);

  String? get melhorarResgatePremio =>
      getField<String>('melhorar_resgate_premio');
  set melhorarResgatePremio(String? value) =>
      setField<String>('melhorar_resgate_premio', value);

  String? get opiniaoPremiosRestaurantes =>
      getField<String>('opiniao_premios_restaurantes');
  set opiniaoPremiosRestaurantes(String? value) =>
      setField<String>('opiniao_premios_restaurantes', value);

  String? get premiosAtenderamExpectativas =>
      getField<String>('premios_atenderam_expectativas');
  set premiosAtenderamExpectativas(String? value) =>
      setField<String>('premios_atenderam_expectativas', value);

  String? get recomendariaPlataforma =>
      getField<String>('recomendaria_plataforma');
  set recomendariaPlataforma(String? value) =>
      setField<String>('recomendaria_plataforma', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
