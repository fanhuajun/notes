VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   Caption         =   "车辆管理系统"
   ClientHeight    =   4365
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6330
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4365
   ScaleWidth      =   6330
   StartUpPosition =   2  '屏幕中心
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   6240
      Top             =   1440
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   6360
      Top             =   4080
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton Key_OpenCom 
      Caption         =   "连接管理系统"
      Height          =   375
      Left            =   0
      TabIndex        =   20
      Top             =   240
      Width           =   3615
   End
   Begin VB.CommandButton Key_Sock 
      Caption         =   "连接"
      Height          =   375
      Left            =   2640
      TabIndex        =   19
      Top             =   840
      Width           =   975
   End
   Begin VB.TextBox DK 
      Height          =   375
      Index           =   1
      Left            =   960
      TabIndex        =   18
      Text            =   "8080"
      Top             =   840
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   3615
      Left            =   3840
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   14
      Top             =   720
      Width           =   2295
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   5040
      Top             =   120
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   5760
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.Timer Timer1_RecAllTimeOut 
      Enabled         =   0   'False
      Left            =   3720
      Top             =   -120
   End
   Begin VB.Frame Frame3 
      Caption         =   "增加卡片"
      Height          =   1215
      Left            =   120
      TabIndex        =   6
      Top             =   3120
      Width           =   3615
      Begin VB.TextBox AddName 
         Height          =   375
         Left            =   1440
         TabIndex        =   11
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox AddNum 
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   600
         Width           =   1095
      End
      Begin VB.CommandButton AddKey 
         Caption         =   "增加"
         Height          =   375
         Left            =   2640
         TabIndex        =   9
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "车牌"
         Height          =   180
         Index           =   10
         Left            =   480
         TabIndex        =   8
         Top             =   360
         Width           =   360
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "姓名"
         Height          =   180
         Index           =   9
         Left            =   1920
         TabIndex        =   7
         Top             =   360
         Width           =   360
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "信息栏"
      Height          =   1575
      Left            =   120
      TabIndex        =   0
      Top             =   1440
      Width           =   3615
      Begin MSWinsockLib.Winsock TCPA 
         Left            =   1680
         Top             =   1200
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.TextBox Info 
         Height          =   375
         Index           =   2
         Left            =   120
         TabIndex        =   16
         Top             =   600
         Width           =   855
      End
      Begin VB.CommandButton Command1 
         Caption         =   "查找"
         Height          =   375
         Left            =   600
         TabIndex        =   12
         Top             =   1080
         Width           =   975
      End
      Begin VB.CommandButton DelKey 
         Caption         =   "删除"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2160
         TabIndex        =   5
         Top             =   1080
         Width           =   855
      End
      Begin VB.TextBox Info 
         Enabled         =   0   'False
         Height          =   375
         Index           =   1
         Left            =   2280
         TabIndex        =   4
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox Info 
         Enabled         =   0   'False
         Height          =   375
         Index           =   0
         Left            =   1080
         TabIndex        =   3
         Top             =   600
         Width           =   1095
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "卡片"
         Height          =   180
         Index           =   6
         Left            =   480
         TabIndex        =   15
         Top             =   360
         Width           =   360
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "车牌"
         Height          =   180
         Index           =   5
         Left            =   2640
         TabIndex        =   2
         Top             =   360
         Width           =   360
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "姓名"
         Height          =   180
         Index           =   4
         Left            =   1440
         TabIndex        =   1
         Top             =   360
         Width           =   360
      End
   End
   Begin VB.Timer Timer_RecTimeOut 
      Enabled         =   0   'False
      Left            =   3240
      Top             =   1080
   End
   Begin VB.OLE OLE1 
      Class           =   "Excel.Sheet.8"
      Height          =   375
      Left            =   3960
      OleObjectBlob   =   "Form1.frx":0000
      TabIndex        =   21
      Top             =   6720
      Width           =   855
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "网页端口"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   0
      Left            =   0
      TabIndex        =   17
      Top             =   840
      Width           =   960
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "进出入记录"
      Height          =   180
      Left            =   3840
      TabIndex        =   13
      Top             =   360
      Width           =   900
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim GucRxDate() As Byte, GucTxDate() As Byte  '将采用动态数组
Dim GucUartDate(30) As Byte
Dim GucSendCount As Integer, Flag_NewDate As Boolean, Flag_UartOpen As Boolean

