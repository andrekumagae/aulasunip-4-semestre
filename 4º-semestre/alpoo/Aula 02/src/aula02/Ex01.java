package aula02;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class Ex01 extends JFrame implements ActionListener {
    public static void main(String[] args) {
        new Ex01();
    }

    JLabel lbNome, lbIdade;
    JTextField tfNome;
    String[] listaIdades = {"21", "22", "23","24","25","26"};
    String[] listaNomes = new String[10];
    JList listaItens;
    JButton btOk, btSair;
    static int cont=0;
    static String textoArrays="";

    Ex01() {
        setTitle("Exercício 01 - Slide 02");
        setBounds(100,100,350,300);
        setResizable(false);
        getContentPane().setBackground(new Color(109, 73, 213, 255));
        setLayout(null);

        Font fonte = new Font("Arial",Font.BOLD,16);
        lbNome = new JLabel("Nome: ");
        lbIdade = new JLabel("Idade: ");
        tfNome = new JTextField();

        btOk = new JButton("OK");
        btSair = new JButton("Sair");

        lbNome.setBounds(60,50,60,20);
        lbIdade.setBounds(60,90,60,20);
        tfNome.setBounds(120,50,150,20);
        btOk.setBounds(60,200,100,50);
        btSair.setBounds(180,200,100,50);

        lbNome.setFont(fonte);
        lbIdade.setFont(fonte);
        tfNome.setFont(fonte);

        lbNome.setForeground(Color.YELLOW);
        lbIdade.setForeground(Color.YELLOW);

        listaItens = new JList(listaIdades);
        JScrollPane rolagem = new JScrollPane(listaItens);
        rolagem.setBounds(120,90,75,50);
        rolagem.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);

        add(rolagem);
        add(lbNome);
        add(lbIdade);
        add(tfNome);
        add(btOk);
        add(btSair);
        add(tfNome);

        btOk.addActionListener(this);
        btSair.addActionListener(this);

        setVisible(true);
    }

    public void inserirNome() {
        String nome, idade;
        String[] nomes = new String[10];
        double[] idades = new double[10];

        nome = tfNome.getText();
        idade = String.valueOf(listaItens.getSelectedValue());
        nomes[cont] = nome;
        idades[cont] = Double.parseDouble(idade);
        textoArrays +="Nome " + cont + ": " + nomes[cont] + "\nIdade " + cont + ": " + idades[cont]+"\n";
        JOptionPane.showMessageDialog(null,"Nome " + (cont+1) + "adicionado.");
        tfNome.setText(null);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource()==btSair){
            JOptionPane.showMessageDialog(null,textoArrays);
            System.exit(0);
        }else{
            if (cont<=3){
            inserirNome();
            cont++;
            }else{
                JOptionPane.showMessageDialog(null,"Array está cheio!");
            }
        }
    }
}
