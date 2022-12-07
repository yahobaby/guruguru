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

### credit_card_payment Association
- belongs_to : user
- has_one : credit_card_info

## ⑤credit_card_infoテーブル
| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| credit_card_payment     | references  | null: false, foreign_key: true |
| post_code             | string      | null: false                    |
| prefecture_id         | integer     | null: false                    |
| city                  | string      | null: false                    |
| address               | string      | null: false                    |
| building_name         | string      |                                |
| phone_number          | string      | null: false                    |

### CreditCardInfo Association
- belongs_to : credit_card_payment