Dim Flag_SendOther As Boolean
Dim FlagEvent As Integer, FlagNetOPen As Boolean
Public ADO_Path As String, ADO_Path1 As String
Dim Adocn As ADODB.Connection
Dim strkaoqin(100) As String, cntkaoqin As Integer


Private Sub Command1_Click() '查找
    Dim Adors As New ADODB.Recordset
    Dim SF As Boolean
    Adors.ActiveConnection = Adocn
    
    Info(0) = Trim(Info(0))
    Info(1) = Trim(Info(1))

    str1 = "Select *From " & "注册表" & " where 卡号 = " & "'" & Info(2) & "' "
    Adors.Open str1
     
    If Adors.EOF = True Then  '没获取成功
        mCol = MsgBox("没找到,请重新检查!", vbOKOnly, "警告")
        Info(0) = ""
        Info(1) = ""
        Info(2) = ""
        DelKey.Enabled = False
    Else
        Info(0) = Adors.Fields("车牌")
        Info(1) = Adors.Fields("姓名")
        Info(2) = Adors.Fields("卡号")
        DelKey.Enabled = True
    End If
End Sub




    





Private Sub Command2_Click()
  Dim i As Long
    Dim j As Long
    Dim objExl As Excel.Application   '声明对象变量
    Me.MousePointer = 11            '改变鼠标样式
    Set objExl = New Excel.Application    '初始化对象变量
    objExl.SheetsInNewWorkbook = 1  '将新建的工作薄数量设为1
    objExl.Workbooks.Add          '增加一个工作薄
    objExl.Sheets(objExl.Sheets.Count).Name = "book1"  '修改工作薄名称
    objExl.Sheets.Add , objExl.Sheets("book1") '增加第二个工作薄在第一个之后
    objExl.Sheets(objExl.Sheets.Count).Name = "book2"
    objExl.Sheets.Add , objExl.Sheets("book2") '增加第三个工作薄在第二个之后
    objExl.Sheets(objExl.Sheets.Count).Name = "book3"
    objExl.Sheets("book1").Select     '选中工作薄<book1>
    For i = 1 To 50                   '循环写入数据
        For j = 1 To 5
            If i = 1 Then
                objExl.Selection.NumberFormatLocal = "@"  '设置格式为文本
                objExl.Cells(i, j) = " E " & i & j
            Else
                objExl.Cells(i, j) = i & j
            End If
        Next
    Next
End Sub

Private Sub DelKey_Click() '删除键

    GucUartDate(0) = &H59
  '  GucUartDate(1) = Hex(Info(2))
'    GucUartDate(2) = Hex(Info(2))
    For i = 0 To 9
        GucUartDate(i + 1) = Mid(Info(2), i + 1, 1)
    Next i
    GucUartDate(i + 1) = 13
    GucSendCount = i + 2
    Timer1_RecAllTimeOut.Interval = 3000 '接收超时
    Form1.Enabled = False
    FlagEvent = 3
    Call UartSend
    
End Sub


Private Sub Form_Load()
    Dim mDataBaseName As String
    Dim mCnnStr As String
    Dim cCnn As New ADODB.Connection
    Dim cat As New ADOX.Catalog
    Dim mTable As New ADOX.Table
    Dim mCol As New ADOX.Column
    Dim Adors As New ADODB.Recordset
    Adors.ActiveConnection = Adocn
    Dim str1 As String

    Set Adocn = New ADODB.Connection
