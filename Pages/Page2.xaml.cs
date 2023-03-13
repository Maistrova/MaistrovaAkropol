using MaistrovaAkropol.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
    /// Логика взаимодействия для Page2.xaml
    /// </summary>
    public partial class Page2 : Page
    {
        public Page2()
        {
            InitializeComponent();
            Connect.database = new AkropolMaistrovaEntities();
            DateGr1.ItemsSource = Connect.database.HousingStock.ToList();
        }

        private void BT1_Click(object sender, RoutedEventArgs e)
        {
            if (TB1.Text != "")
            {
                HousingStock elka = (HousingStock)DateGr1.SelectedItem;
                if (elka != null)
                {
                    var edit = new HousingStock()
                    {
                        ID = elka.ID,
                        FloorsBuilding = elka.FloorsBuilding,
                        OccupiedFloor = elka.OccupiedFloor,
                        YearConstruction = elka.YearConstruction,
                        IDLocation = elka.IDLocation,
                        NumberRooms = elka.NumberRooms,
                        IDNumberBathrooms = elka.IDNumberBathrooms,
                        Conditioners = elka.Conditioners,
                        SummaObjectCadastre = elka.SummaObjectCadastre,
                        MarketValueObject = elka.MarketValueObject,
                        RentalCost = Convert.ToDecimal(TB1.Text),
                        IDRentalBuildings = elka.IDRentalBuildings,
                        Adress = elka.Adress
                    };
                    try
                    {
                        Connect.database.HousingStock.AddOrUpdate(edit);
                        Connect.database.SaveChanges();
                        MessageBox.Show("Готово");
                    }
                    catch(Exception x)
                    {
                        MessageBox.Show(x.Message.ToString());
                    }
                }
                else
                {
                    MessageBox.Show("Выберите здание");
                }
            }
            else
            {
                MessageBox.Show("Введите число");
            }
        }
    }
}
