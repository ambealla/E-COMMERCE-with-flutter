import 'dart:core';
import "dart:convert";
import 'dart:core';


final imageList = [
  'https://img.alicdn.com/tfs/TB1x8x9eEY1gK0jSZFMXXaWcVXa-990-400.jpg',
  'https://img.alicdn.com/tfs/TB1e.XyReL2gK0jSZFmXXc7iXXa-990-400.png',
  'https://img.alicdn.com/imgextra/i4/O1CN01y7S22X1mJosJiYZI7_!!6000000004934-0-tps-990-400.jpg',
  'https://s.alicdn.com/@banner/montage/236295-cd4ed91a4efb9a41ed63a75fb558f1fa.jpg?content=%7B%2211%22%3A%7B%22attrs%22%3A%7B%22mini%22%3Afalse%2C%22value%22%3A%22https%3A%2F%2Fs.alicdn.com%2F%40sc04%2Fkf%2FHTB1rrinaN_rK1RkHFqD761JAFXaK.png_300x300.png%22%7D%7D%2C%223%22%3A%7B%22attrs%22%3A%7B%22verticalAlign%22%3A%22top%22%2C%22mini%22%3Afalse%2C%22fontSize%22%3A%221000%22%2C%22align%22%3A%22left%22%2C%22value%22%3A%22https%3A%2F%2Fimg.alicdn.com%2Fimgextra%2Fi2%2FO1CN01PSy1dU1WBXsFAjUpT_%21%216000000002750-0-tps-990-400.jpg%22%7D%7D%7D&channel=25',
"https://ae01.alicdn.com/kf/H08a790fe152a4307b31c2ae64971c724V.jpg_Q90.jpg_.webp"];
class StubData {
  static final StubData _singleton = StubData._internal();

  factory StubData() {
    return _singleton;
  }

  StubData._internal();

  List<List<String>> get Categories =>
      [["All","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ44_e54LLVVwH74dLlqS2DboRWATfa2dnuSg&usqp=CAU"],
       ["electronique","https://groupealliancemali.files.wordpress.com/2019/01/terranuova.jpg"] ,
        ["vetement","https://media.istockphoto.com/photos/high-class-female-clothing-picture-id155596905?s=612x612"],
        ["sport","https://www.numero-dix.fr/content/galleries/accueil/equipements2.jpg"],
        ["beaute","https://cdn.shopify.com/s/files/1/0070/3587/9494/articles/attitude-image-blogue-produits-beaute-naturel_1024x1024.jpg?v=1592921980"],
        ["game","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH7o8MQKOSf00nonrSi6DHETqtb9ONP5Do66hIkfFi4W-VqeajtF3gI2wvUFQMd-h-nVk&usqp=CAU"]];
}
