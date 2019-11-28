import time
import apiDef

# 测试冻结时间
def freezeTimeTest():
    # password1.unLockedUsers()
    apiDef.freeze()
    print ("Start : %s" % time.ctime())
    time.sleep(66)
    print ("End : %s" % time.ctime())
    apiDef.login_error()

# 测试多次密码错误冻结
def pwdErrorTip():
    apiDef.unLockedUsers()
    apiDef.freeze()

# 测试多次密码错误冻结
# pwdErrorTip()
