// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.2.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/simple.dart';
import 'api/suggest.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'frb_generated.io.dart'
    if (dart.library.js_interop) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {
    await api.crateApiSimpleInitApp();
  }

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => '2.2.0';

  @override
  int get rustContentHash => -619482327;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'rust_lib_hitomi_search_plus',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  String crateApiSimpleGreet({required String name});

  Future<void> crateApiSimpleInitApp();

  Future<TagSuggest> crateApiSuggestTagSuggestNew({required String path});

  Future<TagsResult> crateApiSuggestTagSuggestSuggest(
      {required TagSuggest that, required String query});

  Future<TagsResult> crateApiSuggestTagSuggestSuggestWithType(
      {required TagSuggest that,
      required String query,
      required TagType tagType});

  int crateApiSuggestTagsResultAutoAccessorGetLen({required TagsResult that});

  void crateApiSuggestTagsResultAutoAccessorSetLen(
      {required TagsResult that, required int len});

  Future<TagsResult> crateApiSuggestTagsResultEmpty();

  Future<Tag> crateApiSuggestTagsResultGetTag(
      {required TagsResult that, required int index});

  Future<TagType?> crateApiSuggestTagTypeFromText({required String s});

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_TagSuggest;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_TagSuggest;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_TagSuggestPtr;

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_TagsResult;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_TagsResult;

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_TagsResultPtr;
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  String crateApiSimpleGreet({required String name}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(name, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 1)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_String,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleGreetConstMeta,
      argValues: [name],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleGreetConstMeta => const TaskConstMeta(
        debugName: "greet",
        argNames: ["name"],
      );

  @override
  Future<void> crateApiSimpleInitApp() {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 2, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleInitAppConstMeta,
      argValues: [],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleInitAppConstMeta => const TaskConstMeta(
        debugName: "init_app",
        argNames: [],
      );

  @override
  Future<TagSuggest> crateApiSuggestTagSuggestNew({required String path}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(path, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 3, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData:
            sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest,
        decodeErrorData: sse_decode_AnyhowException,
      ),
      constMeta: kCrateApiSuggestTagSuggestNewConstMeta,
      argValues: [path],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSuggestTagSuggestNewConstMeta =>
      const TaskConstMeta(
        debugName: "TagSuggest_new",
        argNames: ["path"],
      );

  @override
  Future<TagsResult> crateApiSuggestTagSuggestSuggest(
      {required TagSuggest that, required String query}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
            that, serializer);
        sse_encode_String(query, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 4, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData:
            sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSuggestTagSuggestSuggestConstMeta,
      argValues: [that, query],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSuggestTagSuggestSuggestConstMeta =>
      const TaskConstMeta(
        debugName: "TagSuggest_suggest",
        argNames: ["that", "query"],
      );

  @override
  Future<TagsResult> crateApiSuggestTagSuggestSuggestWithType(
      {required TagSuggest that,
      required String query,
      required TagType tagType}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
            that, serializer);
        sse_encode_String(query, serializer);
        sse_encode_tag_type(tagType, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 5, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData:
            sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSuggestTagSuggestSuggestWithTypeConstMeta,
      argValues: [that, query, tagType],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSuggestTagSuggestSuggestWithTypeConstMeta =>
      const TaskConstMeta(
        debugName: "TagSuggest_suggest_with_type",
        argNames: ["that", "query", "tagType"],
      );

  @override
  int crateApiSuggestTagsResultAutoAccessorGetLen({required TagsResult that}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
            that, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 6)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_i_32,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSuggestTagsResultAutoAccessorGetLenConstMeta,
      argValues: [that],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSuggestTagsResultAutoAccessorGetLenConstMeta =>
      const TaskConstMeta(
        debugName: "TagsResult_auto_accessor_get_len",
        argNames: ["that"],
      );

  @override
  void crateApiSuggestTagsResultAutoAccessorSetLen(
      {required TagsResult that, required int len}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
            that, serializer);
        sse_encode_i_32(len, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 7)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSuggestTagsResultAutoAccessorSetLenConstMeta,
      argValues: [that, len],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSuggestTagsResultAutoAccessorSetLenConstMeta =>
      const TaskConstMeta(
        debugName: "TagsResult_auto_accessor_set_len",
        argNames: ["that", "len"],
      );

  @override
  Future<TagsResult> crateApiSuggestTagsResultEmpty() {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 8, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData:
            sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSuggestTagsResultEmptyConstMeta,
      argValues: [],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSuggestTagsResultEmptyConstMeta =>
      const TaskConstMeta(
        debugName: "TagsResult_empty",
        argNames: [],
      );

  @override
  Future<Tag> crateApiSuggestTagsResultGetTag(
      {required TagsResult that, required int index}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
            that, serializer);
        sse_encode_i_32(index, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 9, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_tag,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSuggestTagsResultGetTagConstMeta,
      argValues: [that, index],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSuggestTagsResultGetTagConstMeta =>
      const TaskConstMeta(
        debugName: "TagsResult_get_tag",
        argNames: ["that", "index"],
      );

  @override
  Future<TagType?> crateApiSuggestTagTypeFromText({required String s}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(s, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 10, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_opt_box_autoadd_tag_type,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSuggestTagTypeFromTextConstMeta,
      argValues: [s],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSuggestTagTypeFromTextConstMeta =>
      const TaskConstMeta(
        debugName: "tag_type_from_text",
        argNames: ["s"],
      );

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_TagSuggest => wire
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_TagSuggest => wire
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest;

  RustArcIncrementStrongCountFnType
      get rust_arc_increment_strong_count_TagsResult => wire
          .rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult;

  RustArcDecrementStrongCountFnType
      get rust_arc_decrement_strong_count_TagsResult => wire
          .rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return AnyhowException(raw as String);
  }

  @protected
  TagSuggest
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return TagSuggestImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  TagsResult
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return TagsResultImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  TagsResult
      dco_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return TagsResultImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  TagSuggest
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return TagSuggestImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  TagsResult
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return TagsResultImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  TagSuggest
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return TagSuggestImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  TagsResult
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return TagsResultImpl.frbInternalDcoDecode(raw as List<dynamic>);
  }

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  TagType dco_decode_box_autoadd_tag_type(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dco_decode_tag_type(raw);
  }

  @protected
  int dco_decode_i_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  TagType? dco_decode_opt_box_autoadd_tag_type(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw == null ? null : dco_decode_box_autoadd_tag_type(raw);
  }

  @protected
  Tag dco_decode_tag(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 3)
      throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return Tag(
      tagType: dco_decode_tag_type(arr[0]),
      name: dco_decode_String(arr[1]),
      count: dco_decode_u_32(arr[2]),
    );
  }

  @protected
  TagType dco_decode_tag_type(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return TagType.values[raw as int];
  }

  @protected
  int dco_decode_u_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  BigInt dco_decode_usize(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeU64(raw);
  }

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_String(deserializer);
    return AnyhowException(inner);
  }

  @protected
  TagSuggest
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return TagSuggestImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  TagsResult
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return TagsResultImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  TagsResult
      sse_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return TagsResultImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  TagSuggest
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return TagSuggestImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  TagsResult
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return TagsResultImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  TagSuggest
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return TagSuggestImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  TagsResult
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return TagsResultImpl.frbInternalSseDecode(
        sse_decode_usize(deserializer), sse_decode_i_32(deserializer));
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  TagType sse_decode_box_autoadd_tag_type(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return (sse_decode_tag_type(deserializer));
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  TagType? sse_decode_opt_box_autoadd_tag_type(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    if (sse_decode_bool(deserializer)) {
      return (sse_decode_box_autoadd_tag_type(deserializer));
    } else {
      return null;
    }
  }

  @protected
  Tag sse_decode_tag(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_tagType = sse_decode_tag_type(deserializer);
    var var_name = sse_decode_String(deserializer);
    var var_count = sse_decode_u_32(deserializer);
    return Tag(tagType: var_tagType, name: var_name, count: var_count);
  }

  @protected
  TagType sse_decode_tag_type(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_i_32(deserializer);
    return TagType.values[inner];
  }

  @protected
  int sse_decode_u_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint32();
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getBigUint64();
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_String(self.message, serializer);
  }

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
          TagSuggest self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as TagSuggestImpl).frbInternalSseEncode(move: true), serializer);
  }

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          TagsResult self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as TagsResultImpl).frbInternalSseEncode(move: true), serializer);
  }

  @protected
  void
      sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          TagsResult self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as TagsResultImpl).frbInternalSseEncode(move: false), serializer);
  }

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
          TagSuggest self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as TagSuggestImpl).frbInternalSseEncode(move: false), serializer);
  }

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          TagsResult self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as TagsResultImpl).frbInternalSseEncode(move: false), serializer);
  }

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagSuggest(
          TagSuggest self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as TagSuggestImpl).frbInternalSseEncode(move: null), serializer);
  }

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTagsResult(
          TagsResult self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_usize(
        (self as TagsResultImpl).frbInternalSseEncode(move: null), serializer);
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_box_autoadd_tag_type(TagType self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_tag_type(self, serializer);
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_opt_box_autoadd_tag_type(
      TagType? self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    sse_encode_bool(self != null, serializer);
    if (self != null) {
      sse_encode_box_autoadd_tag_type(self, serializer);
    }
  }

  @protected
  void sse_encode_tag(Tag self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_tag_type(self.tagType, serializer);
    sse_encode_String(self.name, serializer);
    sse_encode_u_32(self.count, serializer);
  }

  @protected
  void sse_encode_tag_type(TagType self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.index, serializer);
  }

  @protected
  void sse_encode_u_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint32(self);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putBigUint64(self);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }
}

