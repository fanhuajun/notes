VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   Caption         =   "��������ϵͳ"
   ClientHeight    =   4365
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6330
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4365
   ScaleWidth      =   6330
   StartUpPosition =   2  '��Ļ����
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
      Caption         =   "���ӹ���ϵͳ"
      Height          =   375
      Left            =   0
      TabIndex        =   20
      Top             =   240
      Width           =   3615
   End
   Begin VB.CommandButton Key_Sock 
      Caption         =   "����"
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
      Caption         =   "���ӿ�Ƭ"
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
         Caption         =   "����"
         Height          =   375
         Left            =   2640
         TabIndex        =   9
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "����"
         Height          =   180
         Index           =   10
         Left            =   480
         TabIndex        =   8
         Top             =   360
         Width           =   360
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "����"
         Height          =   180
         Index           =   9
         Left            =   1920
         TabIndex        =   7
         Top             =   360
         Width           =   360
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "��Ϣ��"
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
         Caption         =   "����"
         Height          =   375
         Left            =   600
         TabIndex        =   12
         Top             =   1080
         Width           =   975
      End
      Begin VB.CommandButton DelKey 
         Caption         =   "ɾ��"
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
         Caption         =   "��Ƭ"
         Height          =   180
         Index           =   6
         Left            =   480
         TabIndex        =   15
         Top             =   360
         Width           =   360
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "����"
         Height          =   180
         Index           =   5
         Left            =   2640
         TabIndex        =   2
         Top             =   360
         Width           =   360
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "����"
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
      Caption         =   "��ҳ�˿�"
      BeginProperty Font 
         Name            =   "����"
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
      Caption         =   "�������¼"
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
Dim GucRxDate() As Byte, GucTxDate() As Byte  '�����ö�̬����
Dim GucUartDate(30) As Byte
Dim GucSendCount As Integer, Flag_NewDate As Boolean, Flag_UartOpen As Boolean

Dim Flag_SendOther As Boolean
Dim FlagEvent As Integer, FlagNetOPen As Boolean
Public ADO_Path As String, ADO_Path1 As String
Dim Adocn As ADODB.Connection
Dim strkaoqin(100) As String, cntkaoqin As Integer


Private Sub Command1_Click() '����
    Dim Adors As New ADODB.Recordset
    Dim SF As Boolean
    Adors.ActiveConnection = Adocn
    
    Info(0) = Trim(Info(0))
    Info(1) = Trim(Info(1))

    str1 = "Select *From " & "ע���" & " where ���� = " & "'" & Info(2) & "' "
    Adors.Open str1
     
    If Adors.EOF = True Then  'û��ȡ�ɹ�
        mCol = MsgBox("û�ҵ�,�����¼��!", vbOKOnly, "����")
        Info(0) = ""
        Info(1) = ""
        Info(2) = ""
        DelKey.Enabled = False
    Else
        Info(0) = Adors.Fields("����")
        Info(1) = Adors.Fields("����")
        Info(2) = Adors.Fields("����")
        DelKey.Enabled = True
    End If
End Sub




    




'
'Private Sub Command2_Click()
'  Dim i As Long
'    Dim j As Long
'    Dim objExl As Excel.Application   '�����������
'    Me.MousePointer = 11            '�ı������ʽ
'    Set objExl = New Excel.Application    '��ʼ���������
'    objExl.SheetsInNewWorkbook = 1  '���½��Ĺ�����������Ϊ1
'    objExl.Workbooks.Add          '����һ��������
'    objExl.Sheets(objExl.Sheets.Count).Name = "book1"  '�޸Ĺ���������
'    objExl.Sheets.Add , objExl.Sheets("book1") '���ӵڶ����������ڵ�һ��֮��
'    objExl.Sheets(objExl.Sheets.Count).Name = "book2"
'    objExl.Sheets.Add , objExl.Sheets("book2") '���ӵ������������ڵڶ���֮��
'    objExl.Sheets(objExl.Sheets.Count).Name = "book3"
'    objExl.Sheets("book1").Select     'ѡ�й�����<book1>
'    For i = 1 To 50                   'ѭ��д������
'        For j = 1 To 5
'            If i = 1 Then
'                objExl.Selection.NumberFormatLocal = "@"  '���ø�ʽΪ�ı�
'                objExl.Cells(i, j) = " E " & i & j
'            Else
'                objExl.Cells(i, j) = i & j
'            End If
'        Next
'    Next
'End Sub

