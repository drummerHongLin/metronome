import 'package:flutter/material.dart';
import 'package:flutter_metronome/repo/model/player_config.dart';
import 'package:flutter_metronome/ui/config_his/create_config_panel.dart';
import 'package:flutter_metronome/ui/main_screen_view_model.dart';
import 'package:flutter_metronome/ui/utils/cutome_elevated_button.dart';
import 'package:flutter_metronome/ui/utils/popuprouter_wrapper.dart';

class ConfigHisPanel extends StatelessWidget {
  final MainScreenViewModel viewModel;

  const ConfigHisPanel({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  "节拍配置列表",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListenableBuilder(
                    listenable: Listenable.merge([
                      viewModel.getConfigHis,
                      viewModel.deleteConfig,
                    ]),
                    builder: (ctx, c) {
                      if (viewModel.getConfigHis.running ||
                          viewModel.deleteConfig.running) {
                        return Center(child: CircularProgressIndicator());
                      } else if (viewModel.configHis.isEmpty) {
                        return c!;
                      }
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: viewModel.configHis.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (ctx, idx) {
                                return _ConfigTile(
                                  configInfo: viewModel.configHis[idx],
                                  onCheck: () {
                                    Navigator.pop(
                                      context,
                                      viewModel.configHis[idx],
                                    );
                                  },
                                  onDelete: () {
                                    viewModel.deleteConfig.execute(
                                      viewModel.configHis[idx],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                await _gotoCreateConfig(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                overlayColor: Theme.of(
                                  context,
                                ).colorScheme.onPrimary,
                              ),
                              child: Text(
                                "新建节拍配置",
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    child: Center(
                      child: TextButton(
                        onPressed: () async {
                          await _gotoCreateConfig(context);
                        },
                        child: Text("新建节拍配置"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _gotoCreateConfig(BuildContext context) async {
    final config = viewModel.createConfigByCurrentPare("");
    final rst = await Navigator.push(
      context,
      PopUpRouteWrapper<String>(child: CreateConfigPanel(configInfo: config)),
    );
    if (rst != null) {
      await viewModel.saveConfig(title: rst, pc: config);
      // ignore: use_build_context_synchronously
      Navigator.pop(context, config);
    }
  }
}

class _ConfigTile extends StatelessWidget {
  final VoidCallback onCheck;
  final VoidCallback onDelete;
  final PlayerConfigInfo configInfo;

  const _ConfigTile({
    required this.configInfo,
    required this.onCheck,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.surfaceDim,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(configInfo.configTitle, style: TextStyle(fontSize: 10)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${configInfo.bpm} BPM"),
                      Text(
                        " · ${configInfo.beatNum}/${configInfo.beatNote} · ",
                      ),
                      Image.asset(
                        configInfo.referenceBeat.path,
                        height: 14,
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  ),
                  Text(configInfo.createTime, style: TextStyle(fontSize: 10)),
                ],
              ),
              Spacer(),
              CustomeElevatedButton(
                onTap: onCheck,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(Icons.check, size: 20),
              ),
              SizedBox(width: 5),
              CustomeElevatedButton(
                onTap: onDelete,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(Icons.delete, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
