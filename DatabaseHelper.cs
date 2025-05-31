using master_floor;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;

public class DatabaseHelper
{
    private const string ConnectionString = "Host=localhost;Username=postgres;Password=yourpassword;Database=yourdb";

    public static List<Partner> GetPartners(string search = "")
    {
        List<Partner> partners = new List<Partner>();

        using (var conn = new NpgsqlConnection(ConnectionString))
        {
            conn.Open();
            string query = "SELECT id_partner, type, name_company, director_name, telephone, rating, discount, logo FROM partners";
            if (!string.IsNullOrEmpty(search))
            {
                query += " WHERE name_company ILIKE @search";
            }

            using (var cmd = new NpgsqlCommand(query, conn))
            {
                if (!string.IsNullOrEmpty(search))
                    cmd.Parameters.AddWithValue("@search", $"%{search}%");

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        partners.Add(new Partner
                        {
                            Id = reader.GetInt64(0),
                            Type = reader.GetString(1),
                            Name = reader.GetString(2),
                            Director = reader.GetString(3),
                            Phone = reader.GetString(4),
                            Rating = reader.GetInt32(5),
                            Discount = reader.GetDecimal(6),
                            Logo = reader.IsDBNull(7) ? null : ImageFromByteArray((byte[])reader[7])
                        });
                    }
                }
            }
        }
        return partners;
    }

    public static Image ImageFromByteArray(byte[] byteArray)
    {
        if (byteArray == null) return null;
        using (MemoryStream ms = new MemoryStream(byteArray))
        {
            return Image.FromStream(ms);
        }
    }
}