@sealed
class TagSuggestImpl extends RustOpaque implements TagSuggest {
  // Not to be used by end users
  TagSuggestImpl.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  TagSuggestImpl.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_TagSuggest,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_TagSuggest,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_TagSuggestPtr,
  );

  Future<TagsResult> suggest({required String query}) => RustLib.instance.api
      .crateApiSuggestTagSuggestSuggest(that: this, query: query);

  Future<TagsResult> suggestWithType(
          {required String query, required TagType tagType}) =>
      RustLib.instance.api.crateApiSuggestTagSuggestSuggestWithType(
          that: this, query: query, tagType: tagType);
}

@sealed
class TagsResultImpl extends RustOpaque implements TagsResult {
  // Not to be used by end users
  TagsResultImpl.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  TagsResultImpl.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_TagsResult,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_TagsResult,
    rustArcDecrementStrongCountPtr:
        RustLib.instance.api.rust_arc_decrement_strong_count_TagsResultPtr,
  );

  int get len =>
      RustLib.instance.api.crateApiSuggestTagsResultAutoAccessorGetLen(
        that: this,
      );

  set len(int len) => RustLib.instance.api
      .crateApiSuggestTagsResultAutoAccessorSetLen(that: this, len: len);

  Future<Tag> getTag({required int index}) => RustLib.instance.api
      .crateApiSuggestTagsResultGetTag(that: this, index: index);
}