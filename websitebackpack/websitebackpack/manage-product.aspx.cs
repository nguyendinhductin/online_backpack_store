using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text.RegularExpressions;
using System.IO;
using System.Data;

namespace websitebackpack
{
    public partial class manage_product : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["Email_USER"] == null)
                {
                    Response.Redirect("~/index.aspx");
                }
            }
            
        }
        private string getimg()
        {
            string folderPath = Server.MapPath("~/Images/");
            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }
            // Before attempting to save the file, verify
            // that the FileUpload control contains a file.
            string url="";
            if (imgload.HasFile)
            {
                string savePath = folderPath + Path.GetFileName(imgload.FileName);
                imgload.SaveAs(savePath);
                url = "/Images/" + Path.GetFileName(Path.GetFileName(imgload.FileName));
                
            }
            return url;
        }
        //cheack 
        bool c = false;
        private void cheak(string img, string name, string number, string note)
        {
            dataservices dataservices = new dataservices();
            string sql = string.Format("select * from Products where ProductName = N'{0}'", name);
            DataTable tb =  dataservices.getData(sql);
            if (img == "")
            {
                Response.Write("<script>confirm('Img cannot be empty!')</script>");
            }
            else if (name == "")
            {
                Response.Write("<script>confirm('Name cannot be empty!')</script>");
            }
            else if (number == "")
            {
                Response.Write("<script>confirm('Price cannot be empty!')</script>");
            }
            else if (tb.Rows.Count > 0)
            {
                Response.Write("<script>confirm('This name already exists!')</script>");
            }
            //if satisfied with add
            else
            {
                c = true;
            }
        }
        protected void add_click(object sender, EventArgs e)
        {
            string img = getimg();
            string name = cname.Value;
            string numbera = number.Value;
            string note = Description.Value;
            // move string
            if (name.IndexOf("'") > 0)
            {
                name = addchuoi(name);
            }
            if (note.IndexOf("'") > 0)
            {
                note = addchuoi(note);
            }
            dataservices dataservices = new dataservices();
            string sql = string.Format("insert into Products(CategoryID,ProductName,Price,Image,Description) Values({0},N'{1}',{2},N'{3}',N'{4}')", 2,name,numbera,img,note);
            cheak(img, name, numbera, note);
            if (c == true)
            {
                dataservices.runquery(sql);
                Response.Write("<script>confirm('Add data successfully!')</script>");
            }
            

        }
        //if string "'" edit string "''" 
        private string addchuoi(string a)
        {
            for (int i = 0; i < a.Length; i++)
            {
                if (a[i].ToString() == "'")
                {
                    a = a.Insert(i, "'");
                    i = i + 2;
                }
            }


            return a;
        }

    }
  
}