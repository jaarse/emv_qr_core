import 'package:emv_qr_core/config/enums/shared/emv_product_type.dart';
import 'package:emv_qr_core/config/helpers/emv_parser.dart';
import 'package:emv_qr_core/config/shared/debug_print.dart';
import 'package:emv_qr_core/domain/entities/shared/emv_qr_entity.dart';
import 'package:emv_qr_core/domain/entities/shared/tlv.dart';
import 'package:emv_qr_core/domain/repositories/emv_qr_repository.dart';

class EmvQrRepositoryImpl extends EmvQrRepository {


  EmvQrRepositoryImpl({required super.service});

  @override
  EmvQrEntity decode(String qrData) {
    try {
      debugPrint('Parsing EMV QR');
      final tlvs = EmvParser.parse(qrData); //Tag Length Values source fragmented by Tag
      
      //**TLVs que dependen de otros TLVs(TAGS)*/
      String? qrTypeTLV;
      (TLV, TLV)? ivaConditionTLV;
      (TLV, TLV)? incConditionTLV;

      //**Objetos para la entidad EMVQR */
      EmvIndicator? emvIndicator;
      QrType? qrType;
      EmvChecksum? crc;
      EmvSecurityField? securityField;
      EmvMerchantAccountInformation? multiKeyImmediatePayments;
      AcquirerNetworkId? acquirerNetworkId;
      MerchantCode? merchantCode;
      AggregatorMerchantCode? aggregatorMerchantCode;
      MerchantCategoryCode? merchantCategoryCode;
      CountryCode? countryCode;
      MerchantName? merchantName;
      MerchantCity? merchantCity;
      PostalCode? postalCode;
      Channel? channel;
      IvaCondition? ivaCondition;
      IvaPercent? ivaPercent;
      IvaBase? ivaBase;
      IncCondition? incCondition;
      IncPercent? incPercent;
      TransactionSequentialId? transactionSequentialId;
      ServiceCodeForCollection? serviceCodeForCollection;
      ReferencePaymentOrPhoneNumber? referencePaymentOrPhoneNumber;
      CollectedProductType? collectedProductType;
      OriginAccount? originAccount;
      DestinationAccount? destinationAccount;
      AdditionalRefDestinationAccount? additionalRefDestinationAccount;
      TransferenceProductType? transferenceProductType;
      DiscountApp? discountApp;
      MerchantInfoLanguage? merchantInfoLanguage;
      MerchantInfo? merchantInfo;






      TransactionAmount? transactionAmount;



      //**Analizar TLVs internos de cada TLV del QR fuente */
      tlvs.forEach((tlv) {
        debugPrint('\nParseando TLV internamente: $tlv : --> ');

        switch (tlv.tag) {

          case 0:
            emvIndicator = EmvIndicator(initialTag: service.getEmvIndicator(tlv.value));
            break;

          case 1:
            qrTypeTLV = tlv.value;
            break;

          case 26:
            final (gui, id, phone, email, numeric, merchantId) = service.getMultiKeyImmediatePayments(tlv.value);
            multiKeyImmediatePayments = EmvMerchantAccountInformation(
              gui: EmvParser.defineGUIType(gui.value),
              identification: id.value,
              phoneNumber: phone.value,
              email: email.value,
              alphanumeric: numeric.value,
              merchantId: merchantId.value,
            );
            break;

          case 49:
            final (gui, red) = service.getAcquirerNetworkId(tlv.value);
            acquirerNetworkId = AcquirerNetworkId(
              gui: EmvParser.defineGUIType(gui.value), 
              redId: red.value,
            );
            break;

          case 50:
            final (gui, code) = service.getMerchantCode(tlv.value);
            merchantCode = MerchantCode(
              gui: EmvParser.defineGUIType(gui.value), 
              merchantCode: code.value,
            );
            break;

          case 51:
            final (gui, code) = service.getAggregatorMerchantCode(tlv.value);
            aggregatorMerchantCode = AggregatorMerchantCode(
              gui: EmvParser.defineGUIType(gui.value), 
              merchantCodeGroup: code.value,
            );
            break;

          case 52:
            merchantCategoryCode = MerchantCategoryCode(
              code: service.getMerchantCategoryCode(tlv.value)
            );
            break;

          case 54:
            transactionAmount = TransactionAmount(
              amount: service.getTransactionAmount(tlv.value)
            );
            break;

          case 58:
            countryCode = CountryCode(
              code: service.getCountryCode(tlv.value),
            );
            break;
          
          case 59:
            merchantName = MerchantName(
              name: service.getMerchantName(tlv.value),
            );
            break;

          case 60:
            merchantCity = MerchantCity(
              city: service.getMerchantCity(tlv.value),
            );
            break;

          case 61:
            postalCode = PostalCode(
              code: service.getPostalCode(tlv.value),
            );
            break;


          case 62:
            final (billingNumber, mobileNumber, storeLabel, loyaltyNumber, referenceLabel, customerNumber, terminalLabel, transactionType, beRequestedCustomer, nit, channel) = service.getMerchantInfo(tlv.value);
            merchantInfo = MerchantInfo(
              billingNumber: int.tryParse(billingNumber.value),
              mobileNumber: int.tryParse(mobileNumber.value),
              storeLabel: storeLabel.value,
              loyaltyNumber: int.tryParse(loyaltyNumber.value),
              referenceLabel: referenceLabel.value,
              customerNumber: int.tryParse(customerNumber.value),
              terminalLabel: terminalLabel.value,
              transactionType: EmvParser.defineTransacctionType(transactionType.value),
              beRequestedCustomer: EmvParser.defineRequestedCustomerData(beRequestedCustomer.value),
              nit: nit.value,
              channel: channel.value,
            );
            break;

          case 63:
            crc = EmvChecksum(crc: service.getCRC(tlv.value));
            break;


          case 64:
            final (language, name, city) = service.getMerchantInfoLanguage(tlv.value);
            merchantInfoLanguage = MerchantInfoLanguage(
              language: language.value,
              name: name.value,
              city: city.value, 
            );
            break;

          case 80:
            final (gui, channelTlv) = service.getChannel(tlv.value);
            channel = Channel(
              gui: EmvParser.defineGUIType(gui.value),
              channel: EmvParser.defineChannel(channelTlv.value),
            );
            break;

          case 81:
            ivaConditionTLV = service.getIvaCondition(tlv.value);
            break;
          
          case 82:
            final (gui, percent) = service.getIvaPercent(tlv.value);
            ivaPercent = IvaPercent(
              gui: EmvParser.defineGUIType(gui.value),
              percent: int.parse(percent.value),
            );
            break;

          case 83:
            final(gui, base) = service.getIvaBase(tlv.value);
            ivaBase = IvaBase(
              gui: EmvParser.defineGUIType(gui.value),
              base: int.parse(base.value),
            );

          case 84:
            incConditionTLV = service.getIncCondition(tlv.value);

          case 85:
            final (gui, percent) = service.getIncPercent(tlv.value);
            incPercent = IncPercent(
              gui: EmvParser.defineGUIType(gui.value),
              percent: int.parse(percent.value),
            );
          
          case 90:
            final (gui, transactionId) = service.getTransactionSequentialId(tlv.value);
            transactionSequentialId = TransactionSequentialId(
              gui: EmvParser.defineGUIType(gui.value),
              id: transactionId.value,
            );
            

          case 91:
            final (gui, hash) = service.getSecurityField(tlv.value);
            securityField = EmvSecurityField(
              gui: EmvParser.defineGUIType(gui.value),
              hash: hash.value,
            );
            break;

          case 92:
            serviceCodeForCollection = ServiceCodeForCollection(
              code: service.getServiceCodeForCollection(tlv.value),
            );
            break;

          case 93:
            referencePaymentOrPhoneNumber = ReferencePaymentOrPhoneNumber(
              ref: service.getReferencePaymentOrPhoneNumber(tlv.value),
            );
            break;


          case 94:
            collectedProductType = CollectedProductType(
              type: service.getCollectedProductType(tlv.value),
            );
            break;

          case 95:
            originAccount = OriginAccount(
              origin: service.getOriginAccount(tlv.value),
            );
            break;

          case 96:
            destinationAccount = DestinationAccount(
              dest: service.getDestinationAccount(tlv.value),
            );
            break;

          case 97:
            additionalRefDestinationAccount = AdditionalRefDestinationAccount(
              ref: service.getAdditionalRefDestinationAccount(tlv.value),
            );
            break;

          case 98:
            final typeInt = service.getTransferenceProductType(tlv.value);
            transferenceProductType = TransferenceProductType(
              type: EmvProductType.values[typeInt! - 1],
            );
            break;

          case 99:
            final (
              gui, 
              indicatorDesc, 
              amountDesc, 
              ivaDesc, 
              percentDesc, 
              valueDesc, 
              inquiryDesc,
            ) = service.getDiscountApp(tlv.value); 
            discountApp = DiscountApp(
              gui: EmvParser.defineGUIType(gui.value),
              discountIndicator: indicatorDesc.value,
              discountAmount: amountDesc.value,
              discountAmountIVA: ivaDesc.value,
              discountPercent: percentDesc.value,
              discountValue: valueDesc.value,
              discountInquiry: inquiryDesc.value,
            );
            break;
 
          default:
            break;
        }



        debugPrint('\n');
      });


      //**Datos que dependen de otros TAGs*/

      //? TAG01 depende de TAG54
      qrType = QrType(
        type: EmvParser.defineQrType(qrTypeTLV!, transactionAmount!.amount!),
      );

      //? TAG81 depende de TAG82
      final (guiIva, conditionIva) = ivaConditionTLV!;
      ivaCondition = IvaCondition(
        gui: EmvParser.defineGUIType(guiIva.value),
        condition: EmvParser.defineCondition(conditionIva.value, ivaPercent!.percent!),
      );

      //? TAG84 depende de TAG85
      final (guiInc, conditionInc) = incConditionTLV!;
      incCondition = IncCondition(
        gui: EmvParser.defineGUIType(guiInc.value),
        condition: EmvParser.defineCondition(conditionInc.value, incPercent!.percent!),
      );









      //**Construcción de la entidad servida al user*/
      final emvQr = EmvQrEntity(
        emvIndicator: emvIndicator,
        qrType: qrType,
        crc: crc,
        securityField: securityField,
        multiKeyImmediatePayments: multiKeyImmediatePayments,
        acquirerNetworkId: acquirerNetworkId,
        merchantCode: merchantCode,
        aggregatorMerchantCode: aggregatorMerchantCode,
        transactionAmount: transactionAmount,
        ivaCondition: ivaCondition,
        ivaPercent: ivaPercent,
        ivaBase: ivaBase,
        incCondition: incCondition,
        incPercent: incPercent,
        merchantCategoryCode : merchantCategoryCode,
        countryCode : countryCode,
        merchantName : merchantName,
        merchantCity : merchantCity,
        postalCode : postalCode,
        channel : channel,
        transactionSequentialId : transactionSequentialId,
        serviceCodeForCollection: serviceCodeForCollection,
        referencePaymentOrPhoneNumber: referencePaymentOrPhoneNumber,
        collectedProductType: collectedProductType,
        originAccount: originAccount,
        destinationAccount: destinationAccount,
        additionalRefDestinationAccount: additionalRefDestinationAccount,
        transferenceProductType: transferenceProductType,
        discountApp: discountApp,
        merchantInfoLanguage: merchantInfoLanguage,
        merchantInfo: merchantInfo,

      );
      
      return emvQr; //**Entidad creada */

    } catch (e) {
      debugPrint('Error Parsing EMV QR: ${e.toString()}');
      throw Exception(e.toString());
    }
  }


}
