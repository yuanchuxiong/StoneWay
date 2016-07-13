<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RegisterExternalLogin.aspx.cs" Inherits="Account_RegisterExternalLogin" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3><%: ProviderName %> アカウントに登録します</h3>

    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
        <div class="form-horizontal">
            <h4>関連付けフォーム</h4>
            <hr />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
            <p class="text-info">
                <strong><%: ProviderName %></strong> で認証済みです。下に現在のサイトのユーザー名を入力し、
                [ログイン] ボタンをクリックしてください。
            </p>

            <div class="form-group">
                <asp:Label ID="Label1" runat="server" AssociatedControlID="userName" CssClass="col-md-2 control-label">ユーザー名</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="userName" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="userName"
                        Display="Dynamic" CssClass="text-danger" ErrorMessage="ユーザー名は必須です" />
                    <asp:ModelErrorMessage runat="server" ModelStateKey="UserName" CssClass="text-danger" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button ID="Button1" runat="server" Text="ログイン" CssClass="btn btn-default" OnClick="LogIn_Click" />
                </div>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Content>
