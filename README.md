修改过后的苍蓝誓约中的lua脚本，适配版本为1.5.120的游戏包体

## 使用方法

### 如何安装此补丁

- 将仓库克隆到`clsy.exe`所在的文件夹，重命名成`lua`
- 将仓库目录中的`OfflineDataExample`目录拷贝至`clsy.exe`所在的文件夹，重命名成`OfflineData`
- 启动[fake-server](https://github.com/xys20071111/BlueOath-fake-server)后运行游戏

### 如何添加舰娘到游戏中

- 将仓库中的`config数据库解压脚本.py`复制到`clsy_Data\StreamingAssets\config`，运行该脚本
- 脚本执行结束后，进入`clsy_Data\StreamingAssets\config\config_fashion`，在此处打开VSCode或者你常用的编辑器
- 搜索你想要的舰娘的名字，找到对应的json文件，确保这个id是原版的舰娘，不是改或者时装，记录文件名中的数字部分
-  打开`OfflineData\HeroBag.json`，复制一个其中已有的条目，将`id`后的部分改成你之前记录下的数字。（注意：别把结尾的逗号删了）
- 如果你希望舰娘为誓约状态，将`isMarried`改成`true`
- 关于有时装的舰娘，看下一小节

### 设置时装

- 搜索时装时请使用时装的名字在`clsy_Data\StreamingAssets\config\config_fashion`中搜索
- 基本步骤同上一小结，但要注意，须在条目中增加一条`TemplateId`（一般为原版船的id后面加一个`1`,以奥克兰为例，她的原始id是`1021051`，则`TemplateId`为`10210511`）

此处以奥克兰为例，添加原版奥克兰的条目是
```
{
    "id": 1021051,
    "isMarried": false,
    "Level": 10
}
```
而泳装奥克兰是
```
{
    "id": 1021054,
    "TemplateId": 10210511,
    "isMarried": false,
    "Level": 10
}
```

### 如何设置秘书舰
- 从一开始，数一下舰娘是`HeroBag.json`的第几个
- 打开`OfflineData\UserData.json`，将`SecretaryId`改成你数出来的那个数

### 如何设置基建信息
-  打开`OfflineData\BuildingInfo.json`，参照已有条目进行修改，以下是Tid与建筑的对应关系

|Tid|建筑类型|
|---|-------|
|1|办公室|
|11|奥斯能源室|
|21|炼油厂|
|31|深夜居酒屋|
|41|宿舍|
|51|真朱寮食堂|
|61|生产部|

- `HeroList`的设置方法同秘书舰，你可以无视原有的人数限制，放入你想放入的舰娘

### 锁定提督室环境
- 在`UserSettings.json`中添加`HomeScene`条目，以下是可用值与时间的对应关系

|场景名称|时间|
|-------|----|
|scenes/cj_tds_001|白天|
|scenes/cj_tds_002|黄昏|
|scenes/cj_tds_001|夜晚|
|scenes/cj_zjm_001|旧版白天|
|scenes/cj_zjm_002|旧版黄昏|
|scenes/cj_zjm_003|旧版夜晚|

本仓库仅供学习交流使用