# socket_io_demo

FlutterとSocket.IOを使用したリアルタイム通信のデモアプリ

<img width="300" alt="アプリのデモの様子を写したgif画像。シミュレーターが2台並べられ、トップページのRoom1へ遷移後、チャットを開始している。チャットではお互いが挨拶を交わしている。" src="assets/demo.gif">

## セットアップ

```bash
$ git clone https://github.com/takashi0602/socket_io_demo.git

$ cd socket_io_demo

$ fvm flutter pub get

// このデモアプリではユーザー認証などはないため、起動時にユーザーIDをセットする
$ fvm flutter run --dart-define=USER_ID=1
```

## API

- [https://github.com/takashi0602/socket-io-server](https://github.com/takashi0602/socket-io-server)
