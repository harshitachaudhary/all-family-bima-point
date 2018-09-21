using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClassDate
/// </summary>
public class ClassDate
{
	public ClassDate()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string date()
    {
        string strdatex = DateTime.UtcNow.AddHours(5).AddMinutes(30).ToString();
        string[] ss = strdatex.Split(new char[] { '/', ' ', ':' }, StringSplitOptions.RemoveEmptyEntries);
        string datee = ss[0].ToString() + ss[1].ToString() + ss[2].ToString() + ss[3].ToString() + ss[4].ToString() + ss[5].ToString();
        return datee;
    }
}