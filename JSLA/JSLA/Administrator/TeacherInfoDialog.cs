using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JSLA.Administrator
{
    public partial class TeacherInfoDialog : Form
    {
        private Database _db;
        private DialogType _type;
        private string _filepath;

        public enum DialogType { Add, Edit }
        public TeacherInfoDialog(Database db, DialogType dt, string[] values)
        {
            InitializeComponent();

            _db = db;

            switch (_type = dt)
            {
                case DialogType.Add:
                    generateTeacherId();

                    cbxStatus.SelectedItem = "Active";
                    cbxStatus.Enabled = false;
                    break;
                case DialogType.Edit:
                    tbxID.ReadOnly = false;
                    tbxID.Text = values[0];
                    tbxID.ReadOnly = true;
                    tbxLastname.Text = values[1];
                    tbxFirstname.Text = values[2];
                    tbxMiddlename.Text = values[3];
                    cbxGender.SelectedItem = values[4];
                    cbxStatus.SelectedItem = values[5];

                    object[,] result = _db.ScanRecords("tbl_studentinfo", new string[] { "Avatar" }, "_id = '" + values[0] + '\'');
                    if (result[0, 0].ToString() != "")
                        pbxAvatar.Image = Image.FromStream(new MemoryStream((byte[])result[0, 0]));
                    else
                        pbxAvatar.Image = null;

                    break;
            }
        }

        private void generateTeacherId()
        {
            object[,] result = _db.ScanRecords("tbl_studentinfo", "_id");
            Random r = new Random();
            int id = r.Next(0, 499999999);

            for (int i = 0; i < result.GetLength(0); i++)
                if (result[i, 0].ToString() == id.ToString("D10"))
                {
                    i = -1;
                    id = r.Next(0, 499999999);
                }

            tbxID.Text = "0" + id.ToString("D10");
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnConfirm_Click(object sender, EventArgs e)
        {
            if (_type == DialogType.Add)
            {
                Random r = new Random();
                //byte[] data = File.ReadAllBytes(_filepath);
                MemoryStream ms = new MemoryStream();
                pbxAvatar.Image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                byte[] data = ms.ToArray();

                _db.Command.CommandText = "insert into tbl_teacherinfo values('" +
                    tbxID.Text + "', '" +
                    tbxLastname.Text + "', '" +
                    tbxFirstname.Text + "', '" +
                    tbxMiddlename.Text + "', '" +
                    cbxGender.Text + "', '" +
                    cbxStatus.Text + "', ?data)";

                MySql.Data.MySqlClient.MySqlParameter dataparam = new MySql.Data.MySqlClient.MySqlParameter("?data", MySql.Data.MySqlClient.MySqlDbType.Blob, data.Length);
                dataparam.Value = data;
                _db.Command.Parameters.Add(dataparam);
                _db.Command.ExecuteNonQuery();

                _db.InsertRecord("tbl_accounts",
                    tbxID.Text,
                    r.Next(100000, 999999).ToString(),
                    "Student",
                    "0",
                    tbxID.Text,
                    "true"
                    );

                lblMessage.Visible = true;
                timer1.Start();
                resetText();
            }
        }

        private void resetText()
        {
            generateTeacherId();

            tbxLastname.ResetText();
            tbxFirstname.ResetText();
            tbxMiddlename.ResetText();
            cbxGender.SelectedItem = "";

            cbxStatus.SelectedItem = "Active";

            pbxAvatar.Image = null;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
            timer1.Stop();
        }

        private void btnChoose_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            if (openFileDialog1.FileName.Length > 0)
            {
                pbxAvatar.Image = Image.FromFile(openFileDialog1.FileName);
                _filepath = openFileDialog1.FileName;
                openFileDialog1.FileName = "";
            }
        }
    }
}
