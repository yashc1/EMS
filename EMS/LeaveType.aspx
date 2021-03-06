﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LeaveType.aspx.cs" Inherits="EMS.LeaveType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="color:deeppink;">Leave Types</h1>
    <hr />
    <div style="height:100px;">
        <br />
        <br />
        <asp:textbox id="AddNewLeaveTypeBox" runat="server" placeholder="new leave type name" Width="245px" ></asp:textbox>
        
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="AddButton" runat="server" Text="Add" Width="77px" ValidationGroup="group" OnClick="AddLeaveType" />
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AddNewLeaveTypeBox" ErrorMessage="Enter leave type" ForeColor="Red" Font-Size="Large" ValidationGroup="group"></asp:RequiredFieldValidator>
        
    </div>
    <hr />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
    <br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
    
    <br />
    <br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:button runat="server" text="Delete" id="DeleteButton" OnClick="DeleteLeaveType"/>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Can't delete because of it is in use" Visible="false" ForeColor="Red"></asp:Label>
</asp:Content>
