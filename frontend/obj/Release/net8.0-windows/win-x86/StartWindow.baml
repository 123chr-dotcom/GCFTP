   M S B A M L   `   `   `  ���� E  AChatClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:ChatClient
ChatClient      ChatClient.StartWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     *localclr-namespace:ChatClient       � Title$  连接服务器��$	��300��$	��400�� � WindowStartupLocation$ CenterScreen=�.��� $��20q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0��$��服务器IP:��$��0,0,0,5q��� -    ��Name$ 	IpTextBox��$��1��$��	127.0.0.1��$��0,0,0,10q��� $��2��$��
端口号:��$��0,0,0,5q��� -   $ PortTextBox��$��3��$
��8080��$��0,0,0,15q��� -    ��Name$ 	ErrorText��$��4��
���  ��$
��Wrap=�$y�	Collapsed=��� $��5�� �� Orientation$ 
Horizontal=�$��Right=�.+��� -    ��Name$ ConnectButton��$��连接��$��80��$��0,0,10,0q��� -   $ CancelButton��$��取消��$��80��