using MaistrovaAkropol.Class;
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
    /// <summary>
    /// Логика взаимодействия для SalesManagerWindow.xaml
    /// </summary>
    public partial class SalesManagerWindow : Window
    {
        public SalesManagerWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            FrameClass.FrameSales = FrameSalesMain;
            FrameClass.FrameSales.Navigate(new Pages.Page3());
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            FrameClass.FrameSales = FrameSalesMain;
            FrameClass.FrameSales.Navigate(new Pages.Page4());
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            WindowАuthorization windowАuthorization = new WindowАuthorization();
            windowАuthorization.Show();
            this.Close();
        }
    }
}
