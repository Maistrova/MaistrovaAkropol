using MaistrovaAkropol.Class;
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
using System.Windows.Shapes;

namespace MaistrovaAkropol.Windows
{
    public partial class WindowАuthorization : Window
    {
        public WindowАuthorization()
        {
            InitializeComponent();
            Connect.database = new AkropolMaistrovaEntities();
        }

        private void OpenWindow()
        {
            RentalManagerWindow rentalManagerWindow = new RentalManagerWindow();
            rentalManagerWindow.Show();
            this.Close();
        }
        private void OpenWindow2()
        {
            SalesManagerWindow salesManagerWindow = new SalesManagerWindow();
            salesManagerWindow.Show();
            this.Close();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (LoginTB.Text == "" || PasswordPB.Password == "")
            {
                MessageBox.Show("Поле Логин или Пароль пустое", "Пустота", MessageBoxButton.OK, MessageBoxImage.Information);
            }

            else
            {
                try
                {
                    var user = Connect.database.Manager.FirstOrDefault(
                        data => data.Login == LoginTB.Text &&
                        data.Password == PasswordPB.Password);
                    if (user == null)
                    {
                        MessageBox.Show("Неправильный Логин или Пароль", "Ошибка авторизации", MessageBoxButton.OK, MessageBoxImage.Information);
                    }

                    else
                    {
                        switch (user.IDRole)
                        {
                            case 1://Аренда
                                OpenWindow();
                                break;

                            case 2://Продажа
                                OpenWindow2();
                                break;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка Exception", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
