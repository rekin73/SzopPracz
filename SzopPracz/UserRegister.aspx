<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="SzopPracz.UserRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Login:<asp:TextBox ID="txRLogin" runat="server"></asp:TextBox><br />
            Hasło:<asp:TextBox ID="txRPassword" runat="server" TextMode="Password"></asp:TextBox><br />
             Powtórz hasło:<asp:TextBox ID="txRepeatPass" runat="server" TextMode="Password"></asp:TextBox><br />
            <asp:Button ID="bRSubmit" runat="server" Text="Button" OnClick="bRSubmit_Click" />
            <asp:Label ID="lInfo" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
