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
        private int _id;

        public SubjectInfo(Database db, int subjectId)
        {
            InitializeComponent();

            _db = db;
            _id = subjectId;
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void SubjectInfo_Load(object sender, EventArgs e)
        {
            lblTitle.Text = _db.ScanRecordScalar("tbl_subject", "Subject_Name", "Subject_Id = '" + _id.ToString() + '\'');
        }

        private void fetchHomeworks()
        {

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
