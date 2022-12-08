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