Private Sub DelKey_Click() 'ɾ����

    GucUartDate(0) = &H59
  '  GucUartDate(1) = Hex(Info(2))
'    GucUartDate(2) = Hex(Info(2))
    For i = 0 To 9
        GucUartDate(i + 1) = Mid(Info(2), i + 1, 1)
    Next i
    GucUartDate(i + 1) = 13
    GucSendCount = i + 2
    Timer1_RecAllTimeOut.Interval = 3000 '���ճ�ʱ
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
    Strold3 = "2F" '��ʼ������
    cntkaoqin = 0
            
    mDataBaseName = App.Path & "\�����ļ�.mdb"
    mCnnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & mDataBaseName & ";Jet OLEDB:DataBase Password=admin"
    

  '  On Error GoTo s1:
        If Dir(mDataBaseName) = "" Then '�Ȳ����ļ�,����ļ�������,���½����ݿ�,������,���½����ݿ�ᱨ��
            Call cat.Create(mCnnStr) '�����´���������ݿ�
            '������ݿ��Ѿ���,��catΪ��,���Ա������ϵͳ׼��ʹ���ĸ����ݿ�,��ʵcreat���Զ��޸�activeconnectionΪ����
            cat.ActiveConnection = mCnnStr

            '�½�һ����,���в����пո�,'-','&'(���ǿ���,��SQL���ͻᱨ��)
            mTable.Name = "ע���" '������,����Ϊע���
       
            Set mCol.ParentCatalog = cat
            '�����ֶ�
            With mTable
                
                .Columns.Append "����", adVarWChar, 100
                .Columns.Append "����", adVarWChar, 100
                .Columns.Append "����", adVarWChar, 100
                
                '��������
                'Keys.Append "PrimaryKey", ADOX.KeyTypeEnum.adKeyPrimary, "����", "", ""
            End With
            
            '���ɱ�
            cat.Tables.Append mTable
            
            
            Set mCol = Nothing
            Set mTable = Nothing
            Set cat = Nothing
         

            
       '     cat.Tables.Append mTable

        End If
 
        

 
        Set mCol = Nothing
        Set mTable = Nothing
        Set cat = Nothing

        '���½�����һ����
        mTable.Name = Year(Now) & Month(Now) & Day(Now) '������,����Ϊע���

        cat.ActiveConnection = mCnnStr
        Set mCol.ParentCatalog = cat
        
        '�����ֶ�
        With mTable
       
            .Columns.Append "����", adVarWChar, 100
            .Columns.Append "����", adVarWChar, 100
            
            .Columns.Append "ˢ��ʱ��1", adVarWChar, 100
            .Columns.Append "ˢ��ʱ��2", adVarWChar, 100
            .Columns.Append "ˢ��ʱ��3", adVarWChar, 100
            .Columns.Append "ˢ��ʱ��4", adVarWChar, 100
            .Columns.Append "ˢ��ʱ��5", adVarWChar, 100
            .Columns.Append "ˢ��ʱ��6", adVarWChar, 100
       '.Columns.Append "���ϳٵ�", adVarWChar, 100

        '    .Columns.Append "����ˢ��ʱ��", adVarWChar, 100
       '     .Columns.Append "����ٵ�", adVarWChar, 100
            
            '��������
'           Keys.Append "PrimaryKey", ADOX.KeyTypeEnum.adKeyPrimary, "����", "", ""
        End With
        '���ɱ�
        On Error GoTo SDS
        cat.Tables.Append mTable


      
        

       '�����ݿ�

SDS:
        Adocn.Open mCnnStr
         '��ȡ���ݿ��ļ�����ʾ����
        Adors.ActiveConnection = Adocn
   
       Exit Sub

s1:
       mCol = MsgBox("ϵͳ��ʼ��ʧ��,����������ϵ����!", vbOKOnly + vbCritical, "����")
        End
End Sub

Private Sub Info_Change(Index As Integer)
    DelKey.Enabled = False
End Sub

Private Sub Key_OpenCom_Click() '�򿪴��ڼ�����
    
    
    If Flag_UartOpen = False Then '���Ӵ���

    

        ''''''''''''''''''''''''''''''''''''��������''''''''''''''''''''''''''''''''''''''''''''''''''
        FlagEvent = 0
            
        
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
On Error GoTo ErrorCom
        Winsock1.Close
        Winsock1.Connect
  
        Exit Sub
