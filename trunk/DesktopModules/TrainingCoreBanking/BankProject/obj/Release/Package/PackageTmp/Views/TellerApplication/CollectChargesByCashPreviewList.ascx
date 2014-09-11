﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CollectChargesByCashPreviewList.ascx.cs" Inherits="BankProject.Views.TellerApplication.CollectChargesByCashPreviewList" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<telerik:RadGrid runat="server" AutoGenerateColumns="False" ID="radGridReview" AllowPaging="True" OnNeedDataSource="radGridReview_OnNeedDataSource">
    <MasterTableView>
        <Columns>
            <telerik:GridBoundColumn HeaderText="Code" HeaderStyle-Width = "25%" DataField="Code" />
            <telerik:GridBoundColumn HeaderText="Account Type" HeaderStyle-Width = "30%" DataField="AccountTypeName" />
            <telerik:GridBoundColumn HeaderText="Account" HeaderStyle-Width = "25%" DataField="AccountCode" />
            <telerik:GridBoundColumn HeaderText="Charge Amount" DataField="ChargAmount" HeaderStyle-HorizontalAlign="right" HeaderStyle-Width = "20%"  ItemStyle-HorizontalAlign="Right" DataType="System.Decimal"  DataFormatString="{0:N}" />
            <telerik:GridTemplateColumn>
                <ItemStyle Width="25" />
                <ItemTemplate>  
                    <a href='Default.aspx?tabid=141&codeid=<%# Eval("Id") %>'><img src="Icons/bank/text_preview.png" alt="" title="" style="" /> </a> 
                </itemtemplate>
            </telerik:GridTemplateColumn>
        </Columns>
    </MasterTableView>    
</telerik:RadGrid>