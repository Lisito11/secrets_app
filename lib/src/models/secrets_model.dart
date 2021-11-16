class Secret{
  String name;
  String date;
  String description;
  String image;
  String audio;

  Secret({this.name, this.date, this.description,this.image,this.audio});

  factory Secret.fromJson(Map<dynamic, dynamic> parseJson){
    return Secret(
      name: parseJson['name'],
      date: parseJson['date'],
      description: parseJson['description'],
      image: parseJson['image'],
      audio: parseJson['audio'],
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'date': date,
      'description': description,
      'image': image,
      'audio': audio,
    };
  }
}

class SecretList{
  List<Secret> secrets;
  SecretList({this.secrets});

  factory SecretList.fromList(List<dynamic> parsedJson){
    List<Secret> secrets = <Secret>[];
    secrets = parsedJson.map((i) => Secret.fromJson(i)).toList();
    return new SecretList(
      secrets: secrets,
    );
  }
}