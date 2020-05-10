#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# 取掉默认主题
sed -i 's/ +luci-theme-bootstrap//g' feeds/luci/collections/luci/Makefile 

# WIFI名为MAC后六位
rm -rf package/kernel/mac80211/files/lib/wifi/mac80211.sh
cp -f ../mac80211.sh package/kernel/mac80211/files/lib/wifi/

# 替换banner
rm -rf package/base-files/files/etc/banner
cp -f ../banner package/base-files/files/etc/

# 自定义固件
rm -rf package/default-settings/files/zzz-default-settings
cp -f ../zzz-default-settings package/lean/default-settings/files/


# 添加温度显示(By YYiiEt)
sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# 修改固件生成名字,增加当天日期(by:左右）
sed -i 's/IMG_PREFIX:=$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=Draco-china-$(shell date +%Y%m%d)-$(VERSION_DIST_SANITIZED)/g' include/image.mk

# 修改版本号
sed -i 's/V2020/V$(date "+%Y.%m.%d")/g' package/lean/default-settings/files/zzz-default-settings

# 切换
sed -i 's/Lean/Snapshot/g' package/base-files/files/etc/banner

# 修改版本号
sed -i 's/V2020/V${{ env.DATE }}/g' package/base-files/files/etc/banner


# 添加第三方软件包
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilterx
# git clone https://github.com/ClayMoreBoy/luci-app-serverchan.git package/luci-app-serverchan
git clone https://github.com/ClayMoreBoy/luci-app-adguardhome.git package/luci-app-adguardhome
# git clone https://github.com/vernesong/OpenClash package/luci-app-OpenClash
git clone https://github.com/ujincn/smartdns.git package/smartdns
git clone https://github.com/ujincn/luci-app-smartdns-compat.git package/luci-app-smartdns-compat
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-atmaterial package/luci-theme-atmaterial

