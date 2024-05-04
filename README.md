# mosdns

> custom mosdns config

用于在 masos 中使用 mosdns 对国内外 dns 分流

- 国内 dns
- 国外 dns，使用 `socks5://127.0.0.1:7890` 代理进行查询

## 下载 mosdns

```shell
bash bin/download_mosdns.sh
```

## 更新规则

```shell
bash bin/update_rules.sh
```

## 使用

下载该项目，并初始化

```shell
mosdns_dir=~/.config/mosdns

# 下载项目
# github 下载代理
# github_proxy=https://ghproxy.org
github_proxy=https://gh-proxy.com
# 使用github代理下载 mosdns-config 项目
git clone $github_proxy/https://github.com/stuarthua/mosdns.git $mosdns_dir

# 初始化项目
cd $mosdns_dir
# 执行脚本下载 mosdns 可执行文件
bash bin/download_mosdns.sh
## 下载在线规则
bash bin/update_rules.sh
```

在 macOS 中，配置 mosdns 服务为系统服务

```shell
# 设置 mosdns 服务 (需要设置 允许 ~/.config/mosdns/mosdns 拥有完全磁盘访问权限)
sudo $mosdns_dir/mosdns service install -d $mosdns_dir -c $mosdns_dir/config.yaml

# 修改 RunAtLoad 的值为 true
sudo vi /Library/LaunchDaemons/mosdns.plist

# 设置 mosdns 服务开机自启动
sudo launchctl load -w /Library/LaunchDaemons/mosdns.plist
```

设置命令快捷方式

```shell
# 在 ~/.zshrc 或 ~/.bashrc 中添加 alias
alias mosdns="$HOME/.config/mosdns/mosdns"
```

日常管理

```shell
sudo mosdns start
sudo mosdns stop
sudo mosdns restart

# 注意，查看服务运行状态同样需要 sudo 权限，不然服务状态始终为 stopped
sudo mosdns status
```

参考: 

- [[BUG] macOS 下 mosdns -s 安装成系统服务因权限问题不启动 · Issue #357 · IrineSistiana/mosdns](https://github.com/IrineSistiana/mosdns/issues/357)
- [Linux 和 macOS 平台配置 mosdns 为系统服务](https://hgl2.com/2023/install-mosdns-in-macos/)
