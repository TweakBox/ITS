using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace JSLA.Administrator
{
    public partial class Dashboard : Form
    {
        private Database _db;
        private string _id;
        private Classess.AccountInfo _accountInfo;

        private bool _isSideDrawerCollapsed = true;
        private Actions _action = Actions.Announcements;
        private Button[] _actionButtons;

        public enum Actions { Announcements, FileManager, AccountManager}

        public Dashboard(Database db, string id)
        {
            InitializeComponent();
            
            _db = db;
            _id = id;

            _actionButtons = new Button[]{ btnAnnouncements, btnSubjects };
        }

        private void Dashboard_Load(object sender, EventArgs e)
        {
            //fetchUserInfo();

            //lblFullname.Text = _accountInfo.Lastname + ", " + _accountInfo.Firstname + ' ' + _accountInfo.Middlename[0] + '.';
            lblUserid.Text = _id;
            
            actions_Click(btnAnnouncements, EventArgs.Empty);
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private Classess.AccountInfo fetchUserInfo()
        {
            object[,] result = _db.ScanRecords("tbl_student", new string[] { "LastName", "FirstName", "MiddleName", "Avatar" }, "Stud_ID = '" + _id + '\'');
            return _accountInfo = new Classess.AccountInfo(
                _id,
                result[0, 0].ToString(),
                result[0, 1].ToString(),
                result[0, 2].ToString(),
                Classess.AccountInfo.AccountTypeEnum.Student,
                null//result[0, 3]
                );
        }

        private void btnTogglesidedrawer_Click(object sender, EventArgs e)
        {
            if (_isSideDrawerCollapsed)
                expandSidedrawer();
            else
                collapseSidedrawer();
        }

        private void expandSidedrawer()
        {
            pnlSidedrawer.Visible = true;
            _isSideDrawerCollapsed = false;
        }

        private void collapseSidedrawer()
        {
            pnlSidedrawer.Visible = false;
            _isSideDrawerCollapsed = true;
        }

        private void actions_Click(object sender, EventArgs e)
        {
            Button action = (Button)sender;

            switch (action.Tag.ToString())
            {
                case "Announcements":
                    _action = Actions.Announcements;
                    break;
                case "File Manager":
                    //_action = Actions.Announcements;
                    break;
                case "Account Manager":
                    _action = Actions.AccountManager;
                    break;
            }

            setWorkspace(_action);
            foreach (var item in _actionButtons)
                item.BackColor = Color.White;

            action.BackColor = Color.Gainsboro;
            collapseSidedrawer();
        }

        private void setWorkspace(Actions action)
        {
            Form f = new Form();
            switch (action)
            {
                case Actions.Announcements:
                    f = new Announcements(_db);
                    break; 
                case Actions.FileManager:
                    //f = new Announcements();
                    break;
                case Actions.AccountManager:
                    f = new StudentManager(_db);
                    break;
            }
            f.TopLevel = false;
            pnlContent.Controls.Clear();
            pnlContent.Controls.Add(f);
            f.Show();
            f.Dock = DockStyle.Fill;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            lblDateTime.Text = DateTime.Now.ToLongDateString() + ' ' + DateTime.Now.ToLongTimeString();
        }
    }
}
