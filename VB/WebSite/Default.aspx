﻿<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v8.2, Version=8.2.3.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
    Namespace="DevExpress.Web.ASPxTimer" TagPrefix="dxt" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.2, Version=8.2.3.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v8.2, Version=8.2.3.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">

        <dxcb:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="myCallback1" OnCallback="ASPxCallback1_Callback">
            <ClientSideEvents 
                CallbackComplete="function(s, e) {
                    myButton.SetEnabled(true);
                    myTimer.SetEnabled(false);
                    myLabel.SetText('Process completed');
            }" />
        </dxcb:ASPxCallback>


        <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Perform callback" ClientInstanceName="myButton">
            <ClientSideEvents 
                Click="function(s, e) {
                    s.SetEnabled(false);
	                myCallback1.PerformCallback();
	                myLabel.SetText('Process completion: 0% ');
	                myLabel.SetClientVisible(true);
	                myTimer.SetEnabled(true);
                }" />
        </dxe:ASPxButton>


        <dxcb:ASPxCallback ID="ASPxCallback2" runat="server" ClientInstanceName="myCallback2" OnCallback="ASPxCallback2_Callback">
            <ClientSideEvents 
                CallbackComplete="function(s, e) {
                    var labelText = myLabel.GetText();
                    if(labelText != 'Process completed'){
	                myLabel.SetText(labelText + e.result + ' ');
	            }
                }" />
        </dxcb:ASPxCallback>

        <dxt:ASPxTimer ID="ASPxTimer1" runat="server" ClientInstanceName="myTimer" Enabled="False" Interval="1000">
            <ClientSideEvents 
                Tick="function(s, e) {
	                myCallback2.PerformCallback();
                }" />
        </dxt:ASPxTimer>


        <dxe:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="myLabel" ClientVisible="False">
        </dxe:ASPxLabel>

    </form>
</body>
</html>