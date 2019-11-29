import time
import login
import forgetpwd

# 人工冻结 --> 等待超时 --> 查看提示
def freezeTimeTest():
    login.errorToFreeze()
    print("Start : %s" % time.ctime())
    time.sleep(33)
    print("End : %s" % time.ctime())
    login.errorToFreeze()

# 人工冻结 --> 人工错误密码 --> 查看提示
def freezeInTimeTest():
    login.errorToFreeze()
    msg = login.login_error()
    if "该账户已冻结" not in msg:
        raise RuntimeError("冻结时间内提示错误")

# 人工冻结 --> 解冻按钮 --> 人工输入错误密码 --> 查看提示
def freezeSuccess():
    login.errorToFreeze()
    login.unLockedUsers()
    msg = login.login_error()
    if "用户名或密码不正确" not in msg:
        raise RuntimeError("解冻失败 msg="+msg)


# 获取cookie
# login.ssorootLogin()
# 测试解冻是否成功
freezeSuccess()
# 超时时间内登录
freezeInTimeTest()
# 正常解冻，超时解冻
freezeTimeTest()

# 发送短信提示
forgetpwd.sendCodeTip()

# login.ssorootLogin()
# login.unLockedUsers()
# login.errorLogin()