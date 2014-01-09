
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


**************************
REVISI PA HANDI & PA WAWAN
**************************

- setelah like harus ada label 'you like this place'
- view comment dibuka saja dan dibuat more
- kalau diri sendiri tampilkan 'you has comment'
- tidak perlu ada created by
- status true diganti aktif
- posisikan location finder find button ke atas
- create workshop dengan urutan:
  - name
  - address
  - type
  - location
  - show map button
  - submit ada di paling bawah
- bukan create workshop ganti menjadi new contribution
- ganti input field styling, input di full space
- harus ada informasi berapa yang like
- ganti penamaan workshop
- ganti penamaan web