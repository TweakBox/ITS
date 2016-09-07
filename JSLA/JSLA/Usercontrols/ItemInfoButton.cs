using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JSLA.Usercontrols
{
    public partial class ItemInfoButton : UserControl
    {
        public string Title
        {
            get { return lblTitle.Text; }
            set { lblTitle.Text = value; }
        }

        public string Subtitle
        {
            get { return lblTitle.Text; }
            set { lblTitle.Text = value; }
        }

        public string Description
        {
            get { return lblTitle.Text; }
            set { lblTitle.Text = value; }
        }

        public ItemInfoButton()
        {
            InitializeComponent();

            lblTitle.Width = Width - lblSubtitle.Width + 6;
        }
    }
}
