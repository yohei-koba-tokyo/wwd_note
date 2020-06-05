# DB creation

![erd](https://user-images.githubusercontent.com/60637308/83866540-e9d67100-a762-11ea-9aeb-e52f476dc7e5.png)

### User table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|twitter|string||
|image|string||

##### - Association -


- has_many :relationships, dependent: :destroy
- has_many :memos, dependent: :destroy
- has_many:notes, dependent: :destroy
- has_many:comments, dependent: :destroy
- has_many:likes, dependent: :destroy
- has_one :config, dependent: :destroy



### Relationship table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null:false|
|follow_id|integer|foreign_key: {to_table: users}, null:false|

##### - Association -

- belongs_to :user
- belongs_to :follow


### Config table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null:false|
|plan|integer|null:false|
|remind|integer|null:false|
|publishing|integer|null:false|
|theme|string||

##### - Association -

- belongs_to :user

### Memo table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null:false|
|memo|string|null:false|

##### - Association -

- belongs_to :user
- has_one :note


### Note table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null:false|
|memo_id|integer|foreign_key: true, null:false|
|what|string||
|why|string||
|feeling|integer||
|feeling_detail|string||
|challenge|string||

##### - Association -

- belongs_to :user
- belongs_to :memo
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

### Tutor table

|Column|Type|Options|
|------|----|-------|
|glasses|string||
|tutorial|string||

##### - Association -

none

### Comment table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null:false|
|note_id|integer|foreign_key: true, null:false|
|comment|strig|null:false|

##### - Association -

- belongs_to :user
- belongs_to :note

### Like table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|note_id|integer|null: false, foreign_key: true|

##### - Association -

- belongs_to :user
- belongs_to :note
- validates_uniqueness_of :post_id, scope: :user_id