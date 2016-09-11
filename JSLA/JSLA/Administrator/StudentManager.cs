using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JSLA.Administrator
{
    public partial class StudentManager : Form
    {
        private Database _db;

        private List<ListViewItem> items = new List<ListViewItem>();

        public StudentManager(Database db)
        {
            InitializeComponent();

            _db = db;
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void StudentManager_Load(object sender, EventArgs e)
        {
            fetchItems();
        }

        private void fetchItems()
        {
            //string[] columns = new string[]
            //{
            //    "_ID", "LastName", "FirstName", "MiddleName", "Gender", "GuardianLN", "GuardianFN", "GuardianMN", "GuardianContact"
            //};
            //string[,] results = _db.ScanRecords("tbl_studentinfo", columns);

            //items.Clear();
            //for (int i = 0; i < results.GetLength(0); i++)
            //{
            //    ListViewItem item = new ListViewItem();
            //    for (int i2 = 0; i2 < results.GetLength(1); i2++)
            //        item.SubItems.Add(results[i, i2]);

            //    items.Add(item);
            //}
        }

        private void tbxSearch_TextChanged(object sender, EventArgs e)
        {
            filterItems();
        }

        private void filterItems()
        {
            lvwStudents.Items.Clear();

            for (int i = 0; i < items.Count; i++)
                for (int i2 = 0; i2 < items[i].SubItems.Count; i2++)
                    if (items[i].SubItems[i2].Text.ToLower().Contains(tbxSearch.Text.ToLower()))
                    {
                        lvwStudents.Items.Add(items[i]);
                        break;
                    }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            StudentInfoDialog sid = new StudentInfoDialog(_db, StudentInfoDialog.DialogType.Add)
            {
                TopLevel = false,
                Dock = DockStyle.Fill
            };
            sid.FormClosed += childForm_Closed;
            Hide();
            Parent.Controls.Add(sid);
            sid.Show();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {

        }

        private void btnRemove_Click(object sender, EventArgs e)
        {

        }

        private void btnReset_Click(object sender, EventArgs e)
        {

        }

        private void childForm_Closed(object sender, EventArgs e)
        {
            Show();
        }
    }
}