'    Dim I As Long, Ls As8 String
    Winsock1.Protocol = sckTCPProtocol
    Winsock1.LocalPort = 0
    Winsock1.RemoteHost = "192.168.11.254"
    Winsock1.RemotePort = 8080
    Strold3 = "2F" '初始化变量
    cntkaoqin = 0
            
    mDataBaseName = App.Path & "\数据文件.mdb"
    mCnnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & mDataBaseName & ";Jet OLEDB:DataBase Password=admin"
    

  '  On Error GoTo s1:
        If Dir(mDataBaseName) = "" Then '先查找文件,如果文件不存在,才新建数据库,若存在,则新建数据库会报错
            Call cat.Create(mCnnStr) '创建新带密码的数据库
            '如果数据库已经建,则cat为空,所以必须告诉系统准备使用哪个数据库,其实creat后自动修改activeconnection为最新
            cat.ActiveConnection = mCnnStr

            '新建一个表,名中不能有空格,'-','&'(表是可以,但SQL语句就会报错)
            mTable.Name = "注册表" '创建表,命名为注册表
       
            Set mCol.ParentCatalog = cat
            '创建字段
            With mTable
                
                .Columns.Append "车牌", adVarWChar, 100
                .Columns.Append "姓名", adVarWChar, 100
                .Columns.Append "卡号", adVarWChar, 100
                
                '设置主键
                'Keys.Append "PrimaryKey", ADOX.KeyTypeEnum.adKeyPrimary, "日期", "", ""
            End With
            
            '生成表
            cat.Tables.Append mTable
            
            
            Set mCol = Nothing
            Set mTable = Nothing
            Set cat = Nothing
         

            
       '     cat.Tables.Append mTable

        End If
 
        

 
        Set mCol = Nothing
        Set mTable = Nothing
        Set cat = Nothing

        '再新建另外一个表
        mTable.Name = Year(Now) & Month(Now) & Day(Now) '创建表,命名为注册表

        cat.ActiveConnection = mCnnStr
        Set mCol.ParentCatalog = cat
        
        '创建字段
        With mTable
       
            .Columns.Append "车牌", adVarWChar, 100
            .Columns.Append "姓名", adVarWChar, 100
            
            .Columns.Append "刷卡时间1", adVarWChar, 100
            .Columns.Append "刷卡时间2", adVarWChar, 100
            .Columns.Append "刷卡时间3", adVarWChar, 100
            .Columns.Append "刷卡时间4", adVarWChar, 100
            .Columns.Append "刷卡时间5", adVarWChar, 100
            .Columns.Append "刷卡时间6", adVarWChar, 100
       '.Columns.Append "早上迟到", adVarWChar, 100

        '    .Columns.Append "下午刷卡时间", adVarWChar, 100
       '     .Columns.Append "下午迟到", adVarWChar, 100
            
            '设置主键
'           Keys.Append "PrimaryKey", ADOX.KeyTypeEnum.adKeyPrimary, "日期", "", ""
        End With
        '生成表
        On Error GoTo SDS
        cat.Tables.Append mTable


      
        

       '打开数据库

SDS:
        Adocn.Open mCnnStr
         '读取数据库文件并显示出来
        Adors.ActiveConnection = Adocn
   
       Exit Sub

s1:
       mCol = MsgBox("系统初始化失败,请重启或联系厂商!", vbOKOnly + vbCritical, "警告")
        End
End Sub

Private Sub Info_Change(Index As Integer)
    DelKey.Enabled = False
End Sub

Private Sub Key_OpenCom_Click() '打开串口键按下
    
    
    If Flag_UartOpen = False Then '连接处理

    

        ''''''''''''''''''''''''''''''''''''其他程序''''''''''''''''''''''''''''''''''''''''''''''''''
        FlagEvent = 0
            
        
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
On Error GoTo ErrorCom
        Winsock1.Close
        Winsock1.Connect
  
        Exit Sub
ErrorCom:
    X = MsgBox("串口不存在或者被占用,请重新连接!", 48, "提示")
    
    Else '断开处理
        Key_OpenCom.Caption = "连接管理系统"
        Winsock1.Close

        '不启动两个超时定时器
        Timer1_RecAllTimeOut.Enabled = False
        Flag_UartOpen = False
        
   
        Frame1.Enabled = False

        Frame3.Enabled = False


        Exit Sub
        
    End If
    
End Sub



