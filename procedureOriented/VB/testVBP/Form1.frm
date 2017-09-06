VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  '´°¿ÚÈ±Ê¡
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   600
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   240
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   375
      Left            =   2280
      TabIndex        =   0
      Top             =   600
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim strkaoqin(100) As String

Private Sub Command1_Click()
    Dim strTxt As String
    Dim longTxt As String

    strkaoqin(0) = "{" + "'no'"+":" & cntkaoqin + "}"
    
    strkaoqin(0) = "nihao  "
    strkaoqin(1) = "nihao2  "
    strTxt = strTxt & strkaoqin(0)
    strTxt = strTxt & strkaoqin(2)


    Open "C://test.txt" For Output As #8
    Print #8, strTxt
    Close #8
End Sub
