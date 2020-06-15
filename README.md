# DB creation

![erd](https://user-images.githubusercontent.com/60637308/84620838-fe112f80-af13-11ea-8cb7-a050e232598c.png)

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
|feeling_detail|string||
|challenge|string||

##### - Association -

- belongs_to :user
- belongs_to :memo
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :note_feelings
- has_many :feelings, through: :note_feelings


### NoteFeeling table
|Column|Type|Options|
|------|----|-------|
|note_id|integer|foreign_key: true, null:false|
|feeling_id|integer|foreign_key: true, null:false|

#### - Association -
- belongs_to :note
- belongs_to :feeling

### Feeling table
|Column|Type|Options|
|------|----|-------|
|feel|integer||
|image|string||

#### - Association -
- has_many :note_feelings
- has_many :notes, throug: :note_feelings

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