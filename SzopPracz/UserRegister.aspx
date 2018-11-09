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
            Login:<asp:TextBox ID="txRLogin" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txRLogin" ErrorMessage="Podaj Login" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValUserEgsists" runat="server" ControlToValidate="txRLogin" ErrorMessage="Nazwa zajęta" OnServerValidate="CustomValUserEgsists_ServerValidate"></asp:CustomValidator>
            <br />
            Hasło:<asp:TextBox ID="txRPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txRPassword" ErrorMessage="Podaj Hasło" Font-Overline="False" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txRPassword" ErrorMessage="Hasło powinno zawierać 1 dużą literę,jedną małą , jedną cyfrę i  mieć długość od 9 do 20 znaków" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$">*</asp:RegularExpressionValidator>
            <br />
             Powtórz hasło:<asp:TextBox ID="txRepeatPass" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txRPassword" ControlToValidate="txRepeatPass" ErrorMessage="Hasła muszą się zgadzać" ForeColor="Red">*</asp:CompareValidator>
            <br />
            <asp:Button ID="bRSubmit" runat="server" Text="Button" OnClick="bRSubmit_Click" />
            <asp:Label ID="lInfo" runat="server" Text="Label"></asp:Label>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    </form>
</body>
</html>
