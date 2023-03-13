using MaistrovaAkropol.Model;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MaistrovaAkropol.Pages
{
    /// <summary>
    /// Логика взаимодействия для Page1.xaml
    /// </summary>
    public partial class Page1 : Page
    {
        public Page1()
        {
            InitializeComponent();
            Connect.database = new AkropolMaistrovaEntities();
            DateGr1.ItemsSource = Connect.database.HousingStock.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (DP1.Text == "" || DP2.Text == "")
            {
                MessageBox.Show("Отсутствуют данные");
            }
            else
            {
                DateTime datestart, DataEND;
                datestart = Convert.ToDateTime(DP1.DisplayDate);
                DataEND = Convert.ToDateTime(DP2.DisplayDate);

                var Cola = Connect.database.HousingStock.Where(q => q.YearConstruction >= datestart && q.YearConstruction <= DataEND);
                var Cola2 = Connect.database.HousingStock.Where(q => q.YearConstruction >= datestart && q.YearConstruction <= DataEND).Sum(w => w.SummaObjectCadastre);

                DateGr1.ItemsSource = Cola.ToList();
                TB1.Text = Cola2.ToString();
            }   
        }
    }
}
