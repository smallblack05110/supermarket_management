# supermarket_management
数据库系统大作业  

下载文件后按照以下步骤操作即可：  

1.安装 Python 依赖    

   pip install -r requirements.txt  
   
2.在MySQL上创建一个空白数据库  

  CREATE DATABASE supermarket_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;  
  
3.导入结构和数据  

  mysql -u root -p supermarket_management < db/schema_and_data.sql  
  
4.运行flask应用  

  python app.py
