# README

## アプリケーション名
[![Image from Gyazo](https://i.gyazo.com/99716dc402d60c99e90a1ffe5cf6bd82.png)](https://gyazo.com/99716dc402d60c99e90a1ffe5cf6bd82)

## アプリケーション概要
 コロナウイルスの感染拡大により外食の機会が減り、自宅で料理をしざるを得なくなった。
 毎日料理をしている中で、レシピサイトを用いて新たな料理に挑戦することもあるが
 時間がない時や余り物の食材を用いて料理する時はレパートリーが少ないことに気づいた。<br>
  レシピサイトには載っていない、翌日のレシピ、その後1週間のレシピが知りたい。
 SNSでみんなに見せるほどでもない食事がみたい。
 これらを解決するために今回のアプリ開発に至った。

## URL
https://loocook.herokuapp.com/

## テスト用アカウント
・ユーザー1<br>
email: nick@test
password:123456
  
・ユーザー2<br>
email: mike@test
password: 123456
## 利用方法
・記録機能<br>
ログインしたユーザーは料理の記録ができる。記録はトップページに一覧で表示がされ、マイページのカレンダーにも
追加される。
トップページの記録一覧は検索することが可能。<br>
・投稿閲覧機能<br>
トップページに記録が一覧で表示される。
ログインしているユーザーは記録の各ユーザー名から全ての記録がカレンダー表示されているページぺ移動できる。


## 洗い出した要件 

| 機能 | 目的 | 詳細 | ストーリー |
| :---- | :---- | :----| :---- |
| ユーザー管理機能 | 登録したユーザーのみ使用できるようにすること。| nickname,email,passwordの登録により、ログイン・ログアウトができるようにする。 ||
|記録機能|日々の料理の記録を残すこと|ログインしているユーザーは投稿ページから、料理を5品まで登録することができる|日々の記録をメモ程度で簡単に残したい。自分の料理を振り返ることで今後のヒントや料理のレパートリーを広げる。|
|カレンダー表示機能|いつ・何を料理したかひと目でわかるようにすること|マイページで自分の記録をカレンダー形式で閲覧することができる。いつ何を料理したかがひと目でわかる。また、他の人のカレンダーも見ることができる。| シンプルなカレンダー形式で料理の記録を管理することで同じものを高頻度で作ることを防ぐ。また、他のユーザーの記録を見ることで、自分の料理へのヒントを得られる。|
|記録検索機能|記録の検索ができるようにすること|キーワードに一致した記録を表示できるようにする|記録された料理名で検索できるので、献立作成に役立つ。さらに他のユーザーの記録一覧ページに移動することでその前後の日の料理を見ることができる|



## 実装した機能
・記録機能
[![Image from Gyazo](https://i.gyazo.com/b1f62d27d2fe28de095e913145ed2432.gif)](https://gyazo.com/b1f62d27d2fe28de095e913145ed2432)
・カレンダー表示機能
[![Image from Gyazo](https://i.gyazo.com/7f30fe8cc12a172c719c754abad6ad5f.gif)](https://gyazo.com/7f30fe8cc12a172c719c754abad6ad5f)
・サイト説明ページ
[![Image from Gyazo](https://i.gyazo.com/6142e27f158d7e3e5df40ea813e69ec6.gif)](https://gyazo.com/6142e27f158d7e3e5df40ea813e69ec6)
・検索機能
[![Image from Gyazo](https://i.gyazo.com/566cc3616f4ec767d958c09b8bc7ab38.gif)](https://gyazo.com/566cc3616f4ec767d958c09b8bc7ab38)
## 工夫したポイント
・ボタンやリンクの装飾<br>
説明がなくとも感覚的に操作が行えるよう、リンクやボタンを分かりやすくした
・記録のカレンダー表示<br>
シンプルに記録ができ、表示できるという点に重点をおきレイアウトを整えた
## 実装予定の機能
・記録の編集機能<br>
現状記録の編集ができないの過去の記録の編集や削除をできるようにする<br>
・ユーザーのフォロー機能<br>
お気に入りのユーザーの投稿のみを閲覧できるようにする
## DB設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false, unique:true|
| encrypted_password | string | null: false             |

### Association
- has_many :dishes


## dishesテーブル
| Column             | Type   | Options                            |
| ------------------ | ------ | ---------------------------------- |
| dish_1             | string | null: false                        |
| dish_2             | string |                                    |
| dish_3             | string |                                    |
| dish_4             | string |                                    |
| dish_5             | string |                                    |
| user               | references | null: false, foreign_key: true |

### Association
- has_one :user

## ローカルでの動作方法
```
% git clone https://github.com/yrkFukushima/loocook.git
% cd loocook
% bundle install
% rails db:create
% rails db:migrate
$ rails s
 → http://localhost:3000
``` 

## 開発環境
・HTML5<br>
・CSS<br>
・Ruby on Rails(6.0.3.7)<br>
・Ruby(2.6.5)<br>
・MySQL(5.6.51)<br>
・GitHub