ErrorCom:
    X = MsgBox("���ڲ����ڻ��߱�ռ��,����������!", 48, "��ʾ")
    
    Else '�Ͽ�����
        Key_OpenCom.Caption = "���ӹ���ϵͳ"
        Winsock1.Close

        '������������ʱ��ʱ��
        Timer1_RecAllTimeOut.Enabled = False
        Flag_UartOpen = False
        
   
        Frame1.Enabled = False

        Frame3.Enabled = False


        Exit Sub
        
    End If
    
End Sub



Private Sub Key_Sock_Click() 'TCP����
    If FlagNetOPen = True Then '�Ѿ�����,��ر�
        Key_Sock.Caption = "����"
        TCPA.Close
        FlagNetOPen = False
    Else

        TCPA.Close
        
        On Error GoTo SK
            'TCP��ʼ��
            TCPA.Protocol = sckTCPAProtocol '����TCPAЭ��
            '����һ��TCPA�ؼ�Listen����ר�ż����˿�80(�����з��ͽ�������),80ҲҪ��ӻ������ݱ��뷢�͵��������˿�80���
            TCPA.LocalPort = Trim(DK(1))
            TCPA.Listen
            FlagNetOPen = True
            Key_Sock.Caption = "�Ͽ�"
            Exit Sub
        
SK:
            If Err.Number = 10048 Then '�˿ڳ�ͻ
                MsgBox "�˿ڳ�ͻ,�˳�!", vbOKOnly, "ע��"
                End
            End If
        
    End If
End Sub

Private Sub TCPA_SendComplete()
    TCPA.Close
    FlagNetOPen = False
    Call Key_Sock_Click
End Sub

'TCP�ͻ�����������
Private Sub TCPA_ConnectionRequest(ByVal requestID As Long)
    Dim strTxt As String

    If TCPA.State <> sckClosed Then 'ǿ�ƹرյ�ǰTCP,���������µ�����
        TCPA.Close
    End If
    TCPA.Accept requestID
    If Text1 = "" Then
        TCPA.SendData "��ʱ�޳���������Ϣ"
    Else
        TCPA.SendData "���ճ���������Ϣ����------>"
        strTxt = "["
        For i = 0 To cntkaoqin -1
            TCPA.SendData strkaoqin(i)
            strTxt=strTxt & strkaoqin(i) & "," & vbCrLf
        Next

        strTxt = strTxt+"]"
        Open "C://test.txt" For Output As #8
        Print #8, strTxt
        Close #8
    End If

End Sub



Private Sub Timer2_Timer()
    Timer2.Enabled = False
    TCPA.Protocol = sckTCPAProtocol '����TCPAЭ��
      '����һ��TCPA�ؼ�Listen����ר�ż����˿�80(�����з��ͽ�������),80ҲҪ��ӻ������ݱ��뷢�͵��������˿�80���
      TCPA.LocalPort = Trim(DK(1))
      TCPA.Listen
'    TCPA.Listen
    
    
    

End Sub

Private Sub TCPA_Close()
        TCPA.Close
            TCPA.Protocol = sckTCPAProtocol '����TCPAЭ��
      '����һ��TCPA�ؼ�Listen����ר�ż����˿�80(�����з��ͽ�������),80ҲҪ��ӻ������ݱ��뷢�͵��������˿�80���
      TCPA.LocalPort = Trim(DK(1))
        TCPA.Listen
End Sub

Private Sub Winsock1_Connect() '����ϵͳ�ɹ�
 

    Key_OpenCom.Caption = "�Ͽ�����ϵͳ" '�򿪴��ڼ�������Ϊ�Ͽ�����
    Flag_UartOpen = True


    Frame1.Enabled = True

    Frame3.Enabled = True
    Timer1_RecAllTimeOut.Interval = 3000
End Sub

Private Sub UartSendErr()
    If FlagEvent = 1 Then
        X = MsgBox("��ȡ����ʧ��!", 48, "��ʾ")
    ElseIf FlagEvent = 2 Then
        X = MsgBox("����ʧ��!", 48, "��ʾ")
    ElseIf FlagEvent = 3 Then
        X = MsgBox("ɾ��ʧ��!", 48, "��ʾ")
    ElseIf FlagEvent = 4 Then
        X = MsgBox("����ʧ��!", 48, "��ʾ")
    End If
    FlagEvent = 0

