import 'dart:math';
import 'dart:typed_data';
import 'package:just_audio/just_audio.dart';

class Sound extends StreamAudioSource {
  // 1. 这段声音的总时值, 毫秒为单位
  final int soundDuration;
  //final int beatDuration = 100; // beat音的最大时值为100ms
  // 2. 声音的采样参数
  final int k; // 频率
  final double n; // 幅值

  // 都是取默认值
  final int sampleRate = 44100; // 采样率
  final int bitsPerSample = 16; // 采样深度
  final int numChannels = 1; // 单声道

  // 3. 细分音符数组
  final List<int> subNotes;
  late Uint8List sound;

  Sound({
    super.tag,
    required this.soundDuration,
    required this.k,
    required this.n,
    required this.subNotes,
  }) {
    // 暂时先考虑最多到16分节奏和3连音
    assert(subNotes.length == 12);
    final pcmData = _createSound();
    sound = _createWavFile(pcmData);
  }

  // 创建pcm的主体
  Uint8List _createSound() {
    // 声音的总持续时间
    final time = soundDuration / 1000;
    final duration = (sampleRate * time).toInt();

    // 频率以及采样系数
    final s = 2 * pi * k / sampleRate;
    final r = 100 / sampleRate;
    final p = 200 / sampleRate;
    final o = 500 / sampleRate;

    // 创建缓存数组
    final pcmBuffer = Int16List(duration);


    // 细分小节
    int lastBeat = -1;
    for (int i = 0; i < 12; i++) {
      if (subNotes[i] == 1) {
        if (lastBeat >= 0) {
          final start = (lastBeat *duration / 12 ).toInt();
          final subDuration = ((i - lastBeat) * duration /12).toInt();
          final subSound = _createSubSound(subDuration, s, r, p, o);
          pcmBuffer.setRange(start, start + subDuration, subSound);
        }
        lastBeat = i;
      }
    }

    if (lastBeat == -1) throw Exception("节拍为空!");
    // 最后一定会留一个
      final start = (lastBeat *duration / 12 ).toInt();
    final subDuration = ((12 - lastBeat) * duration /12).toInt();
    final subSound = _createSubSound(subDuration, s, r, p, o);

    pcmBuffer.setRange(start, start + subDuration, subSound);

    return pcmBuffer.buffer.asUint8List();
  }

  Int16List _createSubSound(int t, double s, r, p, o) {
    final pcmBuffer = Int16List(t);
    for (int q = 0; q < t; q++) {
      final value =
          n *
          (0.09 * exp(-q * r) * sin(s * q) +
              0.34 * exp(-q * p) * sin(2 * s * q) +
              0.57 * exp(-q * o) * sin(6 * s * q));
      pcmBuffer[q] = (n * value * 32767).round().clamp(-32768, 32767);
    }
    return pcmBuffer;
  }

  // 增加文件的头信息
  Uint8List _createWavFile(Uint8List pcmData) {
    // 计算数据块大小
    final int dataSize = pcmData.length;

    // 计算文件总大小 (44字节头部 + PCM数据大小)
    final int fileSize = 44 + dataSize;

    // 创建头部缓冲区
    final header = Uint8List(44);
    final byteData = ByteData.view(header.buffer);

    // RIFF头
    byteData.setUint8(0, 0x52); // 'R'
    byteData.setUint8(1, 0x49); // 'I'
    byteData.setUint8(2, 0x46); // 'F'
    byteData.setUint8(3, 0x46); // 'F'

    // 文件大小 (fileSize - 8)
    byteData.setUint32(4, fileSize - 8, Endian.little);

    // WAVE头
    byteData.setUint8(8, 0x57); // 'W'
    byteData.setUint8(9, 0x41); // 'A'
    byteData.setUint8(10, 0x56); // 'V'
    byteData.setUint8(11, 0x45); // 'E'

    // fmt块
    byteData.setUint8(12, 0x66); // 'f'
    byteData.setUint8(13, 0x6D); // 'm'
    byteData.setUint8(14, 0x74); // 't'
    byteData.setUint8(15, 0x20); // ' '

    // fmt块大小 (16)
    byteData.setUint32(16, 16, Endian.little);

    // 音频格式 (1 = PCM)
    byteData.setUint16(20, 1, Endian.little);

    // 声道数
    byteData.setUint16(22, numChannels, Endian.little);

    // 采样率
    byteData.setUint32(24, sampleRate, Endian.little);

    // 字节率 (每秒字节数)
    byteData.setUint32(
      28,
      sampleRate * numChannels * bitsPerSample ~/ 8,
      Endian.little,
    );

    // 块对齐 (每个采样帧的字节数)
    byteData.setUint16(32, numChannels * bitsPerSample ~/ 8, Endian.little);

    // 位深度
    byteData.setUint16(34, bitsPerSample, Endian.little);

    // data块标识
    byteData.setUint8(36, 0x64); // 'd'
    byteData.setUint8(37, 0x61); // 'a'
    byteData.setUint8(38, 0x74); // 't'
    byteData.setUint8(39, 0x61); // 'a'

    // data块大小
    byteData.setUint32(40, dataSize, Endian.little);
    // 合并头部和PCM数据
    final rst = Uint8List.fromList([...header, ...pcmData]);

    return rst;
  }

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
        start ??= 0;
    end ??= sound.length;

    return StreamAudioResponse(
      sourceLength: sound.length,
      contentLength: end - start,
      offset: start,
      stream: Stream.value(sound.sublist(start, end)),
      contentType: 'audio/wav',
    );
  }
}