Private Sub Key_Sock_Click() 'TCP连接
    If FlagNetOPen = True Then '已经连接,则关闭
        Key_Sock.Caption = "连接"
        TCPA.Close
        FlagNetOPen = False
    Else

        TCPA.Close
        
        On Error GoTo SK
            'TCP初始化
            TCPA.Protocol = sckTCPAProtocol '采用TCPA协议
            '启动一个TCPA控件Listen用于专门监听端口80(不进行发送接收数据),80也要求从机的数据必须发送到服务器端口80这边
            TCPA.LocalPort = Trim(DK(1))
            TCPA.Listen
            FlagNetOPen = True
            Key_Sock.Caption = "断开"
            Exit Sub
        
SK:
            If Err.Number = 10048 Then '端口冲突
                MsgBox "端口冲突,退出!", vbOKOnly, "注意"
                End
            End If
        
    End If
End Sub

Private Sub TCPA_SendComplete()
    TCPA.Close
    FlagNetOPen = False
    Call Key_Sock_Click
End Sub

'TCP客户端连接请求
Private Sub TCPA_ConnectionRequest(ByVal requestID As Long)
    If TCPA.State <> sckClosed Then '强制关闭当前TCP,重新连接新的请求
        TCPA.Close
    End If
    TCPA.Accept requestID
    If Text1 = "" Then
        TCPA.SendData "暂时无车辆出入信息"
    Else
        TCPA.SendData "今日车辆出入信息如下------>"
        For i = 0 To 100
            TCPA.SendData strkaoqin(i)
        Next
    End If

End Sub
Private Sub Timer2_Timer()
    Timer2.Enabled = False
    TCPA.Protocol = sckTCPAProtocol '采用TCPA协议
      '启动一个TCPA控件Listen用于专门监听端口80(不进行发送接收数据),80也要求从机的数据必须发送到服务器端口80这边
      TCPA.LocalPort = Trim(DK(1))
      TCPA.Listen
'    TCPA.Listen
    
    
    

End Sub

Private Sub TCPA_Close()
        TCPA.Close
            TCPA.Protocol = sckTCPAProtocol '采用TCPA协议
      '启动一个TCPA控件Listen用于专门监听端口80(不进行发送接收数据),80也要求从机的数据必须发送到服务器端口80这边
      TCPA.LocalPort = Trim(DK(1))
        TCPA.Listen
End Sub

Private Sub Winsock1_Connect() '连接系统成功
 

    Key_OpenCom.Caption = "断开管理系统" '打开串口键的名改为断开串口
    Flag_UartOpen = True


    Frame1.Enabled = True

    Frame3.Enabled = True
    Timer1_RecAllTimeOut.Interval = 3000
End Sub

Private Sub UartSendErr()
    If FlagEvent = 1 Then
        X = MsgBox("获取参数失败!", 48, "提示")
    ElseIf FlagEvent = 2 Then
        X = MsgBox("保存失败!", 48, "提示")
    ElseIf FlagEvent = 3 Then
        X = MsgBox("删除失败!", 48, "提示")
    ElseIf FlagEvent = 4 Then
        X = MsgBox("增加失败!", 48, "提示")
    End If
    FlagEvent = 0

End Sub

'更新
           ' str1 = "update " & "注册表" & " set 早上签到= " & "'" & "是" & "' " & "where 车牌 = " & "'" & "1" & "' " '字符型数据要加单引号
            'Adocn.Execute str1
'测试数据
'fd 01 00 3A 00 00 01 02 3A 00 00 01 03 3A 00 00 01 04 3A 00 00 31 32 33 ff C1 D6 C9 D9 D6 BE ff 34 35 36 ff C0 EE B9 F0 C0 BC ff fe

