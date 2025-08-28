import 'package:flutter/material.dart';
import 'package:flutter_metronome/repo/model/payment.dart';
import 'package:flutter_metronome/ui/drawer/view_models/sponsorship_view_model.dart';
import 'package:flutter_metronome/ui/utils/center_info.dart';

class SponsorshipList extends StatefulWidget {
  final SponsorshipViewModel viewModel;

  const SponsorshipList({super.key, required this.viewModel});
  @override
  State<SponsorshipList> createState() => _SponsorshipListState();
}

class _SponsorshipListState extends State<SponsorshipList> {
  @override
  Widget build(BuildContext context) {
    widget.viewModel.getPaymentList.execute();
    return CenterInfo(title: "赞助记录", child: _buildChild());
  }

  Widget _buildChild() {
    return ListenableBuilder(
      listenable: widget.viewModel.getPaymentList,
      builder: (context, child) {
        if (widget.viewModel.getPaymentList.running) {
          return Center(child: CircularProgressIndicator());
        } else if (widget.viewModel.getPaymentList.error) {
          return Center(child: Text("加载赞助记录失败！"));
        }
        return child!;
      },
      child: ValueListenableBuilder(
        valueListenable: widget.viewModel.payments,
        builder: (context, value, child) {
          if (value.isEmpty) {
            return Center(child: Text("暂无赞助记录!"));
          }

          return Column(
              spacing: 5,
              children: [
                for (var p in value) _PaymentTile(p: p),
                ValueListenableBuilder(
                  valueListenable: widget.viewModel.hasMore,
                  builder: (context, value, child) {
                    if (!value) return SizedBox.shrink();
                    return TextButton(
                      onPressed: () {
                        widget.viewModel.getPaymentList.execute();
                      },
                      child: Text("加载更多..."),
                    );
                  },
                ),
              ],
            
          );
        },
      ),
    );
  }
}

class _PaymentTile extends StatelessWidget {
  final Payment p;

  const _PaymentTile({required this.p});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("支付单号：${p.paymentNo}"),
            Text(p.createTime),
            Text("☕️ X ${p.quantity} - 共计¥${p.amount}"),
            Text("支付状态：${p.payStatus}"),
          ],
        ),
      ),
    );
  }
}
