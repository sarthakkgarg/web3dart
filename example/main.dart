import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

const String privateKey =
    'a71630275ec97df32d51698952a768c2196d716e15403f27ff41f0305a3d5b9b';
const String rpcUrl = 'https://rpc.xinfin.network/';

Future<void> main() async {
  // start a client we can use to send transactions
  final client = Web3Client(rpcUrl, Client());

  final credentials = EthPrivateKey.fromHex(privateKey);
  final address = credentials.address;
  print(address.hexEip55);
  print(await client.getBalance(address));
  // print(await client.getChainId());

  // await client.sendTransaction(
  //   credentials,
  //   Transaction(
  //     to: EthereumAddress.fromHex('0xF083Afee2B1Af70D0718d831c535682f619307F7'),
  //     gasPrice: EtherAmount.inWei(BigInt.one),
  //     maxGas: 100000,
  //     value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 1),
  //   ),
  // );

  await client.dispose();
}
