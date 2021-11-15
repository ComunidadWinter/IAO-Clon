VERSION 5.00
Begin VB.Form frmGuildDetails 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Detalles del Clan"
   ClientHeight    =   6825
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6840
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6825
   ScaleWidth      =   6840
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      Caption         =   "Aceptar"
      Height          =   375
      Index           =   1
      Left            =   5160
      MouseIcon       =   "frmGuildDetails.frx":0000
      MousePointer    =   99  'Custom
      TabIndex        =   13
      Top             =   6360
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Cancel          =   -1  'True
      Caption         =   "Cancelar"
      Height          =   375
      Index           =   0
      Left            =   120
      MouseIcon       =   "frmGuildDetails.frx":0152
      MousePointer    =   99  'Custom
      TabIndex        =   12
      Top             =   6360
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      Caption         =   "Codex"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   120
      TabIndex        =   2
      Top             =   2040
      Width           =   6495
      Begin VB.TextBox txtCodex1 
         Height          =   285
         Index           =   7
         Left            =   360
         TabIndex        =   11
         Top             =   3720
         Width           =   5655
      End
      Begin VB.TextBox txtCodex1 
         Height          =   285
         Index           =   6
         Left            =   360
         TabIndex        =   10
         Top             =   3360
         Width           =   5655
      End
      Begin VB.TextBox txtCodex1 
         Height          =   285
         Index           =   5
         Left            =   360
         TabIndex        =   9
         Top             =   3000
         Width           =   5655
      End
      Begin VB.TextBox txtCodex1 
         Height          =   285
         Index           =   4
         Left            =   360
         TabIndex        =   8
         Top             =   2640
         Width           =   5655
      End
      Begin VB.TextBox txtCodex1 
         Height          =   285
         Index           =   3
         Left            =   360
         TabIndex        =   7
         Top             =   2280
         Width           =   5655
      End
      Begin VB.TextBox txtCodex1 
         Height          =   285
         Index           =   2
         Left            =   360
         TabIndex        =   6
         Top             =   1920
         Width           =   5655
      End
      Begin VB.TextBox txtCodex1 
         Height          =   285
         Index           =   1
         Left            =   360
         TabIndex        =   5
         Top             =   1560
         Width           =   5655
      End
      Begin VB.TextBox txtCodex1 
         Height          =   285
         Index           =   0
         Left            =   360
         TabIndex        =   4
         Top             =   1200
         Width           =   5655
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   $"frmGuildDetails.frx":02A4
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   6255
      End
   End
   Begin VB.Frame frmDesc 
      Caption         =   "Descripción"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   6495
      Begin VB.TextBox txtDesc 
         Height          =   1455
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   1
         Top             =   360
         Width           =   6135
      End
   End
End
Attribute VB_Name = "frmGuildDetails"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'************************************************* ****************
'ImperiumAO - v1.0
'************************************************* ****************
'Copyright (C) 2015 Gaston Jorge Martinez
'Copyright (C) 2015 Alexis Rodriguez
'Copyright (C) 2015 Luis Merino
'Copyright (C) 2015 Girardi Luciano Valentin
'
'Respective portions copyright by taxpayers below.
'
'This library is free software; you can redistribute it and / or
'Modify it under the terms of the GNU General Public
'License as published by the Free Software Foundation version 2.1
'The License
'
'This library is distributed in the hope that it will be useful,
'But WITHOUT ANY WARRANTY; without even the implied warranty
'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
'Lesser General Public License for more details.
'
'You should have received a copy of the GNU General Public
'License along with this library; if not, write to the Free Software
'Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
'************************************************* ****************
'
'************************************************* ****************
'You can contact me at:
'Gaston Jorge Martinez (Zenitram@Hotmail.com)
'************************************************* ****************

Option Explicit

Private Const MAX_DESC_LENGTH As Integer = 520
Private Const MAX_CODEX_LENGTH As Integer = 100

Private Sub Command1_Click(Index As Integer)
    Select Case Index
        Case 0
            Unload Me
        
        Case 1
            Dim fdesc As String
            Dim Codex() As String
            Dim k As Byte
            Dim Cont As Byte
    
            fdesc = Replace(txtDesc, vbCrLf, "º", , , vbBinaryCompare)
    
            '    If Not AsciiValidos(fdesc) Then
            '        MsgBox "La descripcion contiene caracteres invalidos"
            '        Exit Sub
            '    End If

            Cont = 0
            For k = 0 To txtCodex1.UBound
            '    If Not AsciiValidos(txtCodex1(k)) Then
            '        MsgBox "El codex tiene invalidos"
            '        Exit Sub
            '    End If
                If LenB(txtCodex1(k).Text) <> 0 Then Cont = Cont + 1
            Next k
            If Cont < 4 Then
                MsgBox "Debes definir al menos cuatro mandamientos."
                Exit Sub
            End If
                        
            ReDim Codex(txtCodex1.UBound) As String
            For k = 0 To txtCodex1.UBound
                Codex(k) = txtCodex1(k)
            Next k
    
            If CreandoClan Then
                Call WriteCreateNewGuild(fdesc, ClanName, Site, Codex)
            Else
                Call WriteClanCodexUpdate(fdesc, Codex)
            End If

            CreandoClan = False
            Unload Me
            
    End Select
End Sub

Private Sub txtCodex1_Change(Index As Integer)
    If Len(txtCodex1.ITEM(Index).Text) > MAX_CODEX_LENGTH Then _
        txtCodex1.ITEM(Index).Text = Left$(txtCodex1.ITEM(Index).Text, MAX_CODEX_LENGTH)
End Sub

Private Sub txtDesc_Change()
    If Len(txtDesc.Text) > MAX_DESC_LENGTH Then _
        txtDesc.Text = Left$(txtDesc.Text, MAX_DESC_LENGTH)
End Sub
