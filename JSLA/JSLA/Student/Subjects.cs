using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using JSLA.Classess;

namespace JSLA.Student
{
    public partial class Subjects : Form
    {
        private AccountInfo _account;
        private Database _db;

        public Subjects(AccountInfo accountinfo, Database db)
        {
            InitializeComponent();
            _account = accountinfo;
            _db = db;
        }

        private void Subjects_Load(object sender, EventArgs e)
        {
            //homeworks
            //...

            string[,] result = _db.ScanRecords("tbl_subject", "Subject_ID", "Subject_Name");
            for (int i = 0; i < result.GetLength(0); i++)
            {
                Random r = new Random();
                Color c = Color.FromArgb(r.Next(75, 125), r.Next(75, 125), 175);

                Usercontrols.PictureButton pb = new Usercontrols.PictureButton()
                {
                    Tag = result[i, 0],
                    Title = result[i, 1],
                    Count = r.Next(5),
                    BackColor = c,
                    ForeColor = Color.White
                };
                pb.Click += Pb_Click;

                flpGallery.Controls.Add(pb);
            }
            flpGallery.VerticalScroll.Maximum += 135;
        }

        private void Pb_Click(object sender, EventArgs e)
        {
            Control c = (Control)sender;
            SubjectInfo si = new SubjectInfo(_db, _account, int.Parse(c.Tag.ToString()));
            si.FormClosed += child_FormClosed;

            si.Dock = DockStyle.Fill;
            si.TopLevel = false;
            Parent.Controls.Add(si);
            Hide();
            si.Show();
        }

        private void child_FormClosed(object sender, FormClosedEventArgs e)
        {
            Show();
        }
    }
}
