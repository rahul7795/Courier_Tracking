<%@ Page Title="ABC Courier Services - Approve Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApproveUsers.aspx.cs" Inherits="WebApp.ApproveUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top:5% !important;">
        <asp:GridView runat="server" ID="gdvApprovalData" class="table table-responsive" AutoGenerateColumns="false"
            OnRowCommand="gdvApprovalData_RowCommand">

            <Columns>
                <asp:TemplateField HeaderText="#">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblId" Text='<%#Eval("um_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>       
                <asp:TemplateField HeaderText="Role">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblRoleId" Text='<%#Eval("um_RoleId").ToString()=="1"?"Super Admin":(Eval("um_RoleId").ToString()=="2"?"Admin":(Eval("um_RoleId").ToString()=="3"?"Staff":"User")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblName" Text='<%#Eval("um_firstName")+" "+Eval("um_lastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblGender" Text='<%#Eval("um_gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Contact">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblContact" Text='<%#Eval("um_contact")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblEmail" Text='<%#Eval("um_emailId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Salary">
                    <ItemTemplate>
                        <asp:TextBox runat="server" ID="txtSalary" ClientIDMode="Static" TextMode="Number" Text=0></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:ButtonField HeaderText="Approve" ButtonType="Image" ImageUrl="Images/ok.png" CommandName="approve"/>
                <asp:ButtonField HeaderText="Reject" ButtonType="Image" ImageUrl="Images/delete.png" CommandName="reject"/>                
                </Columns>
        </asp:GridView>
    </div>
</asp:Content>
