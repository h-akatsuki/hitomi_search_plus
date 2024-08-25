import 'package:hitomi_search_plus/db/kv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'user.g.dart';

const key = 'user_uuid';

@riverpod
class UserUUID extends _$UserUUID {
  @override
  Future<String> build() async {
    final res = await getKV(key);

    if (res == null) {
      final uuid = const Uuid().v4();
      await setKV(key, uuid);
      return uuid;
    }

    return res;
  }

  Future<void> set(String data) async {
    if (data.isEmpty) {
      return;
    }
    state = AsyncData(data);
    await setKV(key, data);
  }
}