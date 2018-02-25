using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Threading;
using System.Configuration;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Net;

namespace Automail
{
    public partial class Service1 : ServiceBase
    {
        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            this.WriteToFile("Simple Service started {0}");
            this.ScheduleService();
        }

        protected override void OnStop()
        {
            this.WriteToFile("Simple Service stopped {0}");
            
            this.schedular_spbe.Dispose();
            this.schedular_agen.Dispose();
            this.schedular_bkl.Dispose();
        }

        private Timer schedular_spbe;
        private Timer schedular_agen;
        private Timer schedular_bkl;

        public void ScheduleService()
        {
            try
            {
                schedular_spbe = new Timer(new TimerCallback(SchedularCallback));
                schedular_agen = new Timer(new TimerCallback(SchedularCallback1));
                schedular_bkl = new Timer(new TimerCallback(SchedularCallback2));

                string mode = ConfigurationManager.AppSettings["Mode"].ToUpper();
                this.WriteToFile("Simple Service Mode: " + mode + " {0}");

                //Set the Default Time.
                DateTime scheduledTime = DateTime.MinValue;

                if (mode == "DAILY")
                {
                    //Get the Scheduled Time from AppSettings.
                    scheduledTime = DateTime.Parse(System.Configuration.ConfigurationManager.AppSettings["ScheduledTime"]);
                    if (DateTime.Now > scheduledTime)
                    {
                        //If Scheduled Time is passed set Schedule for the next day.
                        scheduledTime = scheduledTime.AddDays(1);
                    }
                }

                if (mode.ToUpper() == "INTERVAL")
                {
                    //Get the Interval in Minutes from AppSettings.
                    int intervalMinutes = Convert.ToInt32(ConfigurationManager.AppSettings["IntervalMinutes"]);

                    //Set the Scheduled Time by adding the Interval to Current Time.
                    scheduledTime = DateTime.Now.AddMinutes(intervalMinutes);
                    if (DateTime.Now > scheduledTime)
                    {
                        //If Scheduled Time is passed set Schedule for the next Interval.
                        scheduledTime = scheduledTime.AddMinutes(intervalMinutes);
                    }
                }

                TimeSpan timeSpan = scheduledTime.Subtract(DateTime.Now);
                string schedule = string.Format("{0} day(s) {1} hour(s) {2} minute(s) {3} seconds(s)", timeSpan.Days, timeSpan.Hours, timeSpan.Minutes, timeSpan.Seconds);

                this.WriteToFile("Simple Service scheduled to run after: " + schedule + " {0}");

                //Get the difference in Minutes between the Scheduled and Current Time.
                int dueTime = Convert.ToInt32(timeSpan.TotalMilliseconds);

                //Change the Timer's Due Time.
                schedular_spbe.Change(dueTime, Timeout.Infinite);
                schedular_agen.Change(dueTime, Timeout.Infinite);
                schedular_bkl.Change(dueTime, Timeout.Infinite);
            }
            catch (Exception ex)
            {
                WriteToFile("Simple Service Error on: {0} " + ex.Message + ex.StackTrace);

                //Stop the Windows Service.
                using (System.ServiceProcess.ServiceController serviceController = new System.ServiceProcess.ServiceController("SimpleService"))
                {
                    serviceController.Stop();
                }
            }
        }

