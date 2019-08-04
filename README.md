# 5xRuby Practice
### Environment Version
* Ruby 2.6.3

* Rails 5.2.3

### ER Diagram
![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/5rubyproject.png)

### Heroku Deploy
1. ```heroku login```
2. ```heroku create``` (when first time use)
3. ```git push heroku master```
4. ```heroku run rails db:migrate```

# Flow Description

### Testing Account

| Name | Password | Admin |
| ------ | ------ | ------ |
| root | 123 | Y |
| test1 | 123 | N |
| test2 | 123 | N |
| test3 | 123 | N |
| test4 | 123 | N |

Environment: [Mission Management]  (Heroku)

### Img Description
![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/img/1.png)
首頁畫面

![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/img/2.png)
登入畫面

![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/img/3.png)
登入成功後，即有```任務列表```、```新增任務```等功能，
如角色為```Admin```，額外擁有```管理帳戶```功能。

![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/img/4.png)
```任務列表```可查看任務，
* 角色為```Admin```則可查看所有使用者的任務。
* ```一般使用者```只能查看自己的任務。
* 使用```ransack```達成```搜尋```與```排序```功能

![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/img/5.png)
新增任務

![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/img/6.png)
更新任務

![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/img/7.png)
使用```kaminari```自動分頁

![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/img/8.png)
Admin所擁有的```管理帳戶```功能，可查看所有使用者
* 提供```設定管理者```功能
* 提供```刪除```使用者功能
* 不能對自己做```刪除```動作

![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/img/9.png)
點擊```使用者名稱```可以查看該使用者的任務

![alt text](https://github.com/dt9250810/MissionManagement/blob/master/docs/img/10.png)
```一般使用者```登入後任務列表畫面


[Mission Management]: <https://afternoon-depths-22098.herokuapp.com/>