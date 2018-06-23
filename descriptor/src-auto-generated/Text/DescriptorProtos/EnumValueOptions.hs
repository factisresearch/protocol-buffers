{-# LANGUAGE BangPatterns, DeriveDataTypeable, DeriveGeneric, FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC  -fno-warn-unused-imports #-}
module Text.DescriptorProtos.EnumValueOptions (EnumValueOptions(..)) where
import Prelude ((+), (/), (==), (<=), (&&))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified GHC.Generics as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Text.DescriptorProtos.UninterpretedOption as DescriptorProtos (UninterpretedOption)

data EnumValueOptions = EnumValueOptions{deprecated :: !(P'.Maybe P'.Bool),
                                         uninterpreted_option :: !(P'.Seq DescriptorProtos.UninterpretedOption),
                                         ext'field :: !(P'.ExtField), unknown'field :: !(P'.UnknownField)}
                        deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data, Prelude'.Generic)

instance P'.ExtendMessage EnumValueOptions where
  getExtField = ext'field
  putExtField e'f msg = msg{ext'field = e'f}
  validExtRanges msg = P'.extRanges (P'.reflectDescriptorInfo msg)

instance P'.UnknownMessage EnumValueOptions where
  getUnknownField = unknown'field
  putUnknownField u'f msg = msg{unknown'field = u'f}

instance P'.Mergeable EnumValueOptions where
  mergeAppend (EnumValueOptions x'1 x'2 x'3 x'4) (EnumValueOptions y'1 y'2 y'3 y'4)
   = EnumValueOptions (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)

instance P'.Default EnumValueOptions where
  defaultValue = EnumValueOptions (Prelude'.Just Prelude'.False) P'.defaultValue P'.defaultValue P'.defaultValue

instance P'.Wire EnumValueOptions where
  wireSize ft' self'@(EnumValueOptions x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeOpt 1 8 x'1 + P'.wireSizeRep 2 11 x'2 + P'.wireSizeExtField x'3 + P'.wireSizeUnknownField x'4)
  wirePutWithSize ft' self'@(EnumValueOptions x'1 x'2 x'3 x'4)
   = case ft' of
       10 -> put'Fields
       11 -> put'FieldsSized
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = P'.sequencePutWithSize
            [P'.wirePutOptWithSize 8 8 x'1, P'.wirePutRepWithSize 7994 11 x'2, P'.wirePutExtFieldWithSize x'3,
             P'.wirePutUnknownFieldWithSize x'4]
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
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{deprecated = Prelude'.Just new'Field}) (P'.wireGet 8)
             7994 -> Prelude'.fmap
                      (\ !new'Field -> old'Self{uninterpreted_option = P'.append (uninterpreted_option old'Self) new'Field})
                      (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in
                   if Prelude'.or [1000 <= field'Number && field'Number <= 18999, 20000 <= field'Number] then
                    P'.loadExtension field'Number wire'Type old'Self else P'.unknown field'Number wire'Type old'Self

instance P'.MessageAPI msg' (msg' -> EnumValueOptions) EnumValueOptions where
  getVal m' f' = f' m'

instance P'.GPB EnumValueOptions

instance P'.ReflectDescriptor EnumValueOptions where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [8, 7994])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".google.protobuf.EnumValueOptions\", haskellPrefix = [MName \"Text\"], parentModule = [MName \"DescriptorProtos\"], baseName = MName \"EnumValueOptions\"}, descFilePath = [\"Text\",\"DescriptorProtos\",\"EnumValueOptions.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.EnumValueOptions.deprecated\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"EnumValueOptions\"], baseName' = FName \"deprecated\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Just \"false\", hsDefault = Just (HsDef'Bool False)},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".google.protobuf.EnumValueOptions.uninterpreted_option\", haskellPrefix' = [MName \"Text\"], parentModule' = [MName \"DescriptorProtos\",MName \"EnumValueOptions\"], baseName' = FName \"uninterpreted_option\", baseNamePrefix' = \"\"}, fieldNumber = FieldId {getFieldId = 999}, wireTag = WireTag {getWireTag = 7994}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".google.protobuf.UninterpretedOption\", haskellPrefix = [MName \"Text\"], parentModule = [MName \"DescriptorProtos\"], baseName = MName \"UninterpretedOption\"}), hsRawDefault = Nothing, hsDefault = Nothing}], descOneofs = fromList [], keys = fromList [], extRanges = [(FieldId {getFieldId = 1000},FieldId {getFieldId = 18999}),(FieldId {getFieldId = 20000},FieldId {getFieldId = 536870911})], knownKeys = fromList [], storeUnknown = True, lazyFields = False, makeLenses = False}"

instance P'.TextType EnumValueOptions where
  tellT = P'.tellSubMessage
  getT = P'.getSubMessage

instance P'.TextMsg EnumValueOptions where
  textPut msg
   = do
       P'.tellT "deprecated" (deprecated msg)
       P'.tellT "uninterpreted_option" (uninterpreted_option msg)
  textGet
   = do
       mods <- P'.sepEndBy (P'.choice [parse'deprecated, parse'uninterpreted_option]) P'.spaces
       Prelude'.return (Prelude'.foldl (\ v f -> f v) P'.defaultValue mods)
    where
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