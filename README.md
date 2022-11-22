## ①usersテーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| nickname              | string      | null: false                    |
| email                 | string      | null: false, unique: true      |
| encrypted_password    | string      | null: false                    |
| lastname_kana         | string      | null: false                    |
| firstname_kana        | string      | null: false                    |
| lastname_kanji        | string      | null: false                    |
| firstname_kanji       | string      | null: false                    |
| birthday              | date        | null: false                    |

### users Association
- has_many : infos

## ②infoテーブル

| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| user                  | references  | null: false, foreign_key: true |
| title                 | string      | null: false                    |
| text                  | text        | null: false                    |

### info Association
- belongs_to : user

<!-- ## ③credit_payテーブル
| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| user                  | references  | null: false, foreign_key: true |

### credit_pay Association
- belongs_to : user
- has_one : credit_info

## ④credit_infoテーブル
| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| credit                | references  | null: false, foreign_key: true |
| post_code             | string      | null: false                    |
| prefecture_id         | integer     | null: false                    |
| city                  | string      | null: false                    |
| address               | string      | null: false                    |
| building_name         | string      |                                |
| phone_number          | string      | null: false                    |

### credit_info Association
- belongs_to : credit_pay -->