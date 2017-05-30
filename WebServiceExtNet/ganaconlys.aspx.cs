using System;
using System.Collections.Generic;
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
            btnReg.Visible = false;
            divsuccess.Visible = true;
            
            Page.MaintainScrollPositionOnPostBack = true;
            PageWait();

        }

        public void PageWait () {

            timewait = Convert.ToDateTime(txtTimer.Text);
            timewait = timewait.AddSeconds(10);
            //Session["WaitTime"] = timewait;
            Session["FlagReg"] = "S";
            Session["ContSeg"] = 0;

        }

        protected void timerPage_Tick(object sender, EventArgs e)
        {
            txtTimer.Text = DateTime.Now.ToString();
            DateTime Ttimer = Convert.ToDateTime(txtTimer.Text);


           
                
              //  DateTime timesession = Convert.ToDateTime(Session["WaitTime"].ToString());

            if (Session["ContSeg"]!= null  && Session["FlagReg"] != null)
            {
                int contadorsec =  Convert.ToInt32 (Session["ContSeg"]) ;
                string flagregist = Session["FlagReg"].ToString();

                if (flagregist == "S"  && contadorsec > 9 )
                {   
                    
                    Response.Redirect("htttp://www.facebook.com/");
                }

                if (flagregist == "S")
                {
                    contadorsec = contadorsec + 1;
                    Session["ContSeg"] = contadorsec;
                }

            }

        }
    }
}