###
 # @Description: your description
 # @Module: module.name
 # @Author: Draco
 # @Email: Draco.coder@gmail.com
 # @Github: https://github.com/draco-china
 # @Date: 2020-05-10 22:41:30
 # @LastEditTime: 2020-05-10 22:43:02
 ###
#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# fw876/helloworld
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Lienol/openwrt-package
#sed -i '$a src-git lienol https://github.com/TinyTitanPro/lienol-openwrt-package.git' feeds.conf.default
