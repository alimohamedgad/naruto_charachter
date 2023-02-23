//
class CharacterModel {
  late final String name;
  late final List<dynamic> imgs;
  late final List<dynamic> about;
  late final InfoModel info;

  CharacterModel.fromJson(json) {
    name = json['name'];
    imgs = json['images'];
    about = json['about'];
    info = InfoModel.fromJson(json['info']);
  }
  
toJson(){
  return {
   'name' : name,
   'imgs' : imgs,
   'about' : about,
  };
}

}

class InfoModel {
  late final String sex;
  late final String affiliation;


  InfoModel.fromJson(json) {
    sex = json['Sexo'];
    affiliation = json['Afiliação'];
  }
}
