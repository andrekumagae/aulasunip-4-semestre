package ex04_1;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class TelaInicial extends JFrame implements ActionListener {

    JMenuBar barraMenu = new JMenuBar();
    JMenu menuCadastro = new JMenu("CADASTRAR");
    JMenu menuPesquisar = new JMenu("PESQUISAR");
    JMenu menuSair = new JMenu("SAIR");

    JMenuItem itemIncluir = new JMenuItem("Incluir");
    JMenuItem itemAlterar = new JMenuItem("Alterar");
    JMenuItem itemExcluir = new JMenuItem("Excluir");

    JLabel lblProxima = new JLabel("A Praia mais próxima");
    JLabel lblDistante = new JLabel("A Praia mais distante");
    JLabel lblMelhor = new JLabel("A Praia melhor avaliada");
    JLabel lblPorDistancia = new JLabel("As Praias por Distância");
    JLabel lblPorAvaliacao = new JLabel("As Praias por Avaliação");

    public static void main(String[] args) {
        TelaInicial telaInicial = new TelaInicial();
    }

    public TelaInicial() {
        setTitle("Sistema Atendimento aos Hospedes");
        setBounds(200,200,400,200);
        getContentPane().setBackground(new Color(0x01FFFF));
        setLayout(null);
        setJMenuBar(barraMenu);

        barraMenu.add(menuCadastro);
        barraMenu.add(menuPesquisar);
        barraMenu.add(menuSair);

        barraMenu.add(menuCadastro);
        barraMenu.add(menuPesquisar);
        barraMenu.add(menuSair);

        menuCadastro.add(itemIncluir);
        menuCadastro.add(itemAlterar);
        menuCadastro.add(itemExcluir);

        menuCadastro.addActionListener(this);
        menuPesquisar.addActionListener(this);
        menuSair.addActionListener(this);
        itemIncluir.addActionListener(this);


        setVisible(true);

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == itemIncluir){
            System.out.println("Incluir");
            new TelaIncluir();
        }else if (e.getSource() == menuPesquisar){
            System.out.println("Pesquisar");
        }else if (e.getSource() == menuSair){
            this.dispose();
        }

    }
}
