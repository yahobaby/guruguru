
# アプリケーション名
* guruguru

# アプリケーション概要	
* 回覧板の投稿、表示、編集、削除、コメントの投稿及び表示<br><br>
* クレジット支払い機能（町内会費）、画面全体印刷機能、画面全体の文字とボタンの大きさ調整機能

# URL	
* デプロイが完了次第記載予定

# テスト用アカウント	
* IDとPW、ニックネーム

# 利用方法	
1. 町内会で引き継ぎされたお知らせ情報を、町内会に参加されてる全世帯(14世帯)へ共有する<br><br>
2. 投稿された文字の大きさが調整できる<br><br>
3. 画像全体の印刷ができる<br><br>
4. クレジットカード支払い機能を使い、町内会費を徴収する

# アプリケーションを作成した背景	
1. 全世帯がほとんど65歳以上のお年寄りの方々で構成されてる町内会において、既存「紙ベースの回覧板」では情報共有に限界がある。<br><br>
2. 情報を迅速・かつ正確に保管する為に、回覧板のデジタル化を目指す。<br><br>
3. 現行紙ベースの回覧板は、風に飛ばされたり、雨で紙が濡れたり、野生動物（野良猫）により毀損されるなど、情報の伝達及び管理が難しい。<br><br>
4. 「町内会費」に関しても、今まで全世帯「現金での支払い」しかできなかったが、お釣りの用意や、各世帯への直接訪問など、班長の作業量増加へ繋がってる。<br><br>
5. 目が少し不自由な方がいらっしゃる可能性や、各世帯のデバイス性能に偏差が存在してる恐れがあるので、文字の大きさが調整できる機能を実装し、シンプルなデザインにこだわってる。<br><br>
6. 紙で情報保管希望の方がいらっしゃる可能性を考慮し、全画像の印刷機能を実装している。

# 洗い出した要件	
https://docs.google.com/spreadsheets/d/1uOCUV71OYLoP2kpjxLG-kJDmYlKzfaz8QigCHIcIZ8s/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明
* ログインすることで、ヘッダーに町内会費支払いボタン、投稿ボタンの表示[![Image from Gyazo](https://i.gyazo.com/62ee30fbbe472d763400a99985f37af9.gif)](https://gyazo.com/62ee30fbbe472d763400a99985f37af9)<br><br>

* お知らせ一覧表示及び詳細表示[![Image from Gyazo](https://i.gyazo.com/4e06584e34092acfe95f2f41a119afc4.gif)](https://gyazo.com/4e06584e34092acfe95f2f41a119afc4)<br><br>

* お知らせ詳細画面にて、コメント投稿機能[![Image from Gyazo](https://i.gyazo.com/066219030b386deb61d34e1c8387952c.gif)](https://gyazo.com/066219030b386deb61d34e1c8387952c)<br><br>

* 全体画面印刷機能[![Image from Gyazo](https://i.gyazo.com/c3ba0cdf65642e7e4bd136e6835146f2.gif)](https://gyazo.com/c3ba0cdf65642e7e4bd136e6835146f2)<br><br>

* 画面上の文字の大きさ調整ボタン[![Image from Gyazo](https://i.gyazo.com/25d9cd4b17b7a81b9c4b3f24890391b6.gif)](https://gyazo.com/25d9cd4b17b7a81b9c4b3f24890391b6)<br><br>

* クレジットカード支払い機能[![Image from Gyazo](https://i.gyazo.com/4b97ed68fda6bf7d05077418475aeb06.gif)](https://gyazo.com/4b97ed68fda6bf7d05077418475aeb06)<br><br>

* お知らせ内容機能
[![Image from Gyazo](https://i.gyazo.com/b482fff581f63615c29965255d104788.gif)](https://gyazo.com/b482fff581f63615c29965255d104788)


# 実装予定の機能
* コメント削除機能<br><br>
* 確認済み機能（いいね機能を応用）<br><br>
* 背景色と文字色の反転色選択ボタン

# データベース設計
* [![Image from Gyazo](https://i.gyazo.com/cab2e6ffe0aab049ef54554aea049174.png)](https://gyazo.com/cab2e6ffe0aab049ef54554aea049174)

#　画面遷移図	
* [![Image from Gyazo](https://i.gyazo.com/5d85ebae55938619504b47755dc2e198.png)](https://gyazo.com/5d85ebae55938619504b47755dc2e198)


#　開発環境	使用した言語・サービスを記載。
* Ruby / Ruby on Rails / Javascript / Jquery / MySQL / GitHub / Visual Studio Code<br><br>
 
#　ローカルでの動作方法
* % git clone https://github.com/yahobaby/guruguru.git<br>
* % cd guruguru<br>
* % bundle install<br>
* % yarn install

# 工夫したポイント
* 制作背景 :超高齢社会に突入した、現在の町内会。<br><br>
14世帯の方々が住まれてる中、情報共有方式や、町内会費の徴収方法の効率化の必要性を感じた。<br><br>
そこで、既存のアナログ式回覧板をデジタルへ切り替え、情報の正確さ、速さの向上を
図ると同時に、<br><br>班長の業務負担を減らすことを目的で、本アプリの制作に臨んだ。
<br>
* 使用技術 : Railsを土台に、フロントエンドの印刷や文字の大きさ調整、クレジット支払い機能に関しては、<br><br>Jqueryを使用している。データベースでは汎用性や補修性が高い、Mysqlを使っている。

* 開発方法：Visual Studio Codeにてコード作成、修正




## ①usersテーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| nickname              | string      | null: false                    |
| email                 | string      | null: false, unique: true      |
| encrypted_password    | string      | null: false                    |

### users Association
- has_many : infos
- has_many : comments
- has_many : credit_card_payments


## ②infoテーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| user                  | references  | null: false, foreign_key: true |
| title                 | string      | null: false                    |
| text                  | text        | null: false                    |

### info Association
- belongs_to : user
- has_many : comments 

## ③commentテーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| user                  | references  | null: false, foreign_key: true |
| info                  | references  | null: false, foreign_key: true |
| text                  | text        | null: false                    |

### info Association
- belongs_to : user
- belongs_to : info

## ④credit_card_paymentテーブル
| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| user                  | references  | null: false, foreign_key: true |
| price                 | integer     | null: false                    |
| name                  | string      | null: false                    |
| period                | integer     | null: false                    |
| note                  | string      |                                |

### credit_card_payment Association
- belongs_to : user