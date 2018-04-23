Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Private Shared progress As Double

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not IsPostBack AndAlso Not IsCallback Then
            progress = 0
        End If
    End Sub

    Protected Sub ASPxCallback1_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Dim count As Integer = 10
        Dim i As Integer = 0
        Do While i < count
            progress = Convert.ToDouble(i) / Convert.ToDouble(count) * 100
            System.Threading.Thread.Sleep(5000)
            i += 1
        Loop
    End Sub
    Protected Sub ASPxCallback2_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        e.Result = progress & "%"
    End Sub
End Class
