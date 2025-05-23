using System;
using System.IO;
using System.Net.Sockets;
using System.Text;
using System.Windows;
using System.Windows.Input;

namespace ChatClient
{
    public partial class MainWindow : Window
    {
        private TcpClient _client;
        private NetworkStream _stream;
        private string _userName = "User" + new Random().Next(1000);

        public MainWindow(TcpClient client, NetworkStream stream)
        {
            InitializeComponent();
            _client = client;
            _stream = stream;
            
            // 首先发送用户名
            byte[] nameData = Encoding.UTF8.GetBytes(_userName + "\n");
            _stream.Write(nameData, 0, nameData.Length);
            
            // 启动接收消息的线程
            var receiveThread = new System.Threading.Thread(ReceiveMessages);
            receiveThread.IsBackground = true;
            receiveThread.Start();
        }

        private void ReceiveMessages()
        {
            byte[] buffer = new byte[1024];
            int bytesRead;

            try
            {
                while ((bytesRead = _stream.Read(buffer, 0, buffer.Length)) != 0)
                {
                    string message = Encoding.UTF8.GetString(buffer, 0, bytesRead);
                    Dispatcher.Invoke(() => AppendMessage(message));
                }
            }
            catch (Exception)
            {
                Dispatcher.Invoke(() => AppendMessage("与服务器的连接已断开"));
            }
        }

        private void SendMessage(string message)
        {
            try
            {
                byte[] data = Encoding.UTF8.GetBytes(message + "\n");
                _stream.Write(data, 0, data.Length);
                // 不在发送时本地显示，由接收线程统一处理
                MessageInput.Clear();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"发送消息失败: {ex.Message}");
            }
        }

        private void AppendMessage(string message)
        {
            // 检查是否已包含相同消息
            if (!MessageDisplay.Text.Contains(message))
            {
                MessageDisplay.AppendText($"{message}{Environment.NewLine}");
                MessageDisplay.ScrollToEnd();
            }
        }

        private void SendButton_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(MessageInput.Text))
            {
                SendMessage(MessageInput.Text);
            }
        }

        private void MessageInput_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter && !string.IsNullOrWhiteSpace(MessageInput.Text))
            {
                SendMessage(MessageInput.Text);
            }
        }

        protected override void OnClosed(EventArgs e)
        {
            _stream?.Close();
            _client?.Close();
            base.OnClosed(e);
        }
    }
}
