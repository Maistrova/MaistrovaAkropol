using MaistrovaAkropol.Class;
using MaistrovaAkropol.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MaistrovaAkropol.Windows
{
    public partial class RentalManagerWindow : Window
    {
        public RentalManagerWindow()
        {
            InitializeComponent();
        }

        private void rty_Click(object sender, RoutedEventArgs e)
        {
            FrameClass.FrameRental = FrameRentalMain;
            FrameClass.FrameRental.Navigate(new Page1());
        }

        private void jui_Click(object sender, RoutedEventArgs e)
        {
            FrameClass.FrameRental = FrameRentalMain;
            FrameClass.FrameRental.Navigate(new Page2());
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            WindowАuthorization windowАuthorization = new WindowАuthorization();
            windowАuthorization.Show();
            this.Close();
        }
    }
}
