![ramenTimer](https://user-images.githubusercontent.com/57389471/73808155-4310b100-4812-11ea-8b6f-bf6a6788f7e2.gif)

<h2 align="center">メルカリクローンアプリ</h2>

<p align="center">
  <a href="https://www.ruby-lang.org/ja/"><img src="https://user-images.githubusercontent.com/57389471/73752345-276ec180-47a4-11ea-8fe1-caf19e125eeb.png" height="45px;" /></a>
  <a href="https://rubyonrails.org/"><img src="https://user-images.githubusercontent.com/57389471/73752059-9697e600-47a3-11ea-89c1-47465384c4fb.png" height="40px;" /></a>
  <a href="http://haml.info/"><img src="https://user-images.githubusercontent.com/57389471/73752833-fba00b80-47a4-11ea-96d7-54c5e6808403.png" height="55px;" /></a>
  <a href="https://sass-lang.com/"><img src="https://user-images.githubusercontent.com/57389471/73752910-1a060700-47a5-11ea-90e4-0c95d7e3e4ed.png" height="55px;" /></a>
  <a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/57389471/73754740-38213680-47a8-11ea-8dc7-9a7dfa30c992.png" height="50px;" /></a>
  <a href="https://www.mysql.com/jp/"><img src="https://user-images.githubusercontent.com/57389471/73753087-6e10eb80-47a5-11ea-8a91-47f816398fcb.png" height="60px;" /></a>
  <a href="https://aws.amazon.com/jp/"><img src="https://user-images.githubusercontent.com/57389471/73807685-a568b200-4810-11ea-9b66-121e4ba95ecc.png" height="65px;" /></a>
</p>

<p align="center"><br>
<b><a>- Contributors -</a></b><br><br>
<b><a><a href="https://github.com/Yo-Su"><img src="https://user-images.githubusercontent.com/57389471/73809380-78b79900-4816-11ea-98b6-0e5677d28f48.png" width="70px;" style="border-radius: 50%;" /></a></b>
<b><a><a href="https://github.com/kodaikodai"><img src="https://user-images.githubusercontent.com/57389471/73809446-a866a100-4816-11ea-9027-943df0665134.png" width="70px;" />   </a></b>
<b><a><a href="https://github.com/natsuki-tacica"><img src="https://user-images.githubusercontent.com/57389471/73809501-c6340600-4816-11ea-98c5-9a0e5bd3bdf0.png" width="70px;" /></a></b>
<b><a><a href="https://github.com/wakuwakukatsu"><img src="https://user-images.githubusercontent.com/57389471/73809526-d946d600-4816-11ea-9b27-4977037e67b5.png" width="70px;" />     </a></b>
<b><a><a href="https://github.com/tsuchida031025"><img src="https://user-images.githubusercontent.com/57389471/73809540-ec59a600-4816-11ea-970c-a52c2d2ba22b.png" width="70px;" />   </a></b>
</p>


## このアプリについて
プログラミングスクールのTECH::EXPERTにて、５人チームでスクラムを用いたアジャイル開発にて作成いたしました。

## URL
http://18.177.70.129
* ID: freemarket_sample_64d
* Pass: 64_mercari_team-d

## データベース設計
<p align="center">
  <img src="https://user-images.githubusercontent.com/57389471/73810486-ff21aa00-4819-11ea-9260-b310bc902bc4.png" width=80%>
</p>

## userテーブル
|Column|Type|Options|
|------|----|-------|
|nick_name|string|null: false|unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|
|password|string|null: false|
|mail_address|string|null: false|unique: true|
|phone_number|integer|null: false|unique: true|
### Association
- has_many :cashflows,dependent: :destroy
- has_many  :addresses,dependent: :destroy
- has_many  :credit_card_infos,dependent: :destroy
- has_many  :messages,dependent: :destroy
- has_many  :items,dependent: :destroy
- has_many  :likes,dependent: :destroy

## cashflowテーブル
|Column|Type|Options|
|------|----|-------|
|amount|integer|null: false|
|point|integer|null: false|
|type|string|null: false|
|date|date|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|post_number|integer|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|block|string|null: false|
|building|string|
|phone_number|integer|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## credit_card_infoテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|pin_number|integer|null: false|
|expiration_date|date|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## messageテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## imageテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- has_many  :items


## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user


## itemテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|
|name|string|null: false|
|from_delivery_area|string|null: false|
|to_delivery_area|string|null: false|
|price|integer|null: false|
|delivery_date|date|null: false|
|size|string|null: false|
|grade|string|null: false|
|transfer_fee|string|null: false|
|delivery_type|string|null: false|
|describe|string|null: false|
|buyer_id|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
### Association
- has_many  :images,dependent: :destroy
- has_many  :messages,dependent: :destroy
- has_many  :likes,dependent: :destroy
- belongs_to :user
- belongs_to :brand
- belongs_to :category

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many  :items
- has_ancestry


