using Npgsql;
using System;
using System.Windows.Forms;

namespace master_floor
{
    public partial class PartnerForm : Form
    {
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=1234;Database=master_floor";

        public PartnerForm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (var conn = new NpgsqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO partners (type, name_company, legal_address, inn, director_name, telephone, email, rating, sales_places, logo) " +
                                 "VALUES (@type, @name, @address, @inn, @director, @phone, @email, @rating, @sales, @logo)";

                    using (var cmd = new NpgsqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@type", txtType.Text);
                        cmd.Parameters.AddWithValue("@name", txtName.Text);
                        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@inn", txtmaskedINN.Text);
                        cmd.Parameters.AddWithValue("@director", txtDirector.Text);
                        cmd.Parameters.AddWithValue("@phone", txtmaskedPhone.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@rating", (int)numericUpDown1.Value);
                        cmd.Parameters.AddWithValue("@sales", txtSalesPlaces.Text);

                        cmd.ExecuteNonQuery();
                    }
                }
                MessageBox.Show("Данные добавлены успешно!");
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}