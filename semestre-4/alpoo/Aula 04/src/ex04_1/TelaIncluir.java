package ex04_1;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class TelaIncluir extends JFrame implements ActionListener {
    JLabel lblCadastro = new JLabel("CADASTRAMENTO DAS PRAIAS");
    JLabel lblNome = new JLabel("Nome da Praia: ");
    JLabel lblDistancia = new JLabel("Distância do hotel: ");
    JLabel lblAvaliacao = new JLabel("Avaliação da Praia");
    JButton btnSair = new JButton("SAIR");






    public static void main(String[] args) {
        TelaIncluir telaIncluir = new TelaIncluir();
    }

    public TelaIncluir() {
        setTitle("CADASTRAMENTO DAS PRAIAS");
        setBounds(200, 200, 400, 400);
        getContentPane().setBackground(new Color(0x01FFFF));
        setLayout(null);

        Font titulo = new Font("Arial",Font.PLAIN,16);

        lblCadastro.setBounds(20,20,300,20);
        lblCadastro.setFont(titulo);
        btnSair.setBounds(30,300,100,50);
        btnSair.addActionListener(this);
        add(lblCadastro);
        add(btnSair);
//        add(lblNome);
//        add(lblDistancia);
//        add(lblAvaliacao);



        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == btnSair){
            System.exit(0);
        }
    }
}
