


# DB creation

### user テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|twitter|string||
|image|string||

##### Association
- has_many :



### relationship テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|follow_id|integer|foreign_key: {to_table: users}|

##### Association
- has_many :