Public Function Uart_Deal()
    Dim RecCount As Integer, Time1 As Long, Gime(4) As Long, SendName(25) As Byte
    Dim Adors As New ADODB.Recordset
    Dim SF As Boolean
    Dim str1 As String, str2 As String, str3 As String, KH As String
    
    Dim A1 As String, A2 As String, A3 As String, A4 As String, A5 As String, A6 As String, AA As String
    Adors.ActiveConnection = Adocn
    '停止2个超时定时器
    Timer1_RecAllTimeOut.Enabled = False

    Form1.Enabled = True
    '读取数据
    Winsock1.GetData GucRxDate
    '得到实际接收到个数
    RecCount = UBound(GucRxDate) + 1
    If FlagEvent = 0 Then '获取报警提示
        If RecCount < 3 Then
            Call UartSendErr
            Exit Function
        End If

        
        If GucRxDate(0) = Asc("G") And RecCount = 13 Then
            If GucRxDate(12) <> Asc("B") Then
                    FlagEvent = 0
                Exit Function
            End If
            KH = ""
            For i = 2 To 11
                KH = KH & Chr(GucRxDate(i))
            Next i
                Time1 = Hour(Now) * 60 + Minute(Now)
            '先查找指纹号所对应的信息
            str1 = "Select *From " & "注册表" & " where 卡号 = " & "'" & KH & "' "
            Adors.Open str1
            If Adors.EOF = True Then  '没获取成功
                Exit Function
            End If
            '获取车牌和姓名
            strnum = Adors.Fields("车牌")
            strname = Adors.Fields("姓名")
            Winsock1.SendData "zz" & strnum & Chr(13) & Chr(10)
            
            '查找是否有记录
            str1 = "Select *From " & Year(Now) & Month(Now) & Day(Now) & " where 车牌 = " & "'" & strnum & "' AND 姓名=" & "'" & strname & "' "
            Adors.Close
            Adors.Open str1
             
            If Adors.EOF = False Then  '有记录
            
                A1 = Adors.Fields("刷卡时间1")
                A2 = Adors.Fields("刷卡时间2")
                A3 = Adors.Fields("刷卡时间3")
                A4 = Adors.Fields("刷卡时间4")
                A5 = Adors.Fields("刷卡时间5")
                A6 = Adors.Fields("刷卡时间6")
              '  strc1 = Adors.Fields("早上迟到")
              '  strs2 = Adors.Fields("下午刷卡时间")
              '  strc2 = Adors.Fields("下午迟到")
            Else
                str1 = "Insert Into  " + Trim(Str(Year(Now))) + Trim(Str(Month(Now))) + Trim(Str(Day(Now))) + " (车牌,姓名,刷卡时间1,刷卡时间2,刷卡时间3,刷卡时间4,刷卡时间5,刷卡时间6)"
                str1 = str1 + "Values('" + strnum + "','" + strname + "','','','','','','')"
                Adocn.Execute str1
            End If
            
       
            If A1 = "" Then
                AA = "刷卡时间1"
            ElseIf A2 = "" Then
                AA = "刷卡时间2"
            ElseIf A3 = "" Then
                AA = "刷卡时间3"
            ElseIf A4 = "" Then
                AA = "刷卡时间4"
            ElseIf A5 = "" Then
                AA = "刷卡时间5"
            ElseIf A6 = "" Then
                AA = "刷卡时间6"
            Else
                AA = "刷卡时间6"
            End If
                
            '打卡时间
            strtime = Str(Hour(Now)) + ":" + Str(Minute(Now))
            '显示签到信息
            Text1 = Text1 & strtime & "  " & strname & vbCrLf
            strkaoqin(cntkaoqin) = strtime & "  " & strname & "     "
            cntkaoqin = cntkaoqin + 1
            If TCPA.State = sckConnected Then
                TCPA.SendData strtime & " " & strname & "签到" & vbCrLf
            End If
            For i = 0 To 24
                SendName(i) = 0
            Next i
            SendName(0) = &H5A
            
            For i = 0 To Len(strnum) - 1
             '  SendName(1 + i) = Asc(Mid(Strnum, i + 1, 1))
            Next i
            
            For i = 0 To Len(strname) - 1
