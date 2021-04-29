# ツール・ライブラリの名前

TimeーChat

## 簡単な説明

シフト(スケジュール)を投稿し、一覧に表示するアプリです。
管理者のみ、顧客登録機能が使用できます。

## 作成経緯

前職の飲食店で店長をしていた時、シフトの提出が、紙媒体や、lineなどバラバラで、期限までの提出率が、低かったためです。   
そこで、考えたのが、シフトや顧客を一括に管理できるアプリを考えました。   
あらかじめ設定した日時に別アプリのLINE_BOT(トップページにQRコード添付)から決まったメッセージとURLが送られ,
シフト予定を提出し、共有するアプリを作成しました。   
なおログインパスワードの管理を簡略にするため、google,facebookアカウントからでもログインできるようにしました。  
また仕事でのツールを一括化する目的で、管理者のみ顧客管理を行う機能を作成しました。



***デモ***

![トップページ]("image/toppage.jpg")
![ハンバーガーメニュー]("image/toppage.gif")
![カレンダー]("image/calendar.png")
![LINE_BOT]("image/line_bot.gif")

### 接続先情報
https://time-chat.herokuapp.com/
## Herokuでデプロイしているため、Herokuの仕様により本番環境にアクセス頂いた際に画像リンクが切れている可能性がございます。
ID/Pass
ID: admin
Pass: 2222
 ### テスト用アカウント等
管理者用
メールアドレス: master@master
パスワード: 123456789
利用者用
メールアドレス名: test@testパスワード: 123456789


## 機能
-ユーザーログイン機能
- カレンダーにシフトを投稿する機能
- 顧客登録機能


## 使い方

1. ユーザーログイン機能
    --google.facebookのアカウントでもログインできる
    --ログイン時、ハンバーガーメニューが出る
    --ログイン・ログアウトの表示がフラッシュメッセージで出る
2. カレンダーにシフトを投稿する機能
    --カレンダーに投稿した内容を一覧表示できる
    --投稿者のみ編集・削除ができる
    --月間・週間・日別でカレンダーを表示できる
    --日別でのカレンダーは個人のタイムスケジュールがグラフで閲覧できる
3. - 顧客登録機能
    --管理者のみ使用できる
    --顧客登録・一覧を表示できる
    --編集・削除ができる
    --郵便番号検索で、登録ができ、自動で"-"(ハイフン)がつく
    --年齢が自動で、更新される
    --顧客一覧画面で、検索・並び替えができる
    --会社概要で、GoogleMapを使用でき、郵便番号検索ができる

# README

## userテーブル
| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| username             | string | null: false |
| password             | string | null: false |
| password_confirmation| string | null: false |
| admin                | boolean|             |

### Association
has_many :attendances, dependent: :destroy
has_many :sns_credentials
has_one :search, dependent: :destroy

## attendanceテーブル
| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| user_id              | integer | null: false |
| start_time           | datetime|             |
| last_time            | datetime|             |
| title                | string  |             |
| content              | text    |             |

### Association
belong_to :user
has_may : record

### Association
 belongs_to :user
 belongs_to :attendance


## searchテーブル
| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| user_id              | integer| null: false |
| family_name          | string | null: false |
| first_name           | string |             |
| family_name_kana     | string |             |
| first_name_kana      | string |             |
| sex                  | string |             |
| age                  | string |             |
| company              | string |             |
| position             | string |             |
| postal_code          | string | null: false |
| address1             | string | null: false |
| address2             | string | null: false |
| address3             | string | null: false |
| building_name        | string |             |
| phone_number         | string |             |

### Association
 belongs_to :user, optional: true
has_one :home


## homeテーブル
| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| @search_id           | bigint |             |
### Association
  belongs_to :search

