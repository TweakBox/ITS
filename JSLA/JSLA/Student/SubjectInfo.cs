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

        private void btnBack_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void SubjectInfo_Load(object sender, EventArgs e)
        {
            lblTitle.Text = _db.ScanRecordScalar("tbl_subject", "Subject_Name", "Subject_Id = '" + _subjectId.ToString() + '\'');
        }

        private void fetchHomeworks()
        {
            string section = _db.ScanRecordScalar("tbl_student", "Section_Id", "Stud_Id = '" + _account.UserId + '\'');
            string[,] results = _db.ScanRecords("tbl_homework", new string[] { "Title", "Content", "DateDue" }, "Subject_Id = '" + _subjectId + "' and Section_Id = '" + section + '\'');

            for (int i = 0; i < 3 && i < results.GetLength(0); i++)
            {

            }
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
    }
}
