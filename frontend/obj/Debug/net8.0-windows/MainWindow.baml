   M S B A M L   `   `   `  ����E  AChatClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:ChatClient
ChatClient  5   	       ChatClient.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:ChatClient     5   	     � Title$  局域网聊天客户端��5   	   $	��450��6   $	��800��6'   .��5	      �  � RowDefinitions 5
   
   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6   $
��Auto=�6$   .��5      �� -   5         ��Name$ MessageDisplay��5       �� 
IsReadOnly$
 True��6.    �� TextWrapping$
 Wrap=�5      " �� VerticalScrollBarVisibility$ Visible=�6*   $��14(�5      $��10q�6$   5      � 5   
   $��1��6   $��5q�6    � ColumnDefinitions 5      �� 5      $��* �6#   �� 5      $
��Auto �6#   .+�5      �� -   5        $ MessageInput��5      $��0��6,   $��14(�5      $��5q�6$   $��Center=�60   5      �� 5!      -   5         ��Name$ 
SendButton��5!      $��1��6)   $��发送��5"      $��80��6"   $��5,0,0,0q�6-   5#      5$      5%      5&      