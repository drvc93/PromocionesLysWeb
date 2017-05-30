using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebServiceExtNet
{
    public partial class ganalys : System.Web.UI.Page
    {
        int cont = 0;
        string flagregistrado="N";
        DateTime timewait;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
           
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;

            if (String.IsNullOrEmpty(txtNombre.Text)==true) 
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Aviso","alert('Debe ingresar un nombre valido');",true);
                return;
            
            }

            else if (String.IsNullOrEmpty(txtApellidos.Text) == true)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Aviso", "alert('Debe ingresar apellidos validos.');", true);
                return;

            }

            else if (String.IsNullOrEmpty(txtDni.Text) == true)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Aviso", "alert('Debe ingresar un número de DNI valido.');", true);
                return;

            }
            else if (String.IsNullOrEmpty(txtTelefono.Text) == true)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Aviso", "alert('Debe ingresar un número de telefono valido.');", true);
                return;

            }

            else if (String.IsNullOrEmpty(txtFechaNacimiento.Text) == true)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Aviso", "alert('Debe ingresar una fechade nacimiento valida.');", true);
                return;

            }

            else if (String.IsNullOrEmpty(txtCorreo.Text) == true)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Aviso", "alert('Debe ingresar un correo valido.');", true);
                return;

            }

            else if (String.IsNullOrEmpty(txtCodPromocion.Text) == true)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Aviso", "alert('La casilla de cupon no puede quedar vacia ingrese su cupon por favor.');", true);
                return;

            }




            string resultreg = RegistrarCupon();
            if (resultreg == "OK")
            {
                divsuccess.Visible = true;
              ///  btnReg.Visible = false;
                diverror.Visible = false;
                txtCodPromocion.Text = "";
            }
            else
            {
                
                diverror.Visible = true;
                txtError.Text = resultreg;
                divsuccess.Visible = false;

            }
            
           // Page.MaintainScrollPositionOnPostBack = true;
           

        }




        public string  RegistrarCupon() {
            string res = "OK";
            int sqlrows;

            //string opcion = "INS";
            string codProm = txtCodPromocion.Text;
            string dni = txtDni.Text;
            string nomb = txtNombre.Text;
            string apellido = txtApellidos.Text;
            string telefono = txtTelefono.Text;
            DateTime fechanac = Convert.ToDateTime(txtFechaNacimiento.Text);
            string correo = txtCorreo.Text;




            try
            {
                Conexion con = new Conexion();
                SqlConnection cn = con.conexion();
                SqlCommand sqlcmd = new SqlCommand("UP_MWE_GANACONLYS", cn);
                sqlcmd.Connection = cn;
                sqlcmd.CommandType = CommandType.StoredProcedure;
                cn.Open();

               // sqlcmd.Parameters.AddWithValue("@Opcion", opcion);
               
                sqlcmd.Parameters.AddWithValue("@Dni", dni.Trim().ToUpper());
                sqlcmd.Parameters.AddWithValue("@Nombre", nomb);
                sqlcmd.Parameters.AddWithValue("@Apellido", apellido);
                sqlcmd.Parameters.AddWithValue("@Telefono", telefono);
                sqlcmd.Parameters.AddWithValue("@FecNac", fechanac);
                sqlcmd.Parameters.AddWithValue("@Correo", correo);
                sqlcmd.Parameters.AddWithValue("@Cupon", codProm.Trim().ToUpper());
                SqlParameter par = new SqlParameter("@Mensaje", SqlDbType.VarChar);
                par.Size = 500;
                par.Direction = ParameterDirection.Output;
                sqlcmd.Parameters.Add(par);
                sqlrows = sqlcmd.ExecuteNonQuery();

                
                    res = Convert.ToString(sqlcmd.Parameters["@Mensaje"].Value);
                
            }
            catch (Exception e)
            {
                //      res = e.Message;
                res = e.Message;
            }

            return res;

        }

        public void PageWait () {

        }



        protected void timerPage_Tick(object sender, EventArgs e)
        {
            
               
        }
    }
}