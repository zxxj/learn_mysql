# mysql



1. 安装mysql

   ```js
   mysql官网下载msi,双击安装,一路next,配置mysql密码
   ```

2. 检查mysql是否运行

   ```js
   1.右键我的电脑 => 管理 => 服务 => 搜索Mysql会发现 mysql服务的状态
   2.命令行窗口 => net stop mysql84 停止数据库运行, net start mysql84 启动数据库
   ```

3. 配置环境变量

   ```js
   1.系统环境变量新建: MYSQL_HOME 值为 C:\Program Files\MySQL\MySQL Server 8.4
   2.Path中新建: %MYSQL_HOME%\bin
   3.命令行中输入 mysql 可以确认环境配置完成
   ```

4. 如何连接mysql?

   ```js
   -u <username> 用于指定你要连接的mysql用户名
   -p <password> 表示密码,后面紧跟密码
   -h <hostname> 用于指定连接mysql服务器的地址
   -P <post> 指定数据库的端口号
   <databasename> 是你要连接的数据库的名称
   
   1. mysql -u root -p你的密码...
   或 mysql -u root -p 回车后,可以密文输入密码登录
   2. mysql -u root -p你的密码 -h127.0.0.1 -P 3006
   ```

   5.查询mysql版本与退出数据库连接

   ```js
   数据库连接成功后,可使用 select version(); 来查看数据库的版本
   exit 来退出数据库连接
   ```

   