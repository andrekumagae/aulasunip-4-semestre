package test;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Test extends JFrame implements ActionListener {
    JLabel lblNome;
    JLabel lblNome2;
    JTextField txtNome;

    Test() {
        setTitle("Titulo do Frame");
        setBounds(100, 100, 500, 500);
        setLayout(null);

        Panel painel = new Panel();
        painel.setBounds(0, 0, 500, 500);
        painel.setBackground(new Color(196, 121, 121));
        painel.setLayout(null);
        add(painel);

        lblNome = new JLabel("Olá mundo");
        lblNome.setFont( new Font("Arial", Font.BOLD, 22));
        lblNome.setBounds(30, 30, 150, 50);
        lblNome.setBackground(new Color(229, 245, 85));
        lblNome.setOpaque(true);


        lblNome2 = new JLabel("Guanabrabo");
        lblNome2.setFont( new Font("Arial", Font.BOLD, 22));
        lblNome2.setBounds(30, 80, 150, 50);
        lblNome2.setBackground(new Color(97, 253, 63));
        lblNome2.setOpaque(true);

        txtNome = new JTextField("123.456.789-00");
        txtNome.setFont( new Font("Arial", Font.BOLD, 22));
        txtNome.setBounds(210, 30, 160, 50);
        txtNome.setEnabled(false);


        painel.add(lblNome);
        painel.add(lblNome2);
        painel.add(txtNome);

        setVisible(true);
    }

    public static void main(String[] args) {
        new Test();
    }

    @Override
    public void actionPerformed(ActionEvent e) {

    }
}
