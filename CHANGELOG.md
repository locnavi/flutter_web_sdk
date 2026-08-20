## 0.0.1

1、实现iOS、android的websdk 调用 

## 0.0.2+2

1、修改iOS的返回值语法错误

## 0.0.3
1、增加userId

## 0.0.4
1、修改Android的websdk版本路徑

## 1.0.0

主線改採 1.x 版號，以便與 Flutter 1.22 相容線（0.1.x）並行維護。

1、Dart SDK 上界放寬至 `<4.0.0`，Flutter 3.10 以上（Dart 3）的專案現在可正常安裝
2、Android 端補上 `androidx.localbroadcastmanager:localbroadcastmanager:1.1.0`
   —— AppCompat 1.4 起不再傳遞此相依，過去需要使用者自行於 App 的 build.gradle
   手動加入，現由 plugin 自行宣告
3、修正 example 過期的 widget test，並恢復顯示平台版本
4、修正單元測試 mock 回傳型別錯誤

> **升級注意**：原本相依 `^0.0.4` 的專案不會自動升級，
> 請手動改為 `locnavi_web_sdk: ^1.0.0`。公開 API 未變更，不需修改程式碼。
>
> 仍使用 Flutter 1.20 ~ 2.0 的專案請改用 `^0.1.0`。
