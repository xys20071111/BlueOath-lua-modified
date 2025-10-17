修改过后的苍蓝誓约中的lua脚本，适配版本为1.5.120的游戏包体

## 使用方法

### 如何安装此补丁

- 将仓库克隆到`clsy.exe`所在的文件夹，重命名成`lua`
- 将仓库目录中的`OfflineDataExample`目录拷贝至`clsy.exe`所在的文件夹，重命名成`OfflineData`
- 启动[fake-server](https://github.com/xys20071111/BlueOath-fake-server)后运行游戏

### 如何添加舰娘到游戏中

- 将仓库中的`config数据库解压脚本.py`复制到`clsy_Data\StreamingAssets\config`，运行该脚本
- 脚本执行结束后，进入`clsy_Data\StreamingAssets\config\config_fashion`，在此处打开VSCode或者你常用的编辑器
- 搜索你想要的舰娘的名字，找到对应的json文件，记录文件名中的数字部分
-  打开`OfflineData\HeroBag.json`，复制一个其中已有的条目，将`id`后的部分改成你之前记录下的数字。（注意：别把结尾的逗号删了）
- 如果你希望舰娘为誓约状态，将`isMarried`改成`true`

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

跳过版本校验的`fake-server`之后会上传

本仓库仅供学习交流使用