End Sub

'����
           ' str1 = "update " & "ע���" & " set ����ǩ��= " & "'" & "��" & "' " & "where ���� = " & "'" & "1" & "' " '�ַ�������Ҫ�ӵ�����
            'Adocn.Execute str1
'��������
'fd 01 00 3A 00 00 01 02 3A 00 00 01 03 3A 00 00 01 04 3A 00 00 31 32 33 ff C1 D6 C9 D9 D6 BE ff 34 35 36 ff C0 EE B9 F0 C0 BC ff fe

Public Function Uart_Deal()
    Dim RecCount As Integer, Time1 As Long, Gime(4) As Long, SendName(25) As Byte
    Dim Adors As New ADODB.Recordset
    Dim SF As Boolean
    Dim str1 As String, str2 As String, str3 As String, KH As String
    
    Dim A1 As String, A2 As String, A3 As String, A4 As String, A5 As String, A6 As String, AA As String
    Adors.ActiveConnection = Adocn
    'ֹͣ2����ʱ��ʱ��
    Timer1_RecAllTimeOut.Enabled = False

    Form1.Enabled = True
    '��ȡ����
    Winsock1.GetData GucRxDate
    '�õ�ʵ�ʽ��յ�����
    RecCount = UBound(GucRxDate) + 1
    If FlagEvent = 0 Then '��ȡ������ʾ
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
            '�Ȳ���ָ�ƺ�����Ӧ����Ϣ
            str1 = "Select *From " & "ע���" & " where ���� = " & "'" & KH & "' "
            Adors.Open str1
            If Adors.EOF = True Then  'û��ȡ�ɹ�
                Exit Function
            End If
            '��ȡ���ƺ�����
            strnum = Adors.Fields("����")
            strname = Adors.Fields("����")
            Winsock1.SendData "zz" & strnum & Chr(13) & Chr(10)
            
            '�����Ƿ��м�¼
            str1 = "Select *From " & Year(Now) & Month(Now) & Day(Now) & " where ���� = " & "'" & strnum & "' AND ����=" & "'" & strname & "' "
            Adors.Close
            Adors.Open str1
             
            If Adors.EOF = False Then  '�м�¼
            
                A1 = Adors.Fields("ˢ��ʱ��1")
                A2 = Adors.Fields("ˢ��ʱ��2")
                A3 = Adors.Fields("ˢ��ʱ��3")
                A4 = Adors.Fields("ˢ��ʱ��4")
                A5 = Adors.Fields("ˢ��ʱ��5")
                A6 = Adors.Fields("ˢ��ʱ��6")
              '  strc1 = Adors.Fields("���ϳٵ�")
              '  strs2 = Adors.Fields("����ˢ��ʱ��")
              '  strc2 = Adors.Fields("����ٵ�")
            Else
                str1 = "Insert Into  " + Trim(Str(Year(Now))) + Trim(Str(Month(Now))) + Trim(Str(Day(Now))) + " (����,����,ˢ��ʱ��1,ˢ��ʱ��2,ˢ��ʱ��3,ˢ��ʱ��4,ˢ��ʱ��5,ˢ��ʱ��6)"
                str1 = str1 + "Values('" + strnum + "','" + strname + "','','','','','','')"
                Adocn.Execute str1
            End If
            
       
            If A1 = "" Then
                AA = "ˢ��ʱ��1"
            ElseIf A2 = "" Then
                AA = "ˢ��ʱ��2"
            ElseIf A3 = "" Then
                AA = "ˢ��ʱ��3"
            ElseIf A4 = "" Then
                AA = "ˢ��ʱ��4"
            ElseIf A5 = "" Then
                AA = "ˢ��ʱ��5"
            ElseIf A6 = "" Then
                AA = "ˢ��ʱ��6"
            Else
                AA = "ˢ��ʱ��6"
            End If
                
            '��ʱ��
            strtime = Str(Hour(Now)) + ":" + Str(Minute(Now))
            '��ʾǩ����Ϣ
            Text1 = Text1 & strtime & "  " & strname & vbCrLf
            strkaoqin(cntkaoqin) = "{" & "\'time\'" & ":" & "\'" & strtime & "\'" & "," & "\'name\'" & ":" & "\'" & strname & "\'" & "}" 
            cntkaoqin = cntkaoqin + 1
            If TCPA.State = sckConnected Then
                TCPA.SendData strtime & " " & strname & "ǩ��" & vbCrLf
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
                    

            
            str1 = "update " & Year(Now) & Month(Now) & Day(Now) & " set " & AA & "= " & "'" & strtime & "' " & "where ���� = " & "'" & strnum & "' and " & "����= " & "'" & strname & "'"        '�ַ�������Ҫ�ӵ�����
            Adocn.Execute str1
            
       
        End If
   ElseIf FlagEvent = 3 Then 'ɾ���ɹ�
   
        If RecCount <> 2 Then
            Call UartSendErr
            Exit Function
        End If

        
        If GucRxDate(0) = Asc("O") And GucRxDate(1) = Asc("K") Then
             DelKey.Enabled = False
            Adors.ActiveConnection = Adocn
            str1 = "delete *From " & "ע���" & " where ���� = " & "'" & Info(0) & "' AND ����=" & "'" & Info(1) & "' "
            Adors.Open str1
            Info(0) = ""
            Info(1) = ""
            Info(2) = ""
            If TCPA.State = sckConnected Then
                TCPA.SendData "�ɹ�ɾ����Ƭ->����:" & Info(0) & ",����:" & Info(1) & vbCrLf
            End If
            X = MsgBox("ɾ���ɹ�!", 48, "��ʾ")
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
            
            str1 = "Insert Into " + "ע���" + "(����,����,����) "
            str1 = str1 + "Values('" + AddNum + "','" + AddName + "','" + KH + "')"
            Adocn.Execute str1
                    
          '  str1 = "Select *From " & "ע���" & " where ���� = " & "'" & Info(0) & "' AND ����=" & "'" & Info(1) & "' "
            
            X = MsgBox("���ӳɹ�!", 48, "��ʾ")
            If TCPA.State = sckConnected Then
                TCPA.SendData "�ɹ����ӿ�Ƭ->����:" & AddNum & ",����:" & AddName & vbCrLf
            End If
        Else
            Call UartSendErr
        End If
        
    End If
    FlagEvent = 0

     ''''''''''''''''''''''''''''''''''''���ݽ���'''''''''''''''''''''''''''''''''''''
        '�������ݼ����ݸ����õ������Ƿ�����,Ȼ��Flag_NewDate��ֵ�������ǲ��ǲ�ѯ����(��ΪFalse)
        'Ȼ���ٶ������Ƿ�Ҫ��ʾ�Ի���(ͨ��,��ѯ���������ʾ�Ի���,�����������ʾ?,����������ʾ����ʧ�����)��
     

     
     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


