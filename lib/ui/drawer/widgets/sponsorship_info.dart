import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/repo/pay_repo.dart';
import 'package:flutter_metronome/ui/drawer/widgets/tile_info.dart';
import 'package:provider/provider.dart';

class SponsorshipInfo extends StatefulWidget {
  const SponsorshipInfo({super.key});

  @override
  State<SponsorshipInfo> createState() => _SponsorshipInfoState();
}

class _SponsorshipInfoState extends State<SponsorshipInfo> {
  int cupOfCoffee = 0;
  double sponsorMoney = 0.0;
  final TextEditingController _controller = TextEditingController();
  late final PayRepo _payRepo;

  @override
  void initState() {
    super.initState();
    _controller.text = sponsorMoney.toString();
    _payRepo = context.read<PayRepo>();
  }

  @override
  Widget build(BuildContext context) {
    return TileInfo(title: '赞助作者', child: _buildChild());
  }

  void drinkCoffee(int v) {
    setState(() {
      cupOfCoffee = v;
      sponsorMoney = v.toDouble();
      _controller.text = sponsorMoney.toString();
    });
  }

  void moneyToCofffee() {
    setState(() {
      sponsorMoney = double.tryParse(_controller.text) ?? 0;
      cupOfCoffee = sponsorMoney.toInt();
    });
  }

  Widget _buildChild() {
    return Column(
      spacing: 30,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "给小鸿倒 $cupOfCoffee 杯卡布奇诺~",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                drinkCoffee(1);
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              child: Text("1X☕"),
            ),
            ElevatedButton(
              onPressed: () {
                drinkCoffee(5);
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              child: Text("5X☕"),
            ),
            ElevatedButton(
              onPressed: () {
                drinkCoffee(10);
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              child: Text("10X☕"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 120,
              child: TextField(
                textAlign: TextAlign.center,
                controller: _controller,
                keyboardType: TextInputType.number,
                style: Theme.of(context).textTheme.displayLarge,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'(\d*\.)?\d+')),
                ],
                onEditingComplete: moneyToCofffee,
                onTapOutside: (e) {
                  moneyToCofffee();
                },
              ),
            ),
            Text("元"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("残忍拒绝"),
            ),
            ElevatedButton(
              onPressed: () {
                _payRepo.purchaseProduct(Product.one_cup_coffee, cupOfCoffee);
              },
              child: Text("赞助！"),
            ),
          ],
        ),
      ],
    );
  }
}
