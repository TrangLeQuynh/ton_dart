import 'package:ton_dart/src/boc/boc.dart';

class TonNftConst {
  static const int mintNFtOperationId = 1;
  static const int batchMintNFtOperationId = 2;
  static const int changeCollectionOwnerOperationId = 3;
  static const int changeContent = 4;

  static const int nftTransferOperationId = 0x5fcc3d14;
  static const int getStaticDataOperationId = 0x2fcb26a2;

  /// -1
  static const String _nftCollectionEditableTestnet =
      "b5ee9c724102140100021f000114ff00f4a413f4bcf2c80b01020162090202012004030025bc82df6a2687d20699fea6a6a182de86a182c402012008050201200706002db4f47da89a1f481a67fa9a9a86028be09e008fe03e00b0002fb5dafda89a1f481a67fa9a9a860d883a1a61fa61ff4806100043b8b5d31ed44d0fa40d33fd4d4d43010245f04d0d431d430d071c8cb0701cf16ccc980202cd0f0a0201200c0b003d45af0047f21f005778018c8cb0558cf165004fa0213cb6b12ccccc971fb0080201200e0d001b3e401d3232c084b281f2fff27420002d007232cffe0a33c5b25c083232c044fd003d0032c0326004e7d10638048adf000e8698180b8d848adf07d201800e98fe99ff6a2687d20699fea6a6a184108349e9ca829405d47141baf8280e8410854658056b84008646582a802e78b127d010a65b509e58fe59f80e78b64c0207d80701b28b9e382f970c892e000f18112e001718112e001f181181981e002413121110003c8e15d4d43010344130c85005cf1613cb3fccccccc9ed54e05f04840ff2f0002c323401fa40304144c85005cf1613cb3fccccccc9ed5400a6357003d4308e378040f4966fa5208e2906a4208100fabe93f2c18fde81019321a05325bbf2f402fa00d43022544b30f00623ba9302a402de04926c21e2b3e6303250444313c85005cf1613cb3fccccccc9ed5400603502d33f5313bbf2e1925313ba01fa00d43028103459f0068e1201a44343c85005cf1613cb3fccccccc9ed54925f05e2a05cef1c";
  static const String _nftCollectionTestnet =
      "b5ee9c72410213010001fe000114ff00f4a413f4bcf2c80b01020162090202012004030025bc82df6a2687d20699fea6a6a182de86a182c402012008050201200706002db4f47da89a1f481a67fa9a9a86028be09e008fe03e00b0002fb5dafda89a1f481a67fa9a9a860d883a1a61fa61ff4806100043b8b5d31ed44d0fa40d33fd4d4d43010245f04d0d431d430d071c8cb0701cf16ccc980202cd0f0a0201200c0b003d45af0047f21f005778018c8cb0558cf165004fa0213cb6b12ccccc971fb0080201200e0d001b3e401d3232c084b281f2fff27420002d007232cffe0a33c5b25c083232c044fd003d0032c0326003ebd10638048adf000e8698180b8d848adf07d201800e98fe99ff6a2687d20699fea6a6a184108349e9ca829405d47141baf8280e8410854658056b84008646582a802e78b127d010a65b509e58fe59f80e78b64c0207d80701b28b9e382f970c892e000f18112e001718119026001f1812f82c207f9784121110002801fa40304144c85005cf1613cb3fccccccc9ed5400a6357003d4308e378040f4966fa5208e2906a4208100fabe93f2c18fde81019321a05325bbf2f402fa00d43022544b30f00623ba9302a402de04926c21e2b3e6303250444313c85005cf1613cb3fccccccc9ed5400603502d33f5313bbf2e1925313ba01fa00d43028103459f0068e1201a44343c85005cf1613cb3fccccccc9ed54925f05e265250766";
  static const String _nftItemTestnet =
      "b5ee9c7241020e010001dc000114ff00f4a413f4bcf2c80b0102016203020009a11f9fe0050202ce07040201200605001d00f232cfd633c58073c5b3327b5520003b3b513434cffe900835d27080269fc07e90350c04090408f80c1c165b5b60020120090800113e910c1feebcb8536002cf0c8871c02497c0f83434c0c05c6c2497c0f83e903e900c7e800c5c75c87e800c7e800c1cea6d003c00812ce3850c1b088d148cb1c17cb865407e90350c0408fc00f801b4c7f4cfe08417f30f45148c2eb8c08c0d0d0d4d60840bf2c9a884aeb8c097c12103fcbc200b0a00727082108b77173505c8cbff5004cf1610248040708010c8cb055007cf165005fa0215cb6a12cb1fcb3f226eb39458cf17019132e201c901fb0002ac3210375e3240135135c705f2e191fa4021f001fa40d20031fa0020d749c200f2e2c4820afaf0801ba121945315a0a1de22d70b01c300209206a19136e220c2fff2e1922194102a375be30d0293303234e30d5502f0030d0c006a26f0018210d53276db103744006d71708010c8cb055007cf165005fa0215cb6a12cb1fcb3f226eb39458cf17019132e201c901fb00007c821005138d91c85009cf16500bcf16712449145446a0708010c8cb055007cf165005fa0215cb6a12cb1fcb3f226eb39458cf17019132e201c901fb00104777bcf5e2";

