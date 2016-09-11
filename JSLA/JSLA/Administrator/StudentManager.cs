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

        private List<ListViewItem> _items = new List<ListViewItem>();

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
            filterItems();
        }

        private void fetchItems()
        {
            object[,] results = _db.ExecuteQuery("select _id, LastName, FirstName, MiddleName, Gender, GLastname, GFirstname, GMiddlename, GContact, Status from tbl_studentinfo");

            _items.Clear();
            for (int i = 0; i < results.GetLength(0); i++)
            {
                ListViewItem item = new ListViewItem(results[i, 0].ToString());
                for (int i2 = 1; i2 < results.GetLength(1); i2++)
                    item.SubItems.Add(results[i, i2] != null ? results[i, i2].ToString() : "");

                _items.Add(item);
            }
            tbxSearch.Text = "";
            filterItems();
        }

        private void tbxSearch_TextChanged(object sender, EventArgs e)
        {
            filterItems();
        }

        private void filterItems()
        {
            lvwStudents.Items.Clear();

            for (int i = 0; i < _items.Count; i++)
                for (int i2 = 0; i2 < _items[i].SubItems.Count; i2++)
                    if (_items[i].SubItems[i2].Text.ToLower().Contains(tbxSearch.Text.ToLower()))
                    {
                        lvwStudents.Items.Add(_items[i]);
                        break;
                    }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            StudentInfoDialog sid = new StudentInfoDialog(_db, StudentInfoDialog.DialogType.Add, new string[0])
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
            string[] values = new string[10];
            ListViewItem item = lvwStudents.SelectedItems[0];
            for (int i = 0; i < item.SubItems.Count; i++)
                values[i] = item.SubItems[i].Text;

            StudentInfoDialog sid = new StudentInfoDialog(_db, StudentInfoDialog.DialogType.Edit, values)
            {
                TopLevel = false,
                Dock = DockStyle.Fill
            };
            sid.FormClosed += childForm_Closed;
            Hide();
            Parent.Controls.Add(sid);
            sid.Show();
        }

        private void btnRemove_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Are you sure you want to remove this account?", "Warning!", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == DialogResult.Yes)
                _db.UpdateRecord("tbl_studentinfo", "_id", lvwStudents.SelectedItems[0].Text, new string[] { "Status" }, new string[] { "Inactive" });
            fetchItems();
        }

        private void btnReset_Click(object sender, EventArgs e) 
        {
            DialogResult result = MessageBox.Show("Are you sure you want to reset this account's password?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == DialogResult.Yes)
            {
                Random r = new Random();
                _db.UpdateRecord("tbl_studentinfo", "_id", lvwStudents.SelectedItems[0].Text, new string[] { "password", "attempts" }, new string[] { r.Next(100000, 999999).ToString(), "0" });
            }
        }

        private void childForm_Closed(object sender, EventArgs e)
        {
            Show();
        }

        private void lvwStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lvwStudents.SelectedItems.Count > 0)
            {
                btnReset.Enabled = true;
                btnEdit.Enabled = true;
                btnRemove.Enabled = true;
            }
            else
            {
                btnReset.Enabled = false;
                btnEdit.Enabled = false;
                btnRemove.Enabled = false;
            }
        }
    }
}
