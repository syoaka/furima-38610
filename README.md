# README

## users テーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false, unique: true |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| family_name      | string | null: false               |
| first_name       | string | null: false               |
| family_name_kana | string | null: false               |
| first_name_kana  | string | null: false               |
| birth_year       | string | null: false               |
| birth_month      | string | null: false               |
| birth_day        | string | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :shipping_addresses

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| text             | text       | null: false       |
| category         | string     | null: false       |
| pay_for_shipping | string     | null: false       |
| shipping_area    | string     | null: false       |
| shipping_day     | string     | null: false       |
| price            | integer    | null: false       |
| image            | string     | null: false       |
| user_id          | references | foreign_key: true |

### Association

- belongs_to :users
- has_one    :orders

## orders テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user_id  | references | foreign_key: true |
| items_id | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :shipping_addresses

## shipping_addresses テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| post_code  | string     | null: false       |
| prefecture | string     | null: false       |
| city       | string     | null: false       |
| address1   | string     | null: false       |
| address2   | string     | null: false       |
| telephone  | integer    | null: false       |
| user_id    | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :orders
