using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    private static double progress;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && !IsCallback) {
            progress = 0;
        }
    }

    protected void ASPxCallback1_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e) {
        int count = 10;
        for (int i = 0; i < count; i++) {
            progress = Convert.ToDouble(i) / Convert.ToDouble(count) * 100;
            System.Threading.Thread.Sleep(5000);
        }
    }
    protected void ASPxCallback2_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e) {
        e.Result = progress + "%";
    }
}
