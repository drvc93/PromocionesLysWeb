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

            <script type="text/javascript">
                function ShowProgress() {
                    setTimeout(function () {
                        var modal = $('<div />');
                        modal.addClass("modal");
                        $('body').append(modal);
                        var loading = $(".loading");
                        loading.show();
                        var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                        var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                        loading.css({ top: top, left: left });
                    }, 200);
                }
                $('form').live("submit", function () {
                    ShowProgress();
                });
            </script>

            <script>
                function scrollWin() {
                    window.scrollTo(1000, 500);
                }
            </script>

            <style>
                #inner
                {
                    display: table;
                    margin: 0 auto;
                }

                input[type=text], select, #txtFechaNacimiento, #txtCorreo
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
                            <button  style="width:100%;background-color:#E60411;height:50px" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">REGISTRA TU CODIGO</button>

                        </div>
                    </td>
                </tr>
            </table>

            <div  class="modal fade" id="myModal" role="dialog">

                <form runat="server" id="form1">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                    <asp:Timer ID="timerPage" runat="server" OnTick="timerPage_Tick" Interval="1000"  ></asp:Timer>
                    <asp:UpdatePanel runat="server" >
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="timerPage" EventName="Tick" />
                            <asp:AsyncPostBackTrigger ControlID="btnReg" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>

                            <div id="inner" style="margin-top:15px;" >

                                <table>

                                    <tr>
                                        <td >
                                            <asp:Label   runat="server" Text="NOMBRES" ForeColor="White" Font-Size="Large" Font-Italic="true" Font-Bold="true"></asp:Label>
                                            <asp:TextBox  PlaceHolder="Nombres"   ID="txtNombre"  runat="server"  CssClass="text-center" > </asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td >
                                            <asp:Label   runat="server" Text="APELLIDOS" ForeColor="White" Font-Size="Large" Font-Italic="true" Font-Bold="true"></asp:Label>
                                            <asp:TextBox  PlaceHolder="Apellidos"   ID="txtApellidos"  runat="server"  CssClass="text-center" > </asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td >
                                            <asp:Label   runat="server" Text="N° DNI" ForeColor="White" Font-Size="Large" Font-Italic="true" Font-Bold="true"></asp:Label>
                                            <asp:TextBox  PlaceHolder="DNI"  ID="txtDni" onkeypress="return isNumberKey(event)" runat="server" MaxLength="8" CssClass="text-center" > </asp:TextBox>
                                            <asp:RegularExpressionValidator style="display:none" ID="RegularExpressionValidator1" ControlToValidate="txtDni" runat="server" ErrorMessage="Solo números" ValidationExpression="\d+"></asp:RegularExpressionValidator>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td >
                                            <asp:Label   runat="server" Text="Telefono" ForeColor="White" Font-Size="Large" Font-Italic="true" Font-Bold="true"></asp:Label>
                                            <asp:TextBox  PlaceHolder="Telefono" style="margin-bottom:8px;"  ID="txtTelefono"  runat="server"  CssClass="text-center" > </asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            <asp:Label   runat="server" Text="Fecha Nacimiento" ForeColor="White" Font-Size="Large" Font-Italic="true" Font-Bold="true"></asp:Label>
                                            <asp:TextBox TextMode="Date" style=""  ID="txtFechaNacimiento"  runat="server"  > </asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td >
                                            <asp:Label   runat="server" Text="Correo" ForeColor="White" Font-Size="Large" Font-Italic="true" Font-Bold="true"></asp:Label>
                                            <asp:TextBox  PlaceHolder="Correo : ejemplo@hotmail.com"  ID="txtCorreo"  TextMode="Email" runat="server"  CssClass="text-center" > </asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td >
                                            <asp:Label   runat="server" Text="Codigo" ForeColor="White" Font-Size="Large" Font-Italic="true" Font-Bold="true"></asp:Label>
                                            <asp:TextBox  PlaceHolder="Codigo Promocion" style="margin-bottom:8px;"  ID="txtCodPromocion"  runat="server"  CssClass="text-center" > </asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:Button   OnClientClick ="scrollToElement('divsuccess');" style ="color:white;background-color:black"  Font-Bold="true" runat="server" Text="REGISTRAR"  OnClick="btnReg_Click" ID="btnReg"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="diverror"  runat="server"  visible="false" style="margin-top:0px;" class="alert alert-danger">
                                                <strong>Error!</strong>Error al registrar codigo.
                                            </div>
                                            
                                            <div id="divsuccess"  runat="server" visible="false"  style="margin-top:0px;" class="alert alert-success">
                                                <strong>Exito!</strong> Se registro correctamente
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server"  style="display:none;" ID="txtTimer"></asp:Label>
                                           
                                        </td>
                                    </tr>

                                </table>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </form>
            </div>

        </body>
    </html>
