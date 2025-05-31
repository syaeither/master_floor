using Npgsql;
using System;
using System.Data;
using System.Windows.Forms;

namespace master_floor
{
    public partial class EditForm : Form
    {
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=1234;Database=master_floor";
        private long partnerId;

        public EditForm(long id)
        {
            InitializeComponent();
            partnerId = id;
            LoadPartnerData();
            LoadSalesHistory();
        }

        private void LoadSalesHistory()
        {
            using (var conn = new NpgsqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = @"
                SELECT p.name AS ""Наименование продукта"", 
                       sh.quantity AS ""Количество проданного товара"", 
                       sh.sale_date AS ""Дата продажи""
                FROM sales_history sh
                JOIN products p ON p.id_product = sh.product_code
                JOIN partners pa ON pa.id_partner = sh.partner_code
                WHERE sh.partner_code = @partnerId";

                    using (var cmd = new NpgsqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@partnerId", partnerId);
                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                DataTable dt = new DataTable();
                                dt.Load(reader);
                                dataGridView1.DataSource = dt;
                                dataGridView1.AllowUserToAddRows = false;
                            }                            
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при загрузке истории продаж: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
        private void LoadPartnerData()
        {
            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT * FROM partners WHERE id_partner = @id";
                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", partnerId);
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtType.Text = reader["type"].ToString();
                            txtName.Text = reader["name_company"].ToString();
                            txtAddress.Text = reader["legal_address"].ToString();
                            txtmaskedINN.Text = reader["inn"].ToString();
                            txtDirector.Text = reader["director_name"].ToString();
                            txtmaskedPhone.Text = reader["telephone"].ToString();
                            txtEmail.Text = reader["email"].ToString();
                            numericUpDown1.Value = Convert.ToInt32(reader["rating"]);
                            txtSalesPlaces.Text = reader["sales_places"].ToString();                         
                        }
                    }
                }
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //кнопка изменить
            try
            {
                using (var conn = new NpgsqlConnection(connectionString))
                using (var cmd = new NpgsqlCommand(
                    "UPDATE partners SET type=@t, name_company=@n, legal_address=@a, inn=@i, director_name=@d, " +
                    "telephone=@p, email=@e, rating=@r, sales_places=@s WHERE id_partner=@id", conn))
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@t", txtType.Text);
                    cmd.Parameters.AddWithValue("@n", txtName.Text);
                    cmd.Parameters.AddWithValue("@a", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@i", txtmaskedINN.Text);
                    cmd.Parameters.AddWithValue("@d", txtDirector.Text);
                    cmd.Parameters.AddWithValue("@p", txtmaskedPhone.Text);
                    cmd.Parameters.AddWithValue("@e", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@r", (int)numericUpDown1.Value);
                    cmd.Parameters.AddWithValue("@s", txtSalesPlaces.Text);
                    cmd.Parameters.AddWithValue("@id", partnerId);

                    cmd.ExecuteNonQuery();
                }
                MessageBox.Show("Данные изменены успешно!");
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //кнопка удалить
            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();
                string query = "DELETE FROM partners WHERE id_partner=@id";
                using (var cmd = new NpgsqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", partnerId);
                    cmd.ExecuteNonQuery();
                }
            }
            MessageBox.Show("Данные удалены успешно!");
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //кнопка отмена
            this.Close();
        }

        private void EditForm_Load(object sender, EventArgs e)
        {
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }
    }
}
