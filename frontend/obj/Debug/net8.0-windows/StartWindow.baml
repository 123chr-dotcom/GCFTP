   M S B A M L   `   `   `  ����E  AChatClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:ChatClient
ChatClient  5   	       ChatClient.StartWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:ChatClient     5   	     � Title$  连接服务器��5   	   $	��300��6   $	��400��6$    � WindowStartupLocation$ CenterScreen=�5	   	   .��5
      � $��20q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6   $��服务器IP:��6   $��0,0,0,5q�6.   �� 5   
   -   5         ��Name$ 	IpTextBox��5      $��1��6%   $��	127.0.0.1��5      $��0,0,0,10q�6#   �� 5   
   $��2��6   $��
端口号:��6   $��0,0,0,5q�6,   �� 5   
   -   5        $ PortTextBox��5      $��3��6'   $
��8080��5      $��0,0,0,15q�6   �� 5   
   -   5         ��Name$ 	ErrorText��5      $��4��6'   
���  ��$
��Wrap=�5    %   $y�	Collapsed=�5!      �� 5$   
   $��5��6    �� Orientation$ 
Horizontal=�6"   $��Right=�6;   .+�5%      �� -   5         ��Name$ ConnectButton��5%      $��连接��6,   $��80��69   $��0,0,10,0q�6D   5&      �� 5'      -   5        $ CancelButton��5'      $��取消��6+   $��80��68   5(      5)      5*      5+      