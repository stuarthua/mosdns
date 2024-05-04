#!/usr/bin/env bash

# source ~/.config/stuart/scripts/base/basic.sh

#====================================================================================================#
#                         mosdns @https://github.com/IrineSistiana/mosdns/releases
#====================================================================================================#

# github 下载代理
# github_proxy=https://ghproxy.org
github_proxy=https://gh-proxy.com

# online-rules
target_dir=~/.config/stuart/mosdns/online_rules
cd "$target_dir" || exit
wget $github_proxy/https://raw.githubusercontent.com/Loyalsoldier/geoip/release/text/cn.txt -O geoip_cn.txt
wget $github_proxy/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt -O geosite_cn.txt
wget $github_proxy/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/apple-cn.txt -O geosite_cn_apple.txt
wget $github_proxy/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/proxy-list.txt -O geosite_no_cn.txt
wget $github_proxy/https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/reject-list.txt -O adlist.txt

# custom-rules
# custom_dir=~/.config/stuart/mosdns/custom_rules
# cd "$custom_dir" || exit
# echo "localhost 127.0.0.1"> hosts.txt
