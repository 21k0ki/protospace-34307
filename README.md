# ProtoSPACEのER図

## users テーブル

|  Column      | Type   | options   |
| ------------ | -------| --------- |
| email        | string | null:false|
| password     | string | null:false|
| name         | string | null:false|
| profile      | text   | null:false|
| occupation   | text   | null:false|
| position     | text   | null:false|

### Associaion

- has_many :prototypes
- has_many :comments


## prototypes テーブル

|  Column      | Type         | Options                      |
| ------------ | -------      | ---------                    |
| title        | string       | null:false                   |
| catch_copy   | string       | null:false                   |
| concept      | text         | null:false                   |
| user         | references   | null:false, foreign_key: true|

### Associaion

- belongs_to :user
- has_many :comments


## comments テーブル

| Column     | Type       | Options                      |
| ---------- | ---------- | -----------                  |
| text       | text       | null:false                   |
| user       | references | null,false, foreign_key :true|
|prototype   | references | null,false, foreign_key :true|

### Associaion

- belongs_to :user
- belongs_to :prototype