End Function


Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
    Call Uart_Deal
End Sub

Private Sub Timer1_RecAllTimeOut_Timer() '�����ܴ���
      Call Uart_Deal
End Sub


Private Sub UartSend() '����
On Error GoTo gk
    '���¶��嶯̬����
    ReDim GucTxDate(0 To GucSendCount - 1) As Byte
    '���ݸ���
    For i = 0 To GucSendCount - 1
        GucTxDate(i) = GucUartDate(i)
    Next i
    '����ǰ�ȶ�ȡ������������
   ' GucRxDate = MSComm1.Input '���ruan����,��������ո���
    '�������ڷ���
    Winsock1.SendData GucTxDate

    '�����ܵĳ�ʱ��ʱ��
    Timer1_RecAllTimeOut.Enabled = True
    Exit Sub
gk:
    Call Key_OpenCom_Click
End Sub





Private Sub AddKey_Click() '���Ӱ���

    GucUartDate(0) = &H58
    GucUartDate(1) = &H4

    GucSendCount = 2
    Timer1_RecAllTimeOut.Interval = 60000 '���ճ�ʱ
    Form1.Enabled = False
    FlagEvent = 4
    Call UartSend
    
    
End Sub





Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
       Key_OpenCom.Caption = "���ӹ���ϵͳ"
        Winsock1.Close

        '������������ʱ��ʱ��
        Timer1_RecAllTimeOut.Enabled = False
        Flag_UartOpen = False
        
   
        Frame1.Enabled = False
'        Frame2.Enabled = False
        Frame3.Enabled = False
      
End Sub
