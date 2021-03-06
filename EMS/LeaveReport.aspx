﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LeaveReport.aspx.cs" Inherits="EMS.LeaveReport" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function doPrint()
        {
            var prtContent = document.getElementById('<%= GridView1.ClientID %>');
            var prtChart = document.getElementById('<%= Chart2.ClientID %>');
            prtContent.border = 1; //set no border here
            var WinPrint = window.open('', '', 'left=100,top=100,width=1000,height=1000,toolbar=0,scrollbars=1,status=0,resizable=1');
            WinPrint.document.write("<h1 style=\"text-align:center\" > Leave Report </h1> <hr/>");
            var selectedvalue = '<%= ReportDropDownList.SelectedValue %>';
            if ((selectedvalue.localeCompare("Leave Type")) == 0)
            {
                WinPrint.document.write("<br/><b> Generated For : "+ '<%= ReportDropDownList.SelectedValue %>' +" - " +  '<%= LeaveTypeDropDownList.SelectedItem.Text %>' +"</b>" );
                WinPrint.document.write("<br/><b> Date : " + '<%= FromDateTextBox.Text %>' + "  To  " + '<%= ToDateTextBox.Text %>' +"</b>");
                WinPrint.document.write("<br/><b> Job Title : " + '<%= JobTitleDropDownList.SelectedItem.Text %>'+"</b> <br/> <hr/> <br/>");
            
            }
            else
            {
                WinPrint.document.write("<br/><b> Generated For : " +  '<%= EnameTextBox.Text %>' + "</b>" );
                WinPrint.document.write("<br/><b> Date : " + '<%= EmpFromDate.Text %>' + "  To  " + '<%= EmpToDate.Text %>' + "</b><br/> <hr/> <br/>");
				
            }
            WinPrint.document.write(prtContent.outerHTML);
            WinPrint.document.write("<br/><hr/><br/>");
            WinPrint.document.write(prtChart.outerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            //WinPrint.print();
           // WinPrint.close();
        }
</script>

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
    <h1 style="color:deeppink;">Leave Report</h1>
    <hr />
    <br />
    &nbsp;&nbsp;&nbsp;
    Generate For
    <br />
&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="ReportDropDownList" runat="server" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ReportDropDownList_SelectedIndexChanged">
        <asp:ListItem  Value="0" Text="--Select--" />
        <asp:ListItem  Value="Leave Type" Text="Leave Type" />
        <asp:ListItem  Value="Employee" Text="Employee" />
    </asp:DropDownList>
    
    <br />
    <br />

    <asp:MultiView ID="MultiView1" runat="server" Visible="false">
        <asp:View ID="LeaveTypeView" runat="server">
            &nbsp;&nbsp;&nbsp;
            <table style="padding-left:10px">
                <tr>
                    <td style="width:200px">
                        Leave Type
                    </td>
                    <td style="width:200px">
                        From
                    </td>
                    <td style="width:200px">
                        To
                    </td>
                    <td style="width:200px">
                        Job Title
                    </td>
                </tr>
                <tr>
                    <td style="width:200px">
                        <asp:DropDownList ID="LeaveTypeDropDownList" runat="server" Width="150px"></asp:DropDownList>
                    </td>
                    <td style="width:200px">
                        <asp:TextBox ID="FromDateTextBox" runat="server" TextMode="Date" Text="2019-01-01"></asp:TextBox>
                    </td>
                    <td style="width:200px">
                        <asp:TextBox ID="ToDateTextBox" runat="server" TextMode="Date" Text="2019-12-31"></asp:TextBox>
                    </td>
                    <td style="width:200px">
                        <asp:DropDownList ID="JobTitleDropDownList" runat="server" ></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ValidationGroup="group1" ControlToValidate="FromDateTextBox" ForeColor="Red" ></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="From Date must be less than To date" Operator="LessThanEqual" Font-Size="Small" Type="Date" ControlToCompare="ToDateTextBox" ControlToValidate="FromDateTextBox" ForeColor="Red" ValidationGroup="group1"></asp:CompareValidator>
                    </td>
                    <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ValidationGroup="group1" ControlToValidate="ToDateTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="LeaveViewButton" runat="server" Text="View" Width="78px" ValidationGroup="group1" OnClick="LeaveViewButton_Click" />
                    </td>
                </tr>

            </table>
        </asp:View>
        <asp:View ID="EmployeeView" runat="server">
            &nbsp;&nbsp;&nbsp;
            <table style="padding-left:10px">
                <tr>
                    <td style="width:200px">
                        Employee
                    </td>
                    <td style="width:200px">
                        From
                    </td>
                    <td style="width:200px">
                        To
                    </td>
                </tr>
                <tr>
                    <td style="width:200px">
                        <asp:TextBox ID="EnameTextBox" runat="server" placeholder="Employee Name" ></asp:TextBox>
                    </td>
                    <td style="width:200px">
                        <asp:TextBox ID="EmpFromDate" runat="server" TextMode="Date" Text="2019-01-01" ></asp:TextBox>
                    </td>
                    <td style="width:200px">
                        <asp:TextBox ID="EmpToDate" runat="server" TextMode="Date" Text="2019-12-31" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Select name from list" ControlToValidate="EnameTextBox" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="group2" ForeColor="Red"></asp:CustomValidator>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ValidationGroup="group2" ControlToValidate="EmpFromDate" ForeColor="Red" ></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="From Date must be less than To date" Operator="LessThanEqual" Font-Size="Small" Type="Date" ControlToCompare="EmpToDate" ControlToValidate="EmpFromDate" ForeColor="Red" ValidationGroup="group2"></asp:CompareValidator>
                    </td>
                    <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ValidationGroup="group2" ControlToValidate="EmpToDate" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="EmployeeViewButton" runat="server" Text="View" Width="78px" ValidationGroup="group2" OnClick="EmployeeViewButton_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>


    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    
    <br />
    
    <cc1:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" DelimiterCharacters="" FirstRowSelected="true"

            Enabled="True" ServiceMethod="GetListofEmployeeName" MinimumPrefixLength="1" EnableCaching="false" ServicePath=""
            CompletionListItemCssClass="CompletionListItem" CompletionListCssClass="CompletionList" CompletionListHighlightedItemCssClass="CompletionListItemHighLight"

            TargetControlID="EnameTextBox">

        </cc1:AutoCompleteExtender>&nbsp;&nbsp;
    <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
    <br />
    <hr />
    <br />
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="No records found">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Employee" ItemStyle-Width="200px" ReadOnly="true" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="LeaveEntitlement" HeaderText="Leave Entitlements(Days)" ItemStyle-Width="200px" ReadOnly="true" ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="PendingLeave" HeaderText="Pending Laeve(Days)" ItemStyle-Width="200px" ReadOnly="true" ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="ScheduledLeave" HeaderText="Scheduled Laeve(Days)" ItemStyle-Width="200px" ReadOnly="true" ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="ConsumedLeave" HeaderText="Consumed Laeve(Days)" ItemStyle-Width="200px" ReadOnly="true" ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="LeaveBalance" HeaderText="Leave Balance(Days)" ItemStyle-Width="200px" ReadOnly="true" ItemStyle-HorizontalAlign="Center"/>
        </Columns>
    </asp:GridView>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="PrintButton" runat="server" Text="Print" OnClientClick="doPrint()" Visible="false" Width="78px"/>
    <hr />
    <br />
    <div id="printPart">
    <asp:Chart ID="Chart2" runat="server" Width="414px" Height="396px" BackColor="Transparent"
            Palette="SemiTransparent" EnableViewState="true" >
        <Series>
            <asp:Series Name="Series1" XValueMember="Status" YValueMembers="Days" IsVisibleInLegend="true"
                    ChartType="Pie" IsValueShownAsLabel="true"  >

            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" BackColor="Azure">

                <AxisX LineColor="Red">
                        <MajorGrid LineColor="LightGray" />
                    </AxisX>
                    <AxisY LineColor="Yellow">
                        <MajorGrid LineColor="LightGray" />
                    </AxisY>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
                <asp:Legend>
                </asp:Legend>
            </Legends>
    </asp:Chart>
    </div>

</asp:Content>
