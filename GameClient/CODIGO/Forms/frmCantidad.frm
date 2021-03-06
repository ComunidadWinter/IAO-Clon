VERSION 5.00
Begin VB.Form frmCantidad 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   1335
   ClientLeft      =   1635
   ClientTop       =   4410
   ClientWidth     =   2220
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   89
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   148
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox Text1 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   210
      Left            =   300
      TabIndex        =   0
      Top             =   540
      Width           =   1470
   End
   Begin VB.Image imgMenos 
      Height          =   135
      Left            =   1800
      Top             =   630
      Width           =   195
   End
   Begin VB.Image imgMas 
      Height          =   135
      Left            =   1800
      Top             =   510
      Width           =   195
   End
   Begin VB.Image imgCerrar 
      Height          =   330
      Left            =   1890
      Tag             =   "0"
      Top             =   0
      Width           =   315
   End
   Begin VB.Image Command2 
      Height          =   405
      Left            =   1125
      Tag             =   "0"
      Top             =   840
      Width           =   945
   End
   Begin VB.Image Command1 
      Height          =   405
      Left            =   150
      Tag             =   "0"
      Top             =   840
      Width           =   975
   End
End
Attribute VB_Name = "frmCantidad"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command2_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Command2.Picture = LoadPicture(App.path & "\Recursos\Interface\dejartododown.jpg")
End Sub

Private Sub Command2_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)

If Command2.Tag = "0" Then
    Command2.Picture = LoadPicture(App.path & "\Recursos\Interface\dejartodoover.jpg")
    Command2.Tag = "1"
End If

If Command2.Tag = "1" Then
    Command2.Picture = Nothing
    Command2.Tag = "0"
End If

End Sub

Private Sub Command1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
command1.Picture = LoadPicture(App.path & "\Recursos\Interface\dejardown.jpg")
End Sub

Private Sub Command1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)

If command1.Tag = "0" Then
    command1.Picture = LoadPicture(App.path & "\Recursos\Interface\dejarover.jpg")
    command1.Tag = "1"
End If

If command1.Tag = "1" Then
    command1.Picture = Nothing
    command1.Tag = "0"
End If

End Sub

Private Sub Command1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If LenB(frmCantidad.text1.Text) > 0 Then
        If Not IsNumeric(frmCantidad.text1.Text) Then Exit Sub  'Should never happen
        Call WriteDrop(Inventario.SelectedItem, frmCantidad.text1.Text)
        frmCantidad.text1.Text = ""
    End If
    
    Unload Me
End Sub

Private Sub Command2_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Inventario.SelectedItem = 0 Then Exit Sub
    
    If Inventario.SelectedItem <> FLAGORO Then
        Call WriteDrop(Inventario.SelectedItem, Inventario.amount(Inventario.SelectedItem))
        Unload Me
    Else
        If UserGLD > 10000 Then
            Call WriteDrop(Inventario.SelectedItem, 10000)
            Unload Me
        Else
            Call WriteDrop(Inventario.SelectedItem, UserGLD)
            Unload Me
        End If
    End If

    frmCantidad.text1.Text = ""
End Sub

Private Sub Text1_Change()
On Error GoTo ErrHandler
     If Val(text1.Text) < 1 Then
        text1.Text = "1"
    End If
    
    If Val(text1.Text) > 10000 Then
        text1.Text = "10000"
    End If
    
    Exit Sub
    
ErrHandler:
    'If we got here the user may have pasted (Shift + Insert) a REALLY large number, causing an overflow, so we set amount back to 1
    text1.Text = "1"
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
    If (KeyAscii <> 8) Then
        If (KeyAscii < 48 Or KeyAscii > 57) Then
            KeyAscii = 0
        End If
    End If
End Sub

Private Sub imgCerrar_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)

If command1.Tag = "1" Then
    command1.Picture = Nothing
    command1.Tag = "0"
End If

If Command2.Tag = "1" Then
    Command2.Picture = Nothing
    Command2.Tag = "0"
End If

If imgCerrar.Tag = "0" Then
    imgCerrar.Picture = LoadPicture(App.path & "\Recursos\Interface\cerrarcantover.jpg")
    imgCerrar.Tag = "1"
End If

End Sub

Private Sub imgCerrar_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
imgCerrar.Picture = LoadPicture(App.path & "\Recursos\Interface\cerrarcantdown.jpg")
End Sub

Private Sub imgCerrar_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
Unload Me
End Sub

Private Sub imgMas_Click()
text1.Text = Val(text1.Text) + 1
End Sub

Private Sub imgMas_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Call Form_MouseMove(Button, Shift, x, y)
End Sub

Private Sub imgMenos_Click()

If Val(text1.Text) > 0 Then _
    text1.Text = Val(text1.Text) - 1

End Sub

Private Sub imgMenos_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Call Form_MouseMove(Button, Shift, x, y)
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)

If command1.Tag = "1" Then
    command1.Picture = Nothing
    command1.Tag = "0"
End If

If Command2.Tag = "1" Then
    Command2.Picture = Nothing
    Command2.Tag = "0"
End If

If imgCerrar.Tag = "1" Then
    imgCerrar.Picture = Nothing
    imgCerrar.Tag = "0"
End If

End Sub

Private Sub Form_Load()
    Me.Picture = LoadPicture(App.path & "\Recursos\Interface\cantidad.jpg")
    Call Make_Transparent_Form(Me.hWnd, 210)
End Sub
