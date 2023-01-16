/// cpf : "01"
/// dataNascimento : "01-07-2022"
/// email : ""
/// endereço : ""
/// faculdadeAnexo : ""
/// nome : ""
/// nomeCompleto : ""
/// numeroMatriculaFaculdade : ""
/// rg : ""
/// rgAnexo : ""

class UserModel {
  UserModel({
      this.cpf, 
      this.dataNascimento, 
      this.email, 
      this.endereco,
      this.faculdadeAnexo, 
      this.nome, 
      this.nomeCompleto, 
      this.numeroMatriculaFaculdade, 
      this.rg, 
      this.rgAnexo,});

  UserModel.fromJson(dynamic json) {
    cpf = json['cpf'];
    dataNascimento = json['dataNascimento'];
    email = json['email'];
    endereco = json['endereco'];
    faculdadeAnexo = json['faculdadeAnexo'];
    nome = json['nome'];
    nomeCompleto = json['nomeCompleto'];
    numeroMatriculaFaculdade = json['numeroMatriculaFaculdade'];
    rg = json['rg'];
    rgAnexo = json['rgAnexo'];
  }
  String? cpf;
  String? dataNascimento;
  String? email;
  String? endereco;
  String? faculdadeAnexo;
  String? nome;
  String? nomeCompleto;
  String? numeroMatriculaFaculdade;
  String? rg;
  String? rgAnexo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cpf'] = cpf;
    map['dataNascimento'] = dataNascimento;
    map['email'] = email;
    map['endereço'] = endereco;
    map['faculdadeAnexo'] = faculdadeAnexo;
    map['nome'] = nome;
    map['nomeCompleto'] = nomeCompleto;
    map['numeroMatriculaFaculdade'] = numeroMatriculaFaculdade;
    map['rg'] = rg;
    map['rgAnexo'] = rgAnexo;
    return map;
  }

}