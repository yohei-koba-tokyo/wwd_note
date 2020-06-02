


# DB creation

### user テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|twitter|string||
|image|string||

##### - Association -

- has_many :relationships
- has_many :memos
- has_many:notes
- has_many:comments
- has_one :config



### relationship テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null:false|
|follow_id|integer|foreign_key: {to_table: users}, null:false|

##### - Association -
- belongs_to :user
- belongs_to :follow


### config テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null:false|
|plan|integer|null:false|
|remind|integer|null:false|
|publishing|integer|null:false|

##### - Association -
- belongs_to :user

### memo テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null:false|
|memo|string|null:false|

##### - Association -
- belongs_to :user


### note テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null:false|