  /// 0
  static const String _nftCollectionEditableMainnet =
      "b5ee9c724102140100021f000114ff00f4a413f4bcf2c80b01020162090202012004030025bc82df6a2687d20699fea6a6a182de86a182c402012008050201200706002db4f47da89a1f481a67fa9a9a86028be09e008e003e00b0002fb5dafda89a1f481a67fa9a9a860d883a1a61fa61ff4806100043b8b5d31ed44d0fa40d33fd4d4d43010245f04d0d431d430d071c8cb0701cf16ccc980202cd0f0a0201200c0b003d45af0047021f005778018c8cb0558cf165004fa0213cb6b12ccccc971fb0080201200e0d001b3e401d3232c084b281f2fff27420002d007232cffe0a33c5b25c083232c044fd003d0032c0326004e7d10638048adf000e8698180b8d848adf07d201800e98fe99ff6a2687d20699fea6a6a184108349e9ca829405d47141baf8280e8410854658056b84008646582a802e78b127d010a65b509e58fe59f80e78b64c0207d80701b28b9e382f970c892e000f18112e001718112e001f181181981e002413121110003c8e15d4d43010344130c85005cf1613cb3fccccccc9ed54e05f04840ff2f0002c323401fa40304144c85005cf1613cb3fccccccc9ed5400a6357003d4308e378040f4966fa5208e2906a4208100fabe93f2c18fde81019321a05325bbf2f402fa00d43022544b30f00623ba9302a402de04926c21e2b3e6303250444313c85005cf1613cb3fccccccc9ed5400603502d33f5313bbf2e1925313ba01fa00d43028103459f0068e1201a44343c85005cf1613cb3fccccccc9ed54925f05e237409ac9";
  static const String _nftCollectionMainnet =
      "b5ee9c72410213010001fe000114ff00f4a413f4bcf2c80b01020162090202012004030025bc82df6a2687d20699fea6a6a182de86a182c402012008050201200706002db4f47da89a1f481a67fa9a9a86028be09e008e003e00b0002fb5dafda89a1f481a67fa9a9a860d883a1a61fa61ff4806100043b8b5d31ed44d0fa40d33fd4d4d43010245f04d0d431d430d071c8cb0701cf16ccc980202cd0f0a0201200c0b003d45af0047021f005778018c8cb0558cf165004fa0213cb6b12ccccc971fb0080201200e0d001b3e401d3232c084b281f2fff27420002d007232cffe0a33c5b25c083232c044fd003d0032c0326003ebd10638048adf000e8698180b8d848adf07d201800e98fe99ff6a2687d20699fea6a6a184108349e9ca829405d47141baf8280e8410854658056b84008646582a802e78b127d010a65b509e58fe59f80e78b64c0207d80701b28b9e382f970c892e000f18112e001718119026001f1812f82c207f9784121110002801fa40304144c85005cf1613cb3fccccccc9ed5400a6357003d4308e378040f4966fa5208e2906a4208100fabe93f2c18fde81019321a05325bbf2f402fa00d43022544b30f00623ba9302a402de04926c21e2b3e6303250444313c85005cf1613cb3fccccccc9ed5400603502d33f5313bbf2e1925313ba01fa00d43028103459f0068e1201a44343c85005cf1613cb3fccccccc9ed54925f05e2eacd93bd";
  static const String _nftItemMainnet =
      "b5ee9c7241020e010001dc000114ff00f4a413f4bcf2c80b0102016203020009a11f9fe0050202ce07040201200605001d00f232cfd633c58073c5b3327b5520003b3b513434cffe900835d27080269fc07e90350c04090408f80c1c165b5b60020120090800113e910c1c2ebcb8536002cf0c8871c02497c0f83434c0c05c6c2497c0f83e903e900c7e800c5c75c87e800c7e800c1cea6d003c00812ce3850c1b088d148cb1c17cb865407e90350c0408fc00f801b4c7f4cfe08417f30f45148c2eb8c08c0d0d0d4d60840bf2c9a884aeb8c097c12103fcbc200b0a00727082108b77173505c8cbff5004cf1610248040708010c8cb055007cf165005fa0215cb6a12cb1fcb3f226eb39458cf17019132e201c901fb0002ac3210375e3240135135c705f2e191fa4021f001fa40d20031fa0020d749c200f2e2c4820afaf0801ba121945315a0a1de22d70b01c300209206a19136e220c2fff2e1922194102a375be30d0293303234e30d5502f0030d0c006a26f0018210d53276db103744006d71708010c8cb055007cf165005fa0215cb6a12cb1fcb3f226eb39458cf17019132e201c901fb00007c821005138d91c85009cf16500bcf16712449145446a0708010c8cb055007cf165005fa0215cb6a12cb1fcb3f226eb39458cf17019132e201c901fb0010470a6f5345";

