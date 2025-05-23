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
        private const string ServerIP = "127.0.0.1";
        private const int ServerPort = 8080;

        public MainWindow()
        {
            InitializeComponent();
            ConnectToServer();
        }

        private string _userName = "User" + new Random().Next(1000);
        
        private void ConnectToServer()
        {
            try
            {
                _client = new TcpClient(ServerIP, ServerPort);
                _stream = _client.GetStream();
                
                // 首先发送用户名
                byte[] nameData = Encoding.UTF8.GetBytes(_userName + "\n");
                _stream.Write(nameData, 0, nameData.Length);
                
                // 启动接收消息的线程
                var receiveThread = new System.Threading.Thread(ReceiveMessages);
                receiveThread.IsBackground = true;
                receiveThread.Start();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"连接服务器失败: {ex.Message}");
                Close();
            }
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
                AppendMessage($"{_userName}: {message}");
                MessageInput.Clear();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"发送消息失败: {ex.Message}");
            }
        }

        private void AppendMessage(string message)
        {
            MessageDisplay.AppendText($"{message}{Environment.NewLine}");
            MessageDisplay.ScrollToEnd();
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
