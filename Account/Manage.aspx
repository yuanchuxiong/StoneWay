﻿<%@ Page Title="アカウントの管理." Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>

    </div>

    <div class="row">
        <div class="col-md-12">
            <section id="passwordForm">
                <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                    <p>
                        このサイトのローカル パスワードを持っていません。外部ログイン
                        なしでログインできるように、ローカル パスワードを追加してください。
                    </p>
                    <div class="form-horizontal">
                        <h4>パスワード フォームの設定</h4>
                        <hr />
                        <asp:ValidationSummary ID="ValidationSummary" runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">パスワード</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="password" TextMode="Password"  CssClass="form-control"  />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="password"
                                    CssClass="text-danger" ErrorMessage="パスワード フィールドは必須です。"
                                    Display="Dynamic" ValidationGroup="SetPassword" />
                                <asp:ModelErrorMessage ID="ModelErrorMessage1" runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                    CssClass="text-danger" SetFocusOnError="true" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">パスワードの確認入力</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password"  CssClass="form-control"  />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="パスワードの確認入力フィールドは必須です。"
                                    ValidationGroup="SetPassword" />
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="パスワードと確認のパスワードが一致しません。"
                                    ValidationGroup="SetPassword" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="Button1" runat="server" Text="パスワードの設定" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                    <p><strong><%: User.Identity.GetUserName() %></strong> としてログインしています。</p>
                    <div class="form-horizontal">
                        <h4>パスワードの変更フォーム</h4>
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">現在のパスワード</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="text-danger" ErrorMessage="現在のパスワードのフィールドは必須です。"
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">新しいパスワード</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="NewPassword"
                                    CssClass="text-danger" ErrorMessage="新しいパスワードが必要です。"
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">新しいパスワードの確認入力</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="新しいパスワードの確認入力が必要です。"
                                    ValidationGroup="ChangePassword" />
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="新しいパスワードと確認のパスワードが一致しません。"
                                    ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button ID="Button2" runat="server" Text="パスワードの変更" OnClick="ChangePassword_Click" CssClass="btn btn-default" ValidationGroup="ChangePassword" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>
            </section>

            <section id="externalLoginsForm">

                <asp:ListView ID="ListView1" runat="server"
                    ItemType="Microsoft.AspNet.Identity.UserLoginInfo"
                    SelectMethod="GetLogins" DeleteMethod="RemoveLogin" DataKeyNames="LoginProvider,ProviderKey">

                    <LayoutTemplate>
                        <h4>登録済みのログイン</h4>
                        <table class="table">
                            <tbody>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </tbody>
                        </table>

                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#: Item.LoginProvider %></td>
                            <td>
                                <asp:Button ID="Button3" runat="server" Text="削除" CommandName="Delete" CausesValidation="false"
                                    ToolTip='<%# "アカウントから " + Item.LoginProvider + " このログインを削除します" %>'
                                    Visible="<%# CanRemoveExternalLogins %>" CssClass="btn btn-default" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

                <uc:openauthproviders runat="server" returnurl="~/Account/Manage" />
            </section>

        </div>
    </div>

</asp:Content>
