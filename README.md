# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|
|e-mail|string|null: false,unique: true|
|password|string|null: false|
### Association
has_many :tags,dependent: :destroy
has_many :tasks,dependent: :delete_all

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user|references|null: false,foreign_key: true|
### Association
has_many :tasks,dependent: :destroy
belongs_to :user

## tasksテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|deadline|datetime|
|detail|text|
|tag|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
belongs_to :tag
belongs_to :user
validates :name, presence: true

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
