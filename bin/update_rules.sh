#!/usr/bin/env bash

#====================================================================================================#
#                         mosdns @https://github.com/IrineSistiana/mosdns/releases
#====================================================================================================#

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# 切换到脚本所在目录
cd "$SCRIPT_DIR" || exit
echo "Script directory: $SCRIPT_DIR"

# github 下载代理
# github_proxy=https://ghproxy.org
github_proxy=https://gh-proxy.com

# online-rules
cd ../online_rules || exit
wget $github_proxy/https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt -O geoip_cn.txt
wget $github_proxy/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt -O geosite_cn.txt
wget $github_proxy/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/apple-cn.txt -O geosite_cn_apple.txt
wget $github_proxy/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/proxy-list.txt -O geosite_no_cn.txt
wget $github_proxy/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/reject-list.txt -O adlist.txt

# custom-rules
# cd ../custom_dir || exit
# echo "localhost 127.0.0.1"> hosts.txt
