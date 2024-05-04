#!/usr/bin/env bash

# source ~/.config/stuart/scripts/base/basic.sh

#*************************************************************
#                         mosdns
#*************************************************************

#@https://github.com/IrineSistiana/mosdns/releases

RED_COLOR='\033[1;31m'
GREEN_COLOR='\033[1;32m'
RES='\033[0m'

# 下载文件
download_file() {
    local url="$1"
    local filename="$2"

    echo -e "${GREEN_COLOR}Downloading $filename ...${RES}"

    curl --connect-timeout 30 -m 600 -kLo "$filename" "$url"

    if [ $? -ne 0 ]; then
        echo -e "${RED_COLOR}Error! Downloading $filename failed.${RES}"
        exit 1
    fi

    echo -e "${GREEN_COLOR}Downloaded $filename successfully.${RES}"
}

# 解压 zip 文件
unzip_file() {
    local zipfile="$1"

    echo -e "${GREEN_COLOR}Unzipping $zipfile ...${RES}"

    # 列出压缩文件中的文件列表，并通过 grep 过滤出你想要保留的文件
    file_to_keep="mosdns"
    unzip -l "$zipfile" | grep "$file_to_keep"
    # 如果以上命令显示出了你想要保留的文件，那么执行下面的命令来只解压该文件
    unzip -oq "$zipfile" "$file_to_keep"

    if [ $? -ne 0 ]; then
        echo -e "${RED_COLOR}Error! Unzipping $zipfile failed.${RES}"
        exit 1
    fi

    echo -e "${GREEN_COLOR}Unzipped $zipfile successfully.${RES}"
    rm -rf $zipfile
}

## 测试下载
# curl --connect-timeout 30 -m 600 -kLo "mosdns-darwin-amd64.zip" "https://github.com/IrineSistiana/mosdns/releases/download/v5.3.1/mosdns-darwin-amd64.zip"

# 下载 mosdns-darwin-amd64.zip
download_file "https://github.com/IrineSistiana/mosdns/releases/download/v5.3.1/mosdns-darwin-amd64.zip" "mosdns-darwin-amd64.zip"

echo ""

# 解压文件
unzip_file "mosdns-darwin-amd64.zip"
