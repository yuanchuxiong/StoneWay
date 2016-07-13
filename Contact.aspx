<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        change for dev
        <strong>Support:</strong>   <a href="mailto:Support@stone-way.net">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@stone-way.net">Marketing@example.com</a>
    </address>
</asp:Content>
