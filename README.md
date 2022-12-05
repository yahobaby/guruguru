## ①usersテーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| nickname              | string      | null: false                    |
| email                 | string      | null: false, unique: true      |
| encrypted_password    | string      | null: false                    |

### users Association
- has_many : infos
- has_many : comments
- has_many : CreditCardPayments


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

## ④CreditCardPaymentテーブル
| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| user                  | references  | null: false, foreign_key: true |
| price                 | integer     | null: false                    |

### CreditCardPayment Association
- belongs_to : user
- has_one : CreditCardInfo

## ⑤CreditCardInfoテーブル
| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| CreditCardPayment     | references  | null: false, foreign_key: true |
| post_code             | string      | null: false                    |
| prefecture_id         | integer     | null: false                    |
| city                  | string      | null: false                    |
| address               | string      | null: false                    |
| building_name         | string      |                                |
| phone_number          | string      | null: false                    |

### CreditCardInfo Association
- belongs_to : CreditCardPayment