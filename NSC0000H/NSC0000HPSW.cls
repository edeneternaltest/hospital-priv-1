'/----------------------------------------------------------------------/
'/
'/    ���і��́FMedWorks2.0
'/��޼ު�Ė��́Fհ��-�m�F/�߽ܰ�ޕύX
'/        �h�c�FNSC0000HPSW.cls
'/
'/
'/      �쐬�ҁF        CREATE 1997/05/06          REV 01.00
'/      �X�V�ҁF        UPDATE     /  /            REV 01.01
'/                        �X�V���e�F(   )
'/     Copyright (C) Inter co.,ltd 1997
'/----------------------------------------------------------------------/
Option Explicit On

Public Class clsPassword
    Private m_EndFlg As Boolean     '�I�����(OK:True,��ݾ�:False)

    'հ�ފm�F��ʂ̏I����Ԃ��󂯎��
    Public WriteOnly Property pEndStatus(ByVal p_Flg As Boolean)
        Set(ByVal value)
            m_EndFlg = p_Flg
        End Set
    End Property
    'հ�ފm�F��ʂ̏I����Ԃ������n��
    Public ReadOnly Property pEndStatus() As Boolean
        Get
            pEndStatus = m_EndFlg
        End Get
    End Property

    'հ�ް�����͉�ʂ�\������
    Public Sub mShowWindow()
        Const W_SUBNAME As String = "clsNska000a mShowWindow"

        Try
            Dim w_FrmUser As frmNSC0000HB = New frmNSC0000HB

            '۰��
            Call w_FrmUser.NSC0000HB_Load()

            '�\��
            If General.g_LuncherFlg <> True Then
                If w_FrmUser.pLoadStatus = True Then
                    w_FrmUser.ShowDialog()
                End If
            Else
                Call w_FrmUser.subFormUnload()
            End If

            '�I������׸ގ擾
            m_EndFlg = w_FrmUser.pEndStatus
            General.g_ErrCheck = w_FrmUser.pEndStatus

            '̫�ѵ�޼ު�Ẳ��
            w_FrmUser = Nothing
        Catch ex As Exception
            Call General.paTrpMsg(Str(Err), W_SUBNAME)
        End Try
    End Sub
End Class