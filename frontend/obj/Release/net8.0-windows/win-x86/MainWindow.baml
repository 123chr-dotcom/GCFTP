   M S B A M L   `   `   `  ���� E  AChatClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:ChatClient
ChatClient      ChatClient.MainWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     *localclr-namespace:ChatClient       � Title$  局域网聊天客户端��$	��450��$	��800��.���  � RowDefinitions �� $��* ��� $
��Auto �.+��� $��0��$
��Auto=�.���� -    ��Name$ MessageDisplay�� �� 
IsReadOnly$
 True�� �� TextWrapping$
 Wrap=�" �� VerticalScrollBarVisibility$ Visible=�$��14(�$��10q�� $��1��$��5q� � ColumnDefinitions �� $��* ��� $
��Auto �.+��� -   $ MessageInput��$��0��$��14(�$��5q�$��Center=��� -    ��Name$ 
SendButton��$��1��$��发送��$��80��$��5,0,0,0q