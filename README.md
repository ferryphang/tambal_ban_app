
Table
=====

### 1.User
⋅⋅* Point
```
 has_many :comments
 has_many :badges
```

### 2.Admin

### 3.Location
```
has_many :comments
polymorphism
```
- Latitude
- Longitude

### 4.tambal_ban
```
has_one :category
```
- nama
- address
- about

### 5.bengkel
```
has_one :category
```
- Name
- Address
- About
- Category

### 6. user_badges

###7. badges
```    
has_many :users
```
- Name
- Picture

### 8. category
- Name
- Picture_marker

### 9. comment
```
belongs_to :location
belongs_to :user
```
- rate
- comment
