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
    public partial class StudentInfoDialog : Form
    {
        private Database _db;

        public enum DialogType { Add, Edit }

        public StudentInfoDialog(Database db, DialogType dt)
        {
            InitializeComponent();

            _db = db;

            switch (dt)
            {
                case DialogType.Add:

                    break;
                case DialogType.Edit:
                    break;
            }
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void tbxContact_TextChanged(object sender, EventArgs e)
        {
            for (int i = 0; i < tbxContact.TextLength; i++)
                if (!"1234567890".Contains(tbxContact.Text[i]))
                {
                    tbxContact.Text = tbxContact.Text.Remove(i, 1);
                    tbxContact.Select(tbxContact.TextLength, 0);
                }
        }
    }
}
