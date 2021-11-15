VERSION 5.00
Begin VB.Form frmBanco 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Operaci�n bancaria"
   ClientHeight    =   3390
   ClientLeft      =   45
   ClientTop       =   255
   ClientWidth     =   4635
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3390
   ScaleWidth      =   4635
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox lstBanco 
      Height          =   840
      ItemData        =   "frmBanco.frx":0000
      Left            =   120
      List            =   "frmBanco.frx":0010
      TabIndex        =   3
      Top             =   1260
      Width           =   4395
   End
   Begin VB.TextBox txtDatos 
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   0
      EndProperty
      Height          =   315
      Left            =   150
      TabIndex        =   2
      Top             =   2490
      Width           =   4335
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Aceptar"
      Height          =   345
      Left            =   3030
      TabIndex        =   1
      Top             =   2910
      Width           =   1455
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Cerrar"
      Height          =   345
      Left            =   150
      TabIndex        =   0
      Top             =   2910
      Width           =   1455
   End
   Begin VB.Label lblInfo 
      BackStyle       =   0  'Transparent
      Caption         =   $"frmBanco.frx":0072
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1035
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   4395
   End
   Begin VB.Label lblDatos 
      Caption         =   "�Cu�nto deseas depositar?"
      Height          =   255
      Left            =   150
      TabIndex        =   4
      Top             =   2160
      Width           =   4335
   End
End
Attribute VB_Name = "frmBanco"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdClose_Click()
Call WriteBankEnd
    Unload Me
End Sub

Private Sub cmdOk_Click()
Select Case lstBanco.ListIndex

    Case 0 'depositar oro
    
        'Si es negativo o cero jodete por pobre xD
        If Val(txtDatos.text) <= 0 Then
            lblDatos.Caption = "Cantidad inv�lida."
            Exit Sub
        End If
        
        If Val(txtDatos.text) > UserGLD Then
            lblDatos.Caption = "No tienes esa cantidad. Escr�bela nuevamente."
            Exit Sub
        Else
            Call ParseUserCommand("/DEPOSITAR " & Val(txtDatos.text))
            lblInfo.Caption = "Bienvenido a la cadena de finanzas Goliath. Tienes " & UserGLD & " monedas de oro en tu billetera y en tu cuenta tienes " & OB & " Monedas de oro. y " & UserBOVItem & "item en tu Boveda �C�mo te puedo ayudar?"
         End If
        Call WriteBankEnd
    Case 1 'Retirar
    
        'Si es negativo o cero jodete por pobre xD
        If Val(txtDatos.text) <= 0 Then
            lblDatos.Caption = "Cantidad inv�lida."
            Exit Sub
        End If
        
        Call ParseUserCommand("/RETIRAR " & Val(txtDatos.text))
         Call Audio.PlayWave(SND_RETIRAR)
            lblInfo.Caption = "Bienvenido a la cadena de finanzas Goliath. Tienes " & OB & " monedas de oro en tu billetera y en tu cuenta tienes " & UserGLD & " Monedas de oro. y " & UserBOVItem & "item en tu Boveda �C�mo te puedo ayudar?"
Call WriteBankEnd
frmBancoObj.List1(0).Clear
frmBancoObj.List1(1).Clear
Case 2 'ver la Boveda
'Call ParseUserCommand("/Boveda")


'Unload Me

    Case 3 'trasferir oro
    On Local Error GoTo Error
        Dim Usuario As String
        Dim cantidad As String
        
        lblDatos.Caption = "Precione Aceptar."
        
            Usuario = InputBox("Usuario al que desea Transferir:", "")
            cantidad = InputBox("Cantidad que desea transferir:", "")
                
            If MsgBox("Estas seguro que deseas transferirle " & cantidad & " al usuario " & Usuario, vbYesNo) = vbYes Then
                Call ParseUserCommand("/DARORO " & Usuario & "@" & cantidad)
            Else
                Exit Sub
            End If
Error:
Exit Sub
        
End Select

End Sub

Private Sub Command1_Click()
'frmBancoObj.Show , frmMain
End Sub
Private Sub Form_Load()
    lblInfo.Caption = "Bienvenido a la cadena de finanzas Goliath. Tienes " & UserGLD & " monedas de oro en tu billetera y en tu cuenta tienes " & OB & " Monedas de oro. y " & UserBOVItem & " items en tu Boveda. �C�mo te puedo ayudar?"
Call Make_Transparent_Form(Me.hWnd, 210)
End Sub


Private Sub lstBanco_Click()

Select Case lstBanco.ListIndex
    Case 0 'Depositar oro
        lblDatos.Caption = "�Cu�nto deseas depositar?"
        txtDatos.Visible = True
    Case 1 'Retirar oro
        lblDatos.Caption = "�Cu�nto deseas retirar?"
        txtDatos.Visible = True
    Case 2 'ver la Boveda
    lblDatos.Caption = ""
        frmBancoObj.Show , frmMain
        'txtDatos.Visible = False
        Unload Me
    Case 3 'Transferir oro
        lblDatos.Caption = "Preciona Aceptar."
        txtDatos.Visible = False
End Select

End Sub


