# data structure

## users
- id (PRIMARY KEY)
- name
- token
- high_score
- coin
- created_at
- updated_at

## collection_items
- id (PRIMARY KEY)
- name
- rarity

## user_collections
- user_id (PRIMARY KEY, FOREIGN KEY(users.id))
- collection_id (PRIMARY KEY, FOREIGN KEY(collection_items.id))
- created_at

## gacha_contents
- collection_id (PRIMARY KEY, FOREIGN KEY(collection_items.id))
- weight

## rankings
- user_id (PRIMARY KEY, FOREIGN KEY(users.id))
- score
- updated_at