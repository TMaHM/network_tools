import 'package:multicast_dns/multicast_dns.dart';

class MdnsInfo {
  MdnsInfo({
    required this.srvResourceRecord,
    required this.ptrResourceRecord,
    required this.txtResourceRecord,
  });

  /// Also can be called target
  String get mdnsName => srvResourceRecord.name;

  String get mdnsSrvTarget => srvResourceRecord.target;
  int get mdnsPort => srvResourceRecord.port;

  /// Also can be called bundleId
  String get mdnsDomainName => ptrResourceRecord.domainName;

  /// Srv record of the dns
  String get mdnsServiceType {
    final List<String> ptrNameSplit = ptrResourceRecord.name.split('.');
    String tempString = '';
    if (ptrNameSplit.isNotEmpty) {
      tempString = ptrNameSplit[0];
    }
    if (ptrNameSplit.length >= 2) {
      tempString = '$tempString.${ptrNameSplit[1]}';
    }

    return tempString;
  }

  String get textRecord => txtResourceRecord.text;

  SrvResourceRecord srvResourceRecord;

  PtrResourceRecord ptrResourceRecord;

  TxtResourceRecord txtResourceRecord;

  /// mDNS name without the ._tcp.local
  String getOnlyTheStartOfMdnsName() {
    if (mdnsName.contains('.')) {
      return mdnsName.substring(0, mdnsName.indexOf('.'));
    }
    return mdnsName;
  }
}
