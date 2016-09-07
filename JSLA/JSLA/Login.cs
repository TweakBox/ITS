using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JSLA
{
    public partial class Login : Form
    {
        private Database _db = new Database();

        public Login()
        {
            InitializeComponent();
            _db.TryOpenConnection();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnSubmit_Click(object sender, EventArgs e)
        {
            string[,] result = _db.ScanRecords("tbl_accounts", new string[] { "Attempts", "Password", "AccType", "ReferenceId" }, "UserId = '" + tbxUserId.Text + '\'');
            if (result.GetLength(0) > 0)
                if (int.Parse(result[0, 0]) < 5)
                    if (tbxPassword.Text == result[0, 1].ToString())
                    {
                        _db.UpdateRecord("tbl_accounts", "UserId", tbxUserId.Text, new string[] { "Attempts" }, new string[] { "0" });

                        Form f = new Form();
                        switch (result[0, 2])
                        {
                            case "Student":
                                f = new Student.Dashboard(_db, result[0, 3]);
                                break;
                            case "Teacher":
                                break;
                            case "Admin":
                                break;
                        }

                        Hide();
                        f.ShowDialog();
                        Close();
                    }
                    else
                    {
                        _db.UpdateRecord("tbl_accounts", "UserId", tbxUserId.Text, new string[] { "Attempts" }, new string[] { (int.Parse(result[0, 0]) + 1).ToString() });

                        MessageBox.Show("Wrong password entered. Five(5) failed attempts will lead to your account being locked", "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        tbxPassword.Focus();
                        tbxPassword.SelectAll();
                        if (int.Parse(result[0, 0]) == 4)
                            MessageBox.Show("This account has failed five(5) log in attempts.", "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                else
                    MessageBox.Show("This account has failed five(5) log in attempts. Contact your adviser for recovery", "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Warning); 
            else
            {
                MessageBox.Show("User ID does not exist!", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                tbxUserId.Focus();
                tbxUserId.SelectAll();
            }
        }
    }
}
