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
    public partial class Page3 : Page
    {
        public Page3()
        {
            InitializeComponent();
            Connect.database = new AkropolMaistrovaEntities();
            LocationCB.ItemsSource = Connect.database.Location.ToList();
            TipKomCB.ItemsSource = Connect.database.Bathrooms.ToList();
        }


        private void AddBtn_Click(object sender, RoutedEventArgs e)
        { 
            GetCheck();
        }

        public void GetClear() // Метод очистки
        {
            TB1.Text = ""; TB2.Text = ""; TB3.Text = ""; TB4.Text = "";
            TB5.Text = ""; TB6.Text = ""; TB7.Text = ""; TB8.Text = "";
            LocationCB.Text = ""; TipKomCB.Text = ""; TB9.Text = "";
        }

        public void GetCheck() // Метод провери полей на пустоту
        {
            if (TB1.Text == "" || TB2.Text == "" || TB3.Text == "" || TB4.Text == "" ||
                TB5.Text == "" || TB6.Text == "" || TB7.Text == "" || TB8.Text == "" ||
                LocationCB.Text == "" || TipKomCB.Text == ""|| TB9.Text =="")
            {
                MessageBox.Show("Поля пустые", "Ошибка бобавления");
            }
            else
            {
                GetAddInformation();
            }
        }

        public void GetAddInformation() // Метод добавления данных в БД
        {
            int q, w;
            decimal z, x, c;
            DateTime dateTime = Convert.ToDateTime(TB3.Text);

            z = Convert.ToDecimal(TB5.Text);
            x = Convert.ToDecimal(TB6.Text);
            c = Convert.ToDecimal(TB7.Text);
            
            q = Convert.ToInt32(TB2.Text);
            w = Convert.ToInt32(TB4.Text);

            HousingStock housingStock = new HousingStock()
            {
                FloorsBuilding = TB1.Text,
                OccupiedFloor = q,
                YearConstruction = dateTime,
                Location = LocationCB.SelectedItem as Location,
                NumberRooms = w,
                Bathrooms = TipKomCB.SelectedItem as Bathrooms,
                Conditioners = CondCB.IsEnabled,
                SummaObjectCadastre = z,
                MarketValueObject = x,
                RentalCost = c,
                IDRentalBuildings = 1,
                Adress = TB9.Text
            };

            try
            {
                Connect.database.HousingStock.Add(housingStock);
                Connect.database.SaveChanges();
                MessageBox.Show("Данные успешно сохранены", "Уведомление");
                GetClear();
            }
            catch (Exception EX)
            {
                MessageBox.Show(EX.Message.ToString(), "Ошибка добавления");
            }
        }
    }
}
