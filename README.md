# README

ブクログに登録された情報を、数日後に自分宛にメールを送るアプリケーション。

## デプロイ方法
- サーバー：heroklu
- Herokuアプリ： https://dashboard.heroku.com/apps
```
$ heroku login
$ heroku push origin master
```

## タスクの実行
- n 日前に更新された、AccountBooksのデータをメールで送る
- Herokuで毎朝8時に実行される
```
$ heroku run rails send_mail:book_remind_mail[n]
```

- BookLogのデータをスクレイピングする
- Herokuで毎日0時に実行する
```
$ heroku run rails scrape_account:scrape_and_book_registe
```

## DB接続情報を確認
```
$ heroku pg:credentials:url --app book-log-remind    
```

## Heroku Scheduler(バッチ)
- https://dashboard.heroku.com/apps/book-log-remind/scheduler
