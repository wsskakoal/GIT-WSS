using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace TesteFireWall
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnOpen_Click(object sender, EventArgs e)
        {

            OpenFirewallForProgram((Path.Combine(Application.StartupPath, "MySQL8\\bin\\mysqld.exe")), "Gestor_MySQL8");
        }

        private static void OpenFirewallForProgram(string exeFileName, string displayName)
        {
            var proc = Process.Start(
                  new ProcessStartInfo
                  {
                      FileName = "netsh",
                      Arguments =
                              string.Format(
                                  "advfirewall firewall add rule name=\"{0}\" dir=in action=allow program=\"{1}\" enable=yes",
                                 displayName, exeFileName),
                      WindowStyle = ProcessWindowStyle.Hidden,
                      CreateNoWindow = true,
                      RedirectStandardOutput = true,
                      ErrorDialog = true,
                      UseShellExecute = false,

                  });
            proc.WaitForExit();

            var erro = proc.StandardOutput.ReadToEnd().ToString();

            if (erro.Substring(0, 2) != "Ok")
                MessageBox.Show($"Erro ao adicionar programa no firewall. {erro}");
        }
    }
}
