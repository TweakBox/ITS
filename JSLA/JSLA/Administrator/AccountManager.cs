﻿using System;
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
    public partial class AccountManager : Form
    {
        private Database _db;

        public AccountManager(Database db)
        {
            InitializeComponent();

            _db = db;
        }

        private void btManageStudent_Click(object sender, EventArgs e)
        {
            StudentManager sm = new StudentManager(_db)
            {
                TopLevel = false,
                Dock = DockStyle.Fill
            };
            sm.FormClosed += childForm_Closed;
            Hide();
            Parent.Controls.Add(sm);
            sm.Show();
        }

        private void childForm_Closed(object sender, EventArgs e)
        {
            Show();
        }
    }
}