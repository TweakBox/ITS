using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JSLA.Student
{
    public partial class SubjectInfo : Form
    {
        private Database _db;
        private Classess.AccountInfo _account;
        private int _subjectId;

        public SubjectInfo(Database db, Classess.AccountInfo account, int subjectId)
        {
            InitializeComponent();

            _db = db;
            _account = account;
            _subjectId = subjectId;
        }

        private void SubjectInfo_Load(object sender, EventArgs e)
        {
            lblTitle.Text = _db.ScanRecordScalar("tbl_subject", "Subject_Name", "Subject_Id = '" + _subjectId.ToString() + '\'');
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void SubjectInfo_Shown(object sender, EventArgs e)
        {
            fetchHomeworks();
        }

        private void fetchHomeworks()
        {
            string section = _db.ScanRecordScalar("tbl_student", "Section_Id", "Stud_Id = '" + _account.UserId + '\'');
            object[,] results = _db.ScanRecords("tbl_homework", new string[] { "Title", "DateDue", "Content", "Homework_Id" }, "Subject_Id = '" + _subjectId + "' and Section_Id = '" + section + "' and DateDue > '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + '\'');

            flpHomeworks.Controls.Clear();
            if (results.GetLength(0) > 0)
            {
                for (int i = 0; i < results.GetLength(0); i++)
                {
                    Usercontrols.ItemInfoButton iib = new Usercontrols.ItemInfoButton()
                    {
                        Title = results[i, 0].ToString(),
                        Subtitle = "Due: " + DateTime.Parse(results[i, 1].ToString()).ToLongDateString(),
                        Description = results[i, 2].ToString(),
                        Tag = results[i, 3],
                        Width = flpHomeworks.Width
                    };
                    iib.Click += Iib_Click;
                    flpHomeworks.Controls.Add(iib);
                }
            }
            else
                flpHomeworks.Controls.Add(new Label() {
                    Font = new Font(this.Font, FontStyle.Italic),
                    Text = "No homeworks! Yey! :D",
                    TextAlign = ContentAlignment.MiddleCenter,
                    Height = flpHomeworks.Height - 15,
                    Width = flpHomeworks.Width - 15
                });
        }

        private void Iib_Click(object sender, EventArgs e)
        {
            Control control = (Control)sender;
            HomeworkInfo hi = new HomeworkInfo(_db, control.Tag.ToString());
            
            hi.ShowDialog();
        }

        private void fetchNotes()
        {

        }

        private void fetchQuizzes()
        {

        }

        private void fetchDistributables()
        {

        }

        private void Containers_ControlAdded(object sender, ControlEventArgs e)
        {
            ScrollableControl container = (ScrollableControl)sender;
            foreach (Control item in container.Controls)
                item.Width = !container.VerticalScroll.Visible ? container.Width - 6 : container.Width - 23;
        }
    }
}