'                SendName(i + 14) = Asc(Mid(strname, i + 1, 1))
            Next i
            
            Winsock1.SendData SendName
                    

            
            str1 = "update " & Year(Now) & Month(Now) & Day(Now) & " set " & AA & "= " & "'" & strtime & "' " & "where 车牌 = " & "'" & strnum & "' and " & "姓名= " & "'" & strname & "'"        '字符型数据要加单引号
            Adocn.Execute str1
            
       
        End If
   ElseIf FlagEvent = 3 Then '删除成功
   
        If RecCount <> 2 Then
            Call UartSendErr
            Exit Function
        End If

        
        If GucRxDate(0) = Asc("O") And GucRxDate(1) = Asc("K") Then
             DelKey.Enabled = False
            Adors.ActiveConnection = Adocn
            str1 = "delete *From " & "注册表" & " where 车牌 = " & "'" & Info(0) & "' AND 姓名=" & "'" & Info(1) & "' "
            Adors.Open str1
            Info(0) = ""
            Info(1) = ""
            Info(2) = ""
            If TCPA.State = sckConnected Then
                TCPA.SendData "成功删除卡片->车牌:" & Info(0) & ",姓名:" & Info(1) & vbCrLf
            End If
            X = MsgBox("删除成功!", 48, "提示")
        Else
            Call UartSendErr
        End If
   
   ElseIf FlagEvent = 4 Then
        If RecCount < 3 Then
            Call UartSendErr
            Exit Function
        End If
        If GucRxDate(0) = Asc("K") And RecCount = 13 Then
        
            If GucRxDate(12) <> Asc("B") Then
                    FlagEvent = 0
                Exit Function
            End If
            KH = ""
            For i = 2 To 11
                KH = KH & Chr(GucRxDate(i))
            Next i
            
            str1 = "Insert Into " + "注册表" + "(车牌,姓名,卡号) "
            str1 = str1 + "Values('" + AddNum + "','" + AddName + "','" + KH + "')"
            Adocn.Execute str1
                    
          '  str1 = "Select *From " & "注册表" & " where 车牌 = " & "'" & Info(0) & "' AND 姓名=" & "'" & Info(1) & "' "
            
            X = MsgBox("增加成功!", 48, "提示")
            If TCPA.State = sckConnected Then
                TCPA.SendData "成功增加卡片->车牌:" & AddNum & ",姓名:" & AddName & vbCrLf
            End If
        Else
            Call UartSendErr
        End If
        
    End If
    FlagEvent = 0

     ''''''''''''''''''''''''''''''''''''数据解析'''''''''''''''''''''''''''''''''''''
        '根据数据及数据个数得到数据是否对与错,然后Flag_NewDate的值告诉你是不是查询命令(是为False)
        '然后再定出错是否要提示对话框(通常,查询命令出错不提示对话框,最好是数据显示?,其他命令提示发送失败与否)】
     

     
     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


End Function


Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
    Call Uart_Deal
End Sub

Private Sub Timer1_RecAllTimeOut_Timer() '接收总处理
      Call Uart_Deal
End Sub


Private Sub UartSend() '发送
On Error GoTo gk
    '重新定义动态数组
    ReDim GucTxDate(0 To GucSendCount - 1) As Byte
    '数据复制
    For i = 0 To GucSendCount - 1
        GucTxDate(i) = GucUartDate(i)
    Next i
    '发送前先读取缓冲区并清零
   ' GucRxDate = MSComm1.Input '清空ruan冲区,并清零接收个数
    '启动串口发送
    Winsock1.SendData GucTxDate

    '启动总的超时定时器
    Timer1_RecAllTimeOut.Enabled = True
    Exit Sub
gk:
    Call Key_OpenCom_Click
End Sub





Private Sub AddKey_Click() '增加按键

    GucUartDate(0) = &H58
    GucUartDate(1) = &H4

    GucSendCount = 2
    Timer1_RecAllTimeOut.Interval = 60000 '接收超时
    Form1.Enabled = False
    FlagEvent = 4
    Call UartSend
    
    
End Sub





Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
       Key_OpenCom.Caption = "连接管理系统"
        Winsock1.Close

        '不启动两个超时定时器
        Timer1_RecAllTimeOut.Enabled = False
        Flag_UartOpen = False
        
   
        Frame1.Enabled = False
'        Frame2.Enabled = False
        Frame3.Enabled = False
      
End Sub
