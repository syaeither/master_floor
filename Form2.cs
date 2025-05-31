using Npgsql;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;

namespace master_floor
{
    public partial class Form2 : Form
    {
        private long selectedPartnerId = 0;
        private Dictionary<long, string> partners = new Dictionary<long, string>();
        private string connectionString = "Host=localhost;Port=5432;Username=postgres;Password=1234;Database=master_floor";
        public Form2()
        {
            InitializeComponent();
            LoadPartners();
        }

        private void LoadPartners(string search = "")
        {
            panel1.Controls.Clear();

            using (var conn = new NpgsqlConnection(connectionString))
            using (var cmd = new NpgsqlCommand(
                "SELECT id_partner, type, name_company, director_name, telephone, rating FROM partners" +
                (string.IsNullOrEmpty(search) ? "" : " WHERE name_company ILIKE @search"), conn))
            {
                if (!string.IsNullOrEmpty(search))
                    cmd.Parameters.AddWithValue("@search", $"%{search}%");

                conn.Open();
                using (var reader = cmd.ExecuteReader())
                {
                    int y = 10;
                    while (reader.Read())
                    {
                        long partnerId = Convert.ToInt64(reader["id_partner"]);
                        partners[partnerId] = $"{reader["type"]} | {reader["name_company"]}";

                        var panel = new Panel
                        {
                            Size = new Size(panel1.Width - 30, 100),
                            Location = new Point(10, y),
                            BorderStyle = BorderStyle.FixedSingle,
                            Tag = partnerId
                        };

                        panel.Controls.Add(new Label
                        {
                            Text = partners[partnerId],
                            Font = new Font("Segoe UI", 12, FontStyle.Bold),
                            Location = new Point(10, 5),
                            AutoSize = true
                        });

                        panel.Controls.Add(new Label
                        {
                            Text = $"{reader["director_name"]}\n{reader["telephone"]}\nРейтинг: {reader["rating"]}",
                            Location = new Point(10, 30),
                            AutoSize = true
                        });

                        panel.Controls.Add(new Label
                        {
                            Text = $"{GetDiscount(partnerId)}%",
                            Font = new Font("Segoe UI", 12, FontStyle.Bold),
                            Location = new Point(panel.Width - 50, 5),
                            AutoSize = true
                        });

                        panel.Click += (s, e) =>
                        {
                            selectedPartnerId = partnerId;
                            var editForm = new EditForm(selectedPartnerId);
                            if (editForm.ShowDialog() == DialogResult.OK)
                                LoadPartners(search);
                        };

                        panel1.Controls.Add(panel);
                        y += 110;
                    }
                }
            }
        }

        private int GetDiscount(long partnerId)
        {
            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();
                var cmd = new NpgsqlCommand("SELECT SUM(quantity) FROM sales_history WHERE partner_code = @partnerId", conn);
                cmd.Parameters.AddWithValue("@partnerId", partnerId);
                object result = cmd.ExecuteScalar();
                int totalSales = result != DBNull.Value ? Convert.ToInt32(result) : 0;

                if (totalSales < 10000) return 0;
                if (totalSales < 50000) return 5;
                if (totalSales < 300000) return 10;
                return 15;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //назад
            Form1 form2 = new Form1();
            form2.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //поиск
            LoadPartners(textBox1.Text);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //добавления
            PartnerForm addForm = new PartnerForm();
            addForm.ShowDialog();
            LoadPartners();
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            Form1 form2= new Form1();
            form2.Show();
            this.Hide();
        }
    }
}
