<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ganaconlys.aspx.cs" Inherits="WebServiceExtNet.ganalys" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <!DOCTYPE html>
    <html lang="en">
        <head>

            <title>GANA CON LYS</title>

            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

            <script language=Javascript>
                function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
                return true;
                }
            </script>
            <style>
                #inner
                {
                    display: table;
                    margin: 0 auto;
                }

                input[type=text], select, #txtFechaNacimiento , #txtCorreo
                {
                    width: 100%;
                    padding: 12px 20px;
                    margin: 8px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-sizing: border-box;
                }
                #btnReg
                {
                    width: 100%;
                    background-color: #4CAF50;
                    color: white;
                    padding: 14px 20px;
                    margin: 8px 0;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                }
            </style>
        </head>
        <body>

            <table style="height:90%; margin-top:3%;">
                <tr>
                    <td style="height:100%">
                        <div style=" margin-left:5%; margin-right:5% ; " >
                            <img  src="imgs/afichefiltroslys.jpg"  style="width:100% ; height:100%; border-radius:10px; object-fit: contain " />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div  style=" margin-left:5%; margin-right:5% ; " >
                            <button  style="width:100%;background-color:#E60411;height:50px" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">REGISTRAR CODIGO</button>

                        </div>
                    </td>
                </tr>
            </table>

            <div  class="modal fade" id="myModal" role="dialog">

                <form runat="server" id="form1">

                    <div id="inner" >

                        <table>
                            <tr>
                                <td>
                                
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <asp:TextBox  PlaceHolder="Nombres" style="margin-bottom:8px;"  ID="txtNombre"  runat="server" MaxLength="8" CssClass="text-center" > </asp:TextBox>

                                </td>
                            </tr>
                             <tr>
                                <td >
                                    <asp:TextBox  PlaceHolder="Apellidos" style="margin-bottom:8px;"  ID="txtApellidos"  runat="server" MaxLength="8" CssClass="text-center" > </asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <asp:TextBox  PlaceHolder="DNI"  style="margin-bottom:8px;" ID="txtDni" onkeypress="return isNumberKey(event)" runat="server" MaxLength="8" CssClass="text-center" > </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtDni" runat="server" ErrorMessage="Solo números" ValidationExpression="\d+"></asp:RegularExpressionValidator>

                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <asp:TextBox  PlaceHolder="Telefono" style="margin-bottom:8px;"  ID="txtTelefono"  runat="server" MaxLength="8" CssClass="text-center" > </asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <asp:TextBox TextMode="Date" style="margin-bottom:2px;"  ID="txtFechaNacimiento"  runat="server"  > </asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <td >
                                    <asp:TextBox  PlaceHolder="Correo : ejemplo@hotmail.com" style="margin-bottom:8px;"  ID="txtCorreo"  TextMode="Email" runat="server" MaxLength="8" CssClass="text-center" > </asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <td >
                                    <asp:TextBox  PlaceHolder="Codigo Promocion" style="margin-bottom:8px;"  ID="txtCodPromocion"  runat="server" MaxLength="8" CssClass="text-center" > </asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:Button  runat="server" Text="Registrar"  ID="btnReg"/>
                                </td>
                            </tr>

                        </table>
                    </div>
                </form>
            </div>

        </body>
    </html>
