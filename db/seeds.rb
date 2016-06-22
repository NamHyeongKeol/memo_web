# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Memo.create(title: "asdf", content: "asdfasdf")
Memo.create(title: "qwer", content: "qwerqwer")
Memo.create(title: "zxcv", content: "zxcvzxcv")
Memo.create(title: "1234", content: "12341234")

Label.create(name: "tag1")
Label.create(name: "tag2")
Label.create(name: "tag3")
Label.create(name: "tag4")

Taging.create(memo_id: 1,label_id: 1)
Taging.create(memo_id: 1,label_id: 2)
Taging.create(memo_id: 1,label_id: 3)
Taging.create(memo_id: 1,label_id: 4)
Taging.create(memo_id: 2,label_id: 3)
Taging.create(memo_id: 2,label_id: 4)
Taging.create(memo_id: 2,label_id: 2)
Taging.create(memo_id: 3,label_id: 4)
Taging.create(memo_id: 3,label_id: 2)
Taging.create(memo_id: 4,label_id: 3)
