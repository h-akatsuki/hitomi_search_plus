import 'package:hitomi_search_plus/hitomi/gallery.dart';
import 'package:hitomi_search_plus/hitomi/gg.dart';

int hexToInt(int hex) => int.parse(String.fromCharCode(hex), radix: 16);

String _realFullPathFromHash(String hash) {
  List<int> bytes = hash.codeUnits;
  int len = bytes.length;
  if (len < 3) {
    return hash;
  }

  String lastChar = String.fromCharCode(bytes[len - 1]);
  String secondLast = String.fromCharCode(bytes[len - 2]);
  String thirdLast = String.fromCharCode(bytes[len - 3]);
  return "$lastChar/$thirdLast$secondLast/$hash";
}

extension CommonExt on GGJS {
  String subdomainFromUrl(String url, [String base = "b"]) {
    var retval = base;
    url.split("/").forEach((part) {
      var subParts = part.split(".");
      if (subParts.isNotEmpty) {
        var bytes = subParts[0].codeUnits;
        if (bytes.length > 63) {
          var len = bytes.length;
          var a = bytes[len - 1];
          var b = bytes[len - 2];
          var c = bytes[len - 3];
          var num = hexToInt(a) * 256 + hexToInt(b) + hexToInt(c) * 16;
          retval = String.fromCharCode(97 + m.m(num)) + retval;
        }
      }
    });
    return retval;
  }

  String fullPathFromHash(String hash) => "$b/${s(hash)}/$hash";

  String urlFromHash(File image, [String? dir, String? ext]) {
    String extension;
    try {
      extension = ext ?? dir ?? image.name.split('.').last;
    } catch (e) {
      extension = "jpg";
    }
    var directory = dir ?? "images";
    return "https://a.hitomi.la/$directory/${fullPathFromHash(image.hash)}.$extension";
  }

  String urlFromUrl(String url, String base) {
    var startPattern = ".hitomi.la/";
    var index = url.indexOf(startPattern);
    if (index != -1) {
      var end = url.substring(index + startPattern.length - 1);
      var subdomain = subdomainFromUrl(url, base);
      return "https://$subdomain.hitomi.la$end";
    }
    return url;
  }

  String urlFromUrlFromHash(File image, String dir,
      [String? ext, String base = "tn"]) {
    if (base == "tn") {
      return urlFromUrl(
          "https://a.hitomi.la/$dir/${_realFullPathFromHash(image.hash)}.${ext ?? "jpg"}",
          base);
    }
    return urlFromUrl(urlFromHash(image, dir, ext), base);
  }

  String imgUrl(File image, ImgType imgType) =>
      urlFromUrlFromHash(image, imgType.dir, imgType.ext, imgType.base);
}

class ImgType {
  final String dir;
  final String? ext;
  final String base;

  static const bigThumb = ImgType(dir: "webpbigtn", base: "tn", ext: "webp");
  static const smallSmallThumb =
      ImgType(dir: "webpsmallsmalltn", base: "tn", ext: "webp");
  static const smallThumb = ImgType(dir: "webpsmalltn", base: "tn", ext: "webp");
  static const webp = ImgType(dir: "webp", base: "a", ext: "webp");
  static const avif = ImgType(dir: "avif", base: "a");


  const ImgType({required this.dir, this.ext, required this.base});
}

