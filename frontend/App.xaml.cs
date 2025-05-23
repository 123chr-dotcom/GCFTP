using System.Configuration;
using System.Data;
using System.Windows;

namespace ChatClient;

public partial class App : Application
{
    protected override void OnStartup(StartupEventArgs e)
    {
        base.OnStartup(e);
        
        // 设置当最后一个窗口关闭时才退出应用
        this.ShutdownMode = ShutdownMode.OnLastWindowClose;
        
        var startWindow = new StartWindow();
        startWindow.Show();
    }
}

