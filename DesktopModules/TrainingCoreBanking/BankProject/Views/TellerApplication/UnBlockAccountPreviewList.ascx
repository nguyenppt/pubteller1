﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UnBlockAccountPreviewList.ascx.cs" Inherits="BankProject.Views.TellerApplication.UnBlockAccountPreviewList" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<telerik:RadGrid runat="server" AutoGenerateColumns="False" ID="radGridReview" AllowPaging="True" OnNeedDataSource="radGridReview_OnNeedDataSource">
    <MasterTableView>
        <Columns>
            <telerik:GridBoundColumn HeaderText="Account Code" DataField="AccountCode" />

            <telerik:GridTemplateColumn>
                <ItemStyle Width="25" />
                <ItemTemplate>  
                    <a href='Default.aspx?tabid=263&ctl=UnBlockAccount&mid=795&BlockId=<%# Eval("Id") %>'><img src="Icons/bank/text_preview.png" alt="" title="" style="" /> </a> 
                </itemtemplate>
            </telerik:GridTemplateColumn>
        </Columns>
    </MasterTableView>    
</telerik:RadGrid>