import 'dart:io';

void main(List<String> args) async {
  DataFetcher fetcher = DataFetcher();
  String data = await fetcher.getData();
  print(data);
}

class DataFetcher {
  Future<String> getData() async {
    String _parsedData = await _getDataFromCloud().then((_cloudDateRaw) async =>
        await _parseDataFromCloud(cloudData: _cloudDateRaw));
    return _parsedData;
  }

  Future<String> _getDataFromCloud() async {
    // get data from cloud
    sleep(Duration(seconds: 10));
    print("get finished");
    return Future.value("data from Cloud");
  }

  Future<String> _parseDataFromCloud({required String cloudData}) async {
    sleep(Duration(seconds: 5));
    print("data parcing finished!");
    return Future.value("parsed Data");
  }
}