        private void SchedularCallback(object e)
        {
            try
            {
                DataTable dt = new DataTable();

                string query_spbe = "SELECT [spbe].*, [dokumen_spbe].* FROM [spbe] INNER JOIN [dokumen_spbe] ON [spbe].[id_vendor_spbe] = [dokumen_spbe].[id_vendor_spbe] WHERE [dokumen_spbe].[dif_dokumen_spbe] = [dokumen_spbe].[rem_dokumen_spbe] OR [dokumen_spbe].[dif_dokumen_spbe] = [dokumen_spbe].[rem_dokumen_spbe]/2 OR [dokumen_spbe].[dif_dokumen_spbe] = [dokumen_spbe].[rem_dokumen_spbe]/4 OR [dokumen_spbe].[dif_dokumen_spbe] <= 0";
                
                string constr = ConfigurationManager.ConnectionStrings["PlantCS"].ConnectionString;
                
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query_spbe))
                    {
                        cmd.Connection = con;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                        }
                    }
                }
                
                foreach (DataRow row in dt.Rows)
                {
                    string nama_spbe = row["nama_spbe"].ToString();
                    string email_spbe = row["email_spbe"].ToString();
                    string tipe_spbe = row["tipe_dokumen_spbe"].ToString();
                    string tgl_dok_spbe = row["exp_dokumen_spbe"].ToString();
                    int diffdate = (int)row["dif_dokumen_spbe"];
                    string docno_spbe = row["noreg_dokumen_spbe"].ToString();
                    string tlp_spbe = row["telp_spbe"].ToString();
                    string almt_spbe = row["alamat1_spbe"].ToString();
                    string footermsg = "-Pesan ini dikirim melalui sistem monitoring dokumen\nDomestic Gas Region V, PT. Pertamina (Persero)-";

                    WriteToFile("Trying to send email to: " + nama_spbe + " " + email_spbe);
                    
                    SmtpClient smtp = new SmtpClient();
                    System.Net.NetworkCredential credentials = new System.Net.NetworkCredential();

                    var client = new SmtpClient("smtp.gmail.com", 587)
                    {
                        Credentials = new NetworkCredential("<email>", "<password>"),
                        EnableSsl = true
                    };

                    if (diffdate <= 0)
                    {
                        client.Send("<email>", email_spbe, "[REMINDER] " + tipe_spbe + " No. " + docno_spbe + " Habis Masa Berlaku", "Yth. SPBE " + nama_spbe + "\n" + almt_spbe + "\nNo.Telp/Fax:" + tlp_spbe +"\n\nBersama ini kami sampaikan bahwa Dokumen " + tipe_spbe + " dengan Nomor " + docno_spbe + " telah habis masa belakunya pada " + tgl_dok_spbe + ". \nSehubungan dengan hal diatas, agar Saudara/i segera memperbaharui dokumen tersebut.\nDemikian disampaikan, atas perhatian dan kerjasamanya diucapkan terima kasih.\n\n\nSalam,\nDomestic Gas Region V\nPT. Pertamina (Persero)\n\n" + footermsg);
                        WriteToFile("Email sent successfully to: " + nama_spbe + " " + email_spbe);
                    }
                    else
                    {
                        client.Send("<email>", email_spbe, "[REMINDER] " + tipe_spbe + " No. " + docno_spbe + " Dalam Masa Tenggang", "Yth. SPBE " + nama_spbe + "\n" + almt_spbe + "\nNo.Telp/Fax:" + tlp_spbe + "\n\nBersama ini kami sampaikan bahwa Dokumen " + tipe_spbe + " dengan Nomor " + docno_spbe + " akan habis masa belakunya pada " + tgl_dok_spbe + ". \nSehubungan dengan hal diatas, agar Saudara/i segera memperbaharui dokumen tersebut.\nDemikian disampaikan, atas perhatian dan kerjasamanya diucapkan terima kasih.\n\n\nSalam,\nDomestic Gas Region V\nPT. Pertamina (Persero)\n\n" + footermsg);
                        WriteToFile("Email sent successfully to: " + nama_spbe + " " + email_spbe);
                    }
                }

                this.ScheduleService();
            }
            catch (Exception ex)
            {
                WriteToFile("Simple Service Error on: {0} " + ex.Message + ex.StackTrace);

                //Stop the Windows Service.
                using (System.ServiceProcess.ServiceController serviceController = new System.ServiceProcess.ServiceController("SimpleService"))
                {
                    serviceController.Stop();
                }
            }
        }

        private void SchedularCallback1(object e)
        {
            try
            {
                DataTable dt = new DataTable();

                string query_agen = "SELECT [agen].*, [dokumen_agen].* FROM [agen] INNER JOIN [dokumen_agen] ON [agen].[id_vendor_agen] = [dokumen_agen].[id_vendor_agen] WHERE [dokumen_agen].[dif_dokumen_agen] = [dokumen_agen].[rem_dokumen_agen] OR [dokumen_agen].[dif_dokumen_agen] = [dokumen_agen].[rem_dokumen_agen]/2 OR [dokumen_agen].[dif_dokumen_agen] = [dokumen_agen].[rem_dokumen_agen]/4 OR [dokumen_agen].[dif_dokumen_agen] <= 0";

                string constr = ConfigurationManager.ConnectionStrings["PlantCS"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query_agen))
                    {
                        cmd.Connection = con;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                        }
                    }
                }

                foreach (DataRow row in dt.Rows)
                {
                    string nama_agen = row["nama_agen"].ToString();
                    string email_agen = row["email_agen"].ToString();
                    string tipe_agen = row["tipe_dokumen_agen"].ToString();
                    string tgl_dok_agen = row["exp_dokumen_agen"].ToString();
                    int diffdate = (int)row["dif_dokumen_agen"];
                    string docno_agen = row["noreg_dokumen_agen"].ToString();
                    string tlp_agen = row["telp_agen"].ToString();
                    string almt_agen = row["alamat1_agen"].ToString();
                    string footermsg = "-Pesan ini dikirim melalui sistem monitoring dokumen\nDomestic Gas Region V, PT. Pertamina (Persero)-";

                    WriteToFile("Trying to send email to: " + nama_agen + " " + email_agen);

                    SmtpClient smtp = new SmtpClient();
                    System.Net.NetworkCredential credentials = new System.Net.NetworkCredential();

                    var client = new SmtpClient("smtp.gmail.com", 587)
                    {
                        Credentials = new NetworkCredential("<email>", "<password>"),
                        EnableSsl = true
                    };

                    if (diffdate <= 0)
                    {
                        client.Send("<email>", email_agen, "[REMINDER] " + tipe_agen + " No. " + docno_agen + " Habis Masa Berlaku", "Yth. Agen " + nama_agen + "\n" + almt_agen + "\nNo.Telp/Fax:" + tlp_agen + "\n\nBersama ini kami sampaikan bahwa Dokumen " + tipe_agen + " dengan Nomor " + docno_agen + " telah habis masa belakunya pada " + tgl_dok_agen + ". \nSehubungan dengan hal diatas, agar Saudara/i segera memperbaharui dokumen tersebut.\nDemikian disampaikan, atas perhatian dan kerjasamanya diucapkan terima kasih.\n\n\nSalam,\nDomestic Gas Region V\nPT. Pertamina (Persero)\n\n" + footermsg);
                        WriteToFile("Email sent successfully to: " + nama_agen + " " + email_agen);
                    }
                    else
                    {
                        client.Send("<email>", email_agen, "[REMINDER] " + tipe_agen + " No. " + docno_agen + " Dalam Masa Tenggang", "Yth. Agen " + nama_agen + "\n" + almt_agen + "\nNo.Telp/Fax:" + tlp_agen + "\n\nBersama ini kami sampaikan bahwa Dokumen " + tipe_agen + " dengan Nomor " + docno_agen + " akan habis masa belakunya pada " + tgl_dok_agen + ". \nSehubungan dengan hal diatas, agar Saudara/i segera memperbaharui dokumen tersebut.\nDemikian disampaikan, atas perhatian dan kerjasamanya diucapkan terima kasih.\n\n\nSalam,\nDomestic Gas Region V\nPT. Pertamina (Persero)\n\n" + footermsg);
                        WriteToFile("Email sent successfully to: " + nama_agen + " " + email_agen);
                    }
                }

                this.ScheduleService();
            }
            catch (Exception ex)
            {
                WriteToFile("Simple Service Error on: {0} " + ex.Message + ex.StackTrace);

                //Stop the Windows Service.
                using (System.ServiceProcess.ServiceController serviceController = new System.ServiceProcess.ServiceController("SimpleService"))
                {
                    serviceController.Stop();
                }
            }
        }

        private void SchedularCallback2(object e)
        {
            try
            {
                DataTable dt = new DataTable();

                string query_bkl = "SELECT [bkl].*, [dokumen_bkl].* FROM [bkl] INNER JOIN [dokumen_bkl] ON [bkl].[id_vendor_bkl] = [dokumen_bkl].[id_vendor_bkl] WHERE [dokumen_bkl].[dif_dokumen_bkl] = [dokumen_bkl].[rem_dokumen_bkl] OR [dokumen_bkl].[dif_dokumen_bkl] = [dokumen_bkl].[rem_dokumen_bkl]/2 OR [dokumen_bkl].[dif_dokumen_bkl] = [dokumen_bkl].[rem_dokumen_bkl]/4 OR [dokumen_bkl].[dif_dokumen_bkl] <= 0";

                string constr = ConfigurationManager.ConnectionStrings["PlantCS"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query_bkl))
                    {
                        cmd.Connection = con;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                        }
                    }
                }

                foreach (DataRow row in dt.Rows)
                {
                    string nama_bkl = row["nama_bkl"].ToString();
                    string email_bkl = row["email_bkl"].ToString();
                    string tipe_bkl = row["tipe_dokumen_bkl"].ToString();
                    string tgl_dok_bkl = row["exp_dokumen_bkl"].ToString();
                    int diffdate = (int)row["dif_dokumen_bkl"];
                    string docno_bkl = row["noreg_dokumen_bkl"].ToString();
                    string tlp_bkl = row["telp_bkl"].ToString();
                    string almt_bkl = row["alamat1_bkl"].ToString();
                    string footermsg = "-Pesan ini dikirim melalui sistem monitoring dokumen\nDomestic Gas Region V, PT. Pertamina (Persero)-";

                    WriteToFile("Trying to send email to: " + nama_bkl + " " + email_bkl);

                    SmtpClient smtp = new SmtpClient();
                    System.Net.NetworkCredential credentials = new System.Net.NetworkCredential();

                    var client = new SmtpClient("smtp.gmail.com", 587)
                    {
                        Credentials = new NetworkCredential("<email>", "<password>"),
                        EnableSsl = true
                    };

                    if (diffdate <= 0)
                    {
                        client.Send("<email>", email_bkl, "[REMINDER] " + tipe_bkl + " No. " + docno_bkl + " Dalam Masa Tenggang", "Yth. Bengkel " + nama_bkl + "\n" + almt_bkl + "\nNo.Telp/Fax:" + tlp_bkl + "\n\nBersama ini kami sampaikan bahwa Dokumen " + tipe_bkl + " dengan Nomor " + docno_bkl + " akan habis masa belakunya pada " + tgl_dok_bkl + ". \nSehubungan dengan hal diatas, agar Saudara/i segera memperbaharui dokumen tersebut.\nDemikian disampaikan, atas perhatian dan kerjasamanya diucapkan terima kasih.\n\n\nSalam,\nDomestic Gas Region V\nPT. Pertamina (Persero)\n\n" + footermsg);
                        WriteToFile("Email sent successfully to: " + nama_bkl + " " + email_bkl);
                    }
                    else
                    {
                        client.Send("<email>", email_bkl, "[REMINDER] " + tipe_bkl + " No. " + docno_bkl + " Dalam Masa Tenggang", "Yth. Bengkel " + nama_bkl + "\n" + almt_bkl + "\nNo.Telp/Fax:" + tlp_bkl + "\n\nBersama ini kami sampaikan bahwa Dokumen " + tipe_bkl + " dengan Nomor " + docno_bkl + " akan habis masa belakunya pada " + tgl_dok_bkl + ". \nSehubungan dengan hal diatas, agar Saudara/i segera memperbaharui dokumen tersebut.\nDemikian disampaikan, atas perhatian dan kerjasamanya diucapkan terima kasih.\n\n\nSalam,\nDomestic Gas Region V\nPT. Pertamina (Persero)\n\n" + footermsg);
                        WriteToFile("Email sent successfully to: " + nama_bkl + " " + email_bkl);
                    }
                }

                this.ScheduleService();
            }

            catch (Exception ex)
            {
                WriteToFile("Simple Service Error on: {0} " + ex.Message + ex.StackTrace);

                //Stop the Windows Service.
                using (System.ServiceProcess.ServiceController serviceController = new System.ServiceProcess.ServiceController("SimpleService"))
                {
                    serviceController.Stop();
                }
            }
        }

        private void WriteToFile(string text)
        {
            string path = "C:\\ServiceLog.txt";
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                writer.WriteLine(string.Format(text, DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt")));
                writer.Close();
            }
        }
    }
}
