using System;
using System.Windows.Forms;
using Npgsql;

namespace master_floor
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (var conn = new NpgsqlConnection("Host=localhost;Port=5432;Username=postgres;Password=1234;Database=master_floor"))
            {
                conn.Open();
                var cmd = new NpgsqlCommand("Select 1 from employees where login = @Username AND password = @Password", conn);
                cmd.Parameters.AddWithValue("@Username", textBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", textBox2.Text.Trim());
                if (cmd.ExecuteScalar() != null) { new Form2().Show(); this.Hide(); }
                else MessageBox.Show("Ошибка входа");
            }
        }
    }
}
