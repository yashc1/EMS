﻿
 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageSupervisor.Master" AutoEventWireup="true" CodeBehind="PendingReviews.aspx.cs" Inherits="EMS.ViewReviews" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .CompletionList
        {
            background-color: #fff;
            margin-top: 0px;
            padding: 1px 0px 1px 0px;
            
        }
        .CompletionListItem
        {
            background-color: #3498db;
            margin: 0px;
            padding: 2px;
            color: #fff;
            border:1px solid black;

        }
        .CompletionListItemHighLight
        {   background-color: #34495e;
            margin: 0px;
            padding: 2px;
            color:#fff;

        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 style="color:deeppink;">Pending Reviews</h1>
    <hr />
    <br />
    <table>
        <tr>
            <td style="width:150px;">Employee Name</td>
            <td>
                <asp:TextBox ID="EnameTextBox" runat="server" placeholder="Type for hint" on></asp:TextBox>
            </td>
        </tr>
    </table>
    &nbsp;<cc1:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" DelimiterCharacters=""

            Enabled="True" ServiceMethod="GetEmployeesList" MinimumPrefixLength="1" EnableCaching="false" ServicePath=""
            CompletionListItemCssClass="CompletionListItem" CompletionListCssClass="CompletionList" CompletionListHighlightedItemCssClass="CompletionListItemHighLight"

            TargetControlID="EnameTextBox">

        </cc1:AutoCompleteExtender>
    
    <hr />
    <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Table ID="Table1" runat="server" GridLines="Both">
            <asp:TableRow runat="server">
                <asp:TableHeaderCell runat="server">Employee</asp:TableHeaderCell>
                <asp:TableHeaderCell runat="server">Start Date</asp:TableHeaderCell>
                <asp:TableHeaderCell runat="server">End Date</asp:TableHeaderCell>
                <asp:TableHeaderCell runat="server">Due Date</asp:TableHeaderCell>
                <asp:TableHeaderCell runat="server">Status</asp:TableHeaderCell>
                <asp:TableHeaderCell runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:TableHeaderCell>
            </asp:TableRow>

       
    </asp:Table>
</asp:Content>
