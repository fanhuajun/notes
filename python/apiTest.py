import time
import login
import forgetpwd


def stable():
    # 获取cookie
    # login.ssorootLogin()
    # 测试解冻是否成功
    login.freezeSuccess()
    # 超时时间内登录
    login.freezeInTimeTest()
    # 正常解冻，超时解冻
    login.freezeTimeTest()

    # 发送短信提示
    forgetpwd.sendCodeTip()


login.ssorootLogin()
# stable()