  /// global
  static const String _nftMarketPlace =
      "b5ee9c7241010401006d000114ff00f4a413f4bcf2c80b0102012003020004f23000aad23221c700915be0d0d3030171b0915be0fa40ed44d0fa403012c705f2e19101d31f01c0018e2bfa003001d4d43021f90070c8ca07cbffc9d077748018c8cb05cb0258cf165004fa0213cb6bccccc971fb00915be294cd2f05";
  static const String _nftSale =
      "b5ee9c7241020a010001b4000114ff00f4a413f4bcf2c80b0102012003020004f2300201480504002fa03859da89a1f481f481f481f401a861a1f401f481f400610202cd080601f5d41081dcd650029285029185f7970e101e87d007d207d0018384008646582a804e78b28b9d090d0a85ad08a500afd010ae5b564b8fd80384008646582ac678b2803fd010b65b564b8fd80384008646582a802e78b00fd0109e5b564b8fd80381041082fe61e8a10c00c646582a802e78b117d010a65b509e58f8a407002acb3f22cf1658cf16ca0021fa02ca00c98100a0fb0001f7d00e8698180b8d8492f82707d201876a2687d207d207d207d006a18116ba4e10159c71d991b1b2990e382c92f837028916382f970fa01698fc1080289c6c8895d7970fae99f98fd2018201a642802e78b2801e78b00e78b00fd016664f6aa701363804c9b081b2299823878027003698fe99f9810e000c92f857010c0900c8c0029a3110471036454012f004e032363704c0038e4782103b9aca0015bef2e1c95312c70559c705b1f2e1ca702082105fcc3d14218010c8cb055006cf1622fa0215cb6a14cb1f14cb3f21cf1601cf16ca0021fa02ca00c98100a0fb00e05f06840ff2f0064ec29e";

  static Cell nftCollectionCode(int workchain) {
    if (workchain.isNegative) {
      return Cell.fromHex(_nftCollectionTestnet);
    }
    return Cell.fromHex(_nftCollectionMainnet);
  }

  static Cell nftItemCode(int workchain) {
    if (workchain.isNegative) {
      return Cell.fromHex(_nftItemTestnet);
    }
    return Cell.fromHex(_nftItemMainnet);
  }

  static Cell nftEditableCollectionCode(int workchain) {
    if (workchain.isNegative) {
      return Cell.fromHex(_nftCollectionEditableTestnet);
    }
    return Cell.fromHex(_nftCollectionEditableMainnet);
  }

  static Cell nftSaleCode() {
    return Cell.fromHex(_nftSale);
  }

  static Cell nftMarketPlaceCode() {
    return Cell.fromHex(_nftMarketPlace);
  }
}
