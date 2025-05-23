using System;
using System.Net.Sockets;
using System.Text;
using System.Windows;
using System.Windows.Input;

namespace ChatClient
{
    public partial class StartWindow : Window
    {
        public StartWindow()
        {
            InitializeComponent();
        }

        private void ConnectButton_Click(object sender, RoutedEventArgs e)
        {
            string ip = IpTextBox.Text.Trim();
            if (!int.TryParse(PortTextBox.Text.Trim(), out int port))
            {
                ShowError("请输入有效的端口号");
                return;
            }

            try
            {
                var client = new TcpClient(ip, port);
                var stream = client.GetStream();
                
                // 创建主窗口并传递连接信息
                var mainWindow = new MainWindow(client, stream);
                mainWindow.Show();
                
                // 关闭当前窗口
                this.Close();
            }
            catch (Exception ex)
            {
                ShowError($"连接服务器失败: {ex.Message}");
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void ShowError(string message)
        {
            ErrorText.Text = message;
            ErrorText.Visibility = Visibility.Visible;
        }
    }
}
