package main

import (
	"bufio"
	"fmt"
	"log"
	"net"
	"sync"
)

type client struct {
	conn net.Conn
	name string
}

var (
	clients   = make(map[*client]bool)
	clientsMu sync.Mutex
)

func main() {
	// 启动TCP服务器
	listener, err := net.Listen("tcp", ":8080")
	if err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
	defer listener.Close()

	fmt.Println("Chat server is running on port 8080")

	// 接受客户端连接
	for {
		conn, err := listener.Accept()
		if err != nil {
			log.Printf("Failed to accept connection: %v", err)
			continue
		}

		go handleClient(conn)
	}
}

func handleClient(conn net.Conn) {
	defer func() {
		conn.Close()
		removeClient(conn)
	}()

	// 获取客户端名称
	name, err := bufio.NewReader(conn).ReadString('\n')
	if err != nil {
		log.Printf("Error reading name: %v", err)
		return
	}
	name = name[:len(name)-1] // 去除换行符

	// 创建客户端并添加到列表
	c := &client{conn: conn, name: name}
	addClient(c)
	broadcast(fmt.Sprintf("系统: %s 加入了聊天室", c.name))

	// 处理客户端消息
	scanner := bufio.NewScanner(conn)
	for scanner.Scan() {
		msg := scanner.Text()
		broadcast(fmt.Sprintf("%s: %s", c.name, msg))
	}

	if err := scanner.Err(); err != nil {
		log.Printf("Error reading from %s: %v", c.name, err)
	}
}

func addClient(c *client) {
	clientsMu.Lock()
	defer clientsMu.Unlock()
	clients[c] = true
}

func removeClient(conn net.Conn) {
	clientsMu.Lock()
	defer clientsMu.Unlock()
	for c := range clients {
		if c.conn == conn {
			delete(clients, c)
			broadcast(fmt.Sprintf("%s 离开了聊天室", c.name))
			break
		}
	}
}

func broadcast(msg string) {
	clientsMu.Lock()
	defer clientsMu.Unlock()
	
	log.Printf("Broadcasting message to %d clients: %s", len(clients), msg)
	
	for c := range clients {
		log.Printf("Sending to %s", c.name)
		_, err := fmt.Fprintf(c.conn, "%s\n", msg)
		if err != nil {
			log.Printf("Error broadcasting to %s: %v", c.name, err)
		} else {
			log.Printf("Successfully sent to %s", c.name)
		}
	}
}
