# 敏捷開發實作專案 Stack Overflow

### Installing：
```
$ git clone https://github.com/RiemannAC/stack-overflow.git
$ cd stack-overflow
$ bundle install
$ rails db:migrate
```
### Generate seed data and fake data
Seed file generate a admin role
```
$ rails db:seed
```
Fake data
```
$ rails dev:fake_user
$ rails dev:fake_question
$ rails dev:fake_favorite
```
## User stories
#### 使用者可以創建新帳號
- 使用者帳號欄位請包含：（* 為必填欄位）
  - 姓名 *
  - Email *
  - 密碼 *
  - 公司
  - 職稱
  - 簡介
  - 個人網站連結
  - Twitter 連結
  - GitHub 連結
#### 使用者可以登入／登出帳戶
- 使用者不需登入就可以瀏覽問題和解答
- 使用者需要登入才可以發表問題
- 使用者需要登入才可以發表解答
- 使用者註冊帳號時需要填寫姓名、Email、密碼
- 使用者的 Email 唯一、不可重複
#### 使用者可以在其他使用者的個人頁面瀏覽以下資訊：
- 個人頁面資訊：姓名、公司、職稱、個人網站連結、Twitter 連結、GitHub 連結
- 已發表的問題數量
- 已發表的解答數量
- 獲得最多 upvote 問題的 upvote 數量
- 獲得最多 upvote 解答的 upvote 數量
- 獲得的 upvote 總數（問題＋解答）
#### 使用者可以瀏覽自己的個人頁面資訊
#### 使用者可以編輯自己的個人頁面資訊
#### 使用者可以發表問題
- 發表問題的欄位請包含：（* 為必填欄位）
- 標題 *
- 內容 *
#### 使用者可以在首頁瀏覽問題列表
- 在列表上的每個問題，請包含以下資訊：
  - 問題標題
  - 問題內容摘要（只摘要前 100 字）
  - 問題發問者（顯示姓名）
  - 問題發表時間
  - 問題獲得 favorite 的數量
  - 問題獲得 upvote 的數量
  - 問題獲得解答的數量

#### 使用者點選問題後可以瀏覽以下資訊：
- 問題標題
- 問題內容
- 問題發問者（顯示姓名）
- 問題發表時間
- 問題獲得 favorite 的數量
- 問題獲得 upvote 的數量
- 問題獲得解答的數量
- 顯示所有解答的列表（依照解答獲得的 upvote 數量排序）
- 在解答列表上的每個解答，請包含以下資訊：
  - 顯示解答者（顯示姓名）
  - 解答發表時間
  - 解答獲得的 upvote 數量
#### 使用者可以 upvote 問題
#### 使用者可以對已發表的問題發表解答（一個文字輸入欄位）
#### 使用者可以 upvote 其他使用者的解答
#### 使用者可以 favorite 問題
#### 使用者可以在一個獨立的頁面瀏覽 favorite 問題的列表
#### 後台
- 進入後台必須有管理員 (admin) 權限
- seed.rb，新增一組預設管理員，限定帳號：admin@example.com；密碼：12345678
- 後臺可以刪除問題及使用者帳號
#### Heroku
- https://ac-stack-overflow.herokuapp.com/
