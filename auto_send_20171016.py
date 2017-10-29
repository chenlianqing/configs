#! /Users/chenlianqing/anaconda/bin python
# -*- coding: utf-8 -*


import arrow
import time


# 调用并运行绩效测算脚本文件
def coupon_email():
    with open('/Users/chenlianqing/工作－学习/爱投资工作/3、数据分析/4、运营效果/抽奖活动20171016/coupon_data_20171018（修改）.py', mode='r') as f:
        exec(f.read(), {})
        time.sleep(60)


# 规定自动运行时间
def auto_send(m=54):
    while True:
        while True:
            now = arrow.now()
            if  now.minute == m:
                break
            time.sleep(60)
        coupon_email()

auto_send()
