package ex02_02;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Livro extends JFrame implements ActionListener {

    JLabel lblCadLivros;
    JLabel lblTitulo;
    JLabel lblPaginas;
    JLabel lblLivros;
    JTextField tfTitulo;
    JTextField tfPaginas;
    JButton btAdicionar;
    JButton btListar;
    JButton btSair;

    public static void main(String[] args) {
        new Livro();
    }

    public Livro() {
        setTitle("Uso de List");
        setBounds(400, 400, 400, 400);
        getContentPane().setBackground(new Color(0xF8F030));
        setLayout(null);
        setResizable(false);

        lblCadLivros = new JLabel("CADASTRAMENTO DE LIVROS");
        lblTitulo = new JLabel("Título:");
        lblPaginas = new JLabel("Páginas");
        lblLivros = new JLabel("LIVROS");

        lblCadLivros.setBounds(30, 30, 200, 20);
        lblTitulo.setBounds(30, 60, 50, 20);
        lblPaginas.setBounds(30, 90, 50, 20);
        lblLivros.setBounds(30, 120, 200, 20);

        tfTitulo = new JTextField();
        tfPaginas = new JTextField();

        tfTitulo.setBounds(90, 60, 100, 20);
        tfPaginas.setBounds(90, 90, 30, 20);

        JTextArea txaLivros = new JTextArea();
        txaLivros.setBounds(30, 150, 250, 100);
        txaLivros.setBorder(BorderFactory.createLineBorder(Color.black));

        btAdicionar = new JButton("Adicionar");
        btListar = new JButton("Listar");
        btSair = new JButton("Sair");

        btAdicionar.setBounds(30, 260, 100, 30);
        btListar.setBounds(140, 260, 80, 30);
        btSair.setBounds(230, 260, 80, 30);

        add(lblCadLivros);
        add(lblTitulo);
        add(lblPaginas);
        add(lblLivros);
        add(tfTitulo);
        add(tfPaginas);
        add(txaLivros);
        add(btAdicionar);
        add(btListar);
        add(btSair);

        btAdicionar.addActionListener(this);
        btListar.addActionListener(this);
        btSair.addActionListener(this);
        setVisible(true);
    }

    public void adicionar() {
        String titulo, paginas;
        titulo = tfTitulo.getText();
        paginas = tfPaginas.getText();
    }


    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == btSair) {
            System.exit(0);
        } else if (e.getSource() == btAdicionar) {
            JOptionPane.showMessageDialog(null, "Botão Add");
        } else {
            JOptionPane.showMessageDialog(null, "Botão Listar");
        }

    }
}
