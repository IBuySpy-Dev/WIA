using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WIA
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string authMethod = string.Format("method {0}", Thread.CurrentPrincipal.Identity.AuthenticationType);
            loginMethod.Text = authMethod;
            claims.DataSource = WindowsIdentity.GetCurrent().Claims;
            claims.DataBind();
        }
    }
}