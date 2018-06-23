{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Text.DescriptorProtos.EnumOptions (EnumOptions(..)) where
import Prelude ((+), (/), (==), (<=), (&&))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Text.DescriptorProtos.UninterpretedOption as DescriptorProtos (UninterpretedOption)

data EnumOptions = EnumOptions{allow_alias :: !(P'.Maybe P'.Bool), deprecated :: !(P'.Maybe P'.Bool),
                               uninterpreted_option :: !(P'.Seq DescriptorProtos.UninterpretedOption), ext'field :: !(P'.ExtField),
                               unknown'field :: !(P'.UnknownField)}
                   deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ExtendMessage EnumOptions where
  getExtField = ext'field
  putExtField e'f msg = msg{ext'field = e'f}
  validExtRanges msg = P'.extRanges (P'.reflectDescriptorInfo msg)

instance P'.UnknownMessage EnumOptions where
  getUnknownField = unknown'field
  putUnknownField u'f msg = msg{unknown'field = u'f}

instance P'.Mergeable EnumOptions where
  mergeAppend (EnumOptions x'1 x'2 x'3 x'4 x'5) (EnumOptions y'1 y'2 y'3 y'4 y'5)
   = EnumOptions (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)

instance P'.Default EnumOptions where
  defaultValue = EnumOptions P'.defaultValue (Prelude'.Just Prelude'.False) P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire EnumOptions where
  wireSize ft' self'@(EnumOptions x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeOpt 1 8 x'1 + P'.wireSizeOpt 1 8 x'2 + P'.wireSizeRep 2 11 x'3 + P'.wireSizeExtField x'4 +
             P'.wireSizeUnknownField x'5)
  wirePutWithSize ft' self'@(EnumOptions x'1 x'2 x'3 x'4 x'5)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 16 8 x'1, P'.wirePutOptWithSize 24 8 x'2, P'.wirePutRepWithSize 7994 11 x'3,
             P'.wirePutExtFieldWithSize x'4, P'.wirePutUnknownFieldWithSize x'5]
        put'FieldsSized
         = let size' = Prelude'.fst (P'.runPutM put'Fields)
               put'Size
                = do
                    P'.putSize size'
                    Prelude'.return (P'.size'WireSize size')
            in P'.sequencePutWithSize [put'Fields, put'Size]
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith (P'.catch'Unknown update'Self)
       11 -> P'.getMessageWith (P'.catch'Unknown update'Self)
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{allow_alias = Prelude'.Just new'Field}) (P'.wireGet 8)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{deprecated = Prelude'.Just new'Field}) (P'.wireGet 8)
             7994 -> Prelude'.fmap
                      (\ !new'Field -> old'Self{uninterpreted_option = P'.append (uninterpreted_option old'Self) new'Field})
                      (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in
                   if Prelude'.or [1000 <= field'Number && field'Number <= 18999, 20000 <= field'Number] then
                    P'.loadExtension field'Number wire'Type old'Self else P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> EnumOptions) EnumOptions where
  getVal m' f' = f' m'

instance P'.GPB EnumOptions

instance P'.ReflectDescriptor EnumOptions where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [16, 24, 7994])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".google.protobuf.EnumOptions\", haskellPrefix = [MName \"Text\"], parentModule = [MName \"DescriptorProtos\"], baseName = MName \"EnumOptions\"}, descFilePath = [\"Text\",\"DescriptorProtos\",\"EnumOptions.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.EnumOptions.allow_alias\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"EnumOptions\"], baseName' = FName \"allow_alias\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.EnumOptions.deprecated\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"EnumOptions\"], baseName' = FName \"deprecated\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.EnumOptions.uninterpreted_option\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"EnumOptions\"], baseName' = FName \"uninterpreted_option\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 999}, wireTag = WireTag {getWireTag = 7994}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".google.protobuf.UninterpretedOption\", haskellPrefix = [MName \"Text\"], parentModule = [MName \"DescriptorProtos\"], baseName = MName \"UninterpretedOption\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [(FieldId {getFieldId = 1000},FieldId {getFieldId = 18999}),(FieldId {getFieldId = 20000},FieldId {getFieldId = 536870911})], knownKeys = fromList [], storeUnknown = True, lazyFields = False, makeLenses = False}"

instance P'.TextType EnumOptions where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg EnumOptions where
  textPut msg
   = do
       P'.tellT "allow_alias" (allow_alias msg)
       P'.tellT "deprecated" (deprecated msg)
       P'.tellT "uninterpreted_option" (uninterpreted_option msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'allow_alias, parse'deprecated, parse'uninterpreted_option]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
        parse'allow_alias
         = P'.try
            (do
               v <- P'.getT "allow_alias"
               Prelude'.return (\ o -> o{allow_alias = v}))
        parse'deprecated
         = P'.try
            (do
               v <- P'.getT "deprecated"
               Prelude'.return (\ o -> o{deprecated = v}))
        parse'uninterpreted_option
         = P'.try
            (do
               v <- P'.getT "uninterpreted_option"
               Prelude'.return (\ o -> o{uninterpreted_option = P'.append (uninterpreted_option o) v}))