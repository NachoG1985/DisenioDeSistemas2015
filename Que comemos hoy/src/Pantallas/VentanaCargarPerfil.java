package entrega1;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.ButtonGroup;
import javax.swing.DefaultComboBoxModel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JRadioButton;
import javax.swing.JTextField;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.SwingConstants;

public class VentanaCargarPerfil {

	private JFrame frame;
	private JTextField txtCargarPerfilDe;
	private JTextField nombreYapellido;
	private JTextField altura;
	private JTextField edad;
	private JTextField txtSexo;
	private final ButtonGroup sexo = new ButtonGroup();
	private JTextField txtDieta;
	private JTextField txtCondicionPreexistente;
	private JTextField txtRutina;
	private final ButtonGroup rutina = new ButtonGroup();
	private JTextField txtSedentariaConNada;
	private JTextField txtSedentariaConAlgo;
	private JTextField textField;
	private JTextField txtActivaSinEjercicio;
	private JTextField txtActivaConEjercicio;
	private JTextField txtComplexionFisica;
	private JRadioButton rdbtnPequea;
	private JRadioButton rdbtnMediana_1;
	private JRadioButton rdbtnGrande_1;
	private JTextField txtComplexionFisica_1;
	private final ButtonGroup complexion = new ButtonGroup();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			@Override
			public void run() {
				try {
					VentanaCargarPerfil window = new VentanaCargarPerfil();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public VentanaCargarPerfil() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 800, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		txtCargarPerfilDe = new JTextField();
		txtCargarPerfilDe.setEditable(false);
		txtCargarPerfilDe.setFont(new Font("Arial Black", Font.PLAIN, 16));
		txtCargarPerfilDe.setHorizontalAlignment(SwingConstants.CENTER);
		txtCargarPerfilDe.setText("Cargar perfil de usuario");
		txtCargarPerfilDe.setColumns(10);

		nombreYapellido = new JTextField();
		nombreYapellido.setText("nombre y apellido");
		nombreYapellido.setHorizontalAlignment(SwingConstants.CENTER);
		nombreYapellido.setColumns(10);

		altura = new JTextField();
		altura.setHorizontalAlignment(SwingConstants.CENTER);
		altura.setText("altura");
		altura.setColumns(10);

		edad = new JTextField();
		edad.setHorizontalAlignment(SwingConstants.CENTER);
		edad.setText("edad");
		edad.setColumns(10);

		txtSexo = new JTextField();
		txtSexo.setCaretColor(Color.WHITE);
		txtSexo.setHorizontalAlignment(SwingConstants.LEFT);
		txtSexo.setEditable(false);
		txtSexo.setText("sexo:");
		txtSexo.setColumns(10);

		JRadioButton femenino = new JRadioButton("Femenino");
		sexo.add(femenino);

		JRadioButton masculino = new JRadioButton("Masculino");
		sexo.add(masculino);

		JComboBox comboBoxDieta = new JComboBox();
		comboBoxDieta.setModel(new DefaultComboBoxModel(new String[]{"",
				"Normal", "Ovolactovegetariano", "Vegetariano", "Vegano"}));
		comboBoxDieta.setMaximumRowCount(4);

		txtDieta = new JTextField();
		txtDieta.setText("dieta:");
		txtDieta.setHorizontalAlignment(SwingConstants.LEFT);
		txtDieta.setEditable(false);
		txtDieta.setColumns(10);
		txtDieta.setCaretColor(Color.WHITE);

		txtCondicionPreexistente = new JTextField();
		txtCondicionPreexistente.setText("condicion preexistente:");
		txtCondicionPreexistente.setHorizontalAlignment(SwingConstants.LEFT);
		txtCondicionPreexistente.setEditable(false);
		txtCondicionPreexistente.setColumns(10);
		txtCondicionPreexistente.setCaretColor(Color.WHITE);

		JCheckBox chckbxDiabetes = new JCheckBox("Diabetes");

		JCheckBox chckbxHipertension = new JCheckBox("Hipertension");

		JCheckBox chckbxCeliasis = new JCheckBox("Celiasis");

		txtRutina = new JTextField();
		txtRutina.setText("rutina:");
		txtRutina.setHorizontalAlignment(SwingConstants.LEFT);
		txtRutina.setEditable(false);
		txtRutina.setColumns(10);
		txtRutina.setCaretColor(Color.WHITE);

		JRadioButton rdbtnLeve = new JRadioButton("Nada");
		rutina.add(rdbtnLeve);

		JRadioButton rdbtnNada = new JRadioButton("Leve");
		rutina.add(rdbtnNada);

		JRadioButton rdbtnMediana = new JRadioButton("Mediana");
		rutina.add(rdbtnMediana);

		JRadioButton rdbtnIntensiva = new JRadioButton("Grande");
		rutina.add(rdbtnIntensiva);

		JRadioButton rdbtnGrande = new JRadioButton("Intensiva");
		rutina.add(rdbtnGrande);

		txtSedentariaConNada = new JTextField();
		txtSedentariaConNada.setText("Sedentaria con nada de ejercicio");
		txtSedentariaConNada.setHorizontalAlignment(SwingConstants.LEFT);
		txtSedentariaConNada.setEditable(false);
		txtSedentariaConNada.setColumns(10);
		txtSedentariaConNada.setCaretColor(Color.WHITE);

		txtSedentariaConAlgo = new JTextField();
		txtSedentariaConAlgo
				.setText("Sedentaria con algo de ejercicio, menos de 30 minutos");
		txtSedentariaConAlgo.setHorizontalAlignment(SwingConstants.LEFT);
		txtSedentariaConAlgo.setEditable(false);
		txtSedentariaConAlgo.setColumns(10);
		txtSedentariaConAlgo.setCaretColor(Color.WHITE);

		textField = new JTextField();
		textField
				.setText("Sedentaria con algo de ejercicio, mas de 30 minutos");
		textField.setHorizontalAlignment(SwingConstants.LEFT);
		textField.setEditable(false);
		textField.setColumns(10);
		textField.setCaretColor(Color.WHITE);

		txtActivaSinEjercicio = new JTextField();
		txtActivaSinEjercicio.setText("Activa sin ejercicio adicional");
		txtActivaSinEjercicio.setHorizontalAlignment(SwingConstants.LEFT);
		txtActivaSinEjercicio.setEditable(false);
		txtActivaSinEjercicio.setColumns(10);
		txtActivaSinEjercicio.setCaretColor(Color.WHITE);

		txtActivaConEjercicio = new JTextField();
		txtActivaConEjercicio.setText("Activa con ejercicio adicional");
		txtActivaConEjercicio.setHorizontalAlignment(SwingConstants.LEFT);
		txtActivaConEjercicio.setEditable(false);
		txtActivaConEjercicio.setColumns(10);
		txtActivaConEjercicio.setCaretColor(Color.WHITE);

		txtComplexionFisica = new JTextField();
		txtComplexionFisica.setText("complexion fisica:");
		txtComplexionFisica.setHorizontalAlignment(SwingConstants.LEFT);
		txtComplexionFisica.setEditable(false);
		txtComplexionFisica.setColumns(10);
		txtComplexionFisica.setCaretColor(Color.WHITE);

		rdbtnPequea = new JRadioButton("Peque\u00F1a");
		complexion.add(rdbtnPequea);

		rdbtnMediana_1 = new JRadioButton("Mediana");
		complexion.add(rdbtnMediana_1);

		rdbtnGrande_1 = new JRadioButton("Grande");
		complexion.add(rdbtnGrande_1);

		txtComplexionFisica_1 = new JTextField();
		txtComplexionFisica_1.setEditable(false);
		txtComplexionFisica_1.setText("preferencias alimenticias:");
		txtComplexionFisica_1.setColumns(10);

		JComboBox preferencia1 = new JComboBox();

		JComboBox preferencia2 = new JComboBox();

		JComboBox preferencia3 = new JComboBox();

		JComboBox preferencia4 = new JComboBox();

		JComboBox preferencia5 = new JComboBox();

		JButton siguiente = new JButton("Siguiente");
		siguiente.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
			}
		});
		GroupLayout groupLayout = new GroupLayout(frame.getContentPane());
		groupLayout
				.setHorizontalGroup(groupLayout
						.createParallelGroup(Alignment.LEADING)
						.addGroup(
								groupLayout
										.createSequentialGroup()
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.TRAILING)
														.addGroup(
																groupLayout
																		.createSequentialGroup()
																		.addContainerGap()
																		.addComponent(
																				txtCargarPerfilDe,
																				GroupLayout.DEFAULT_SIZE,
																				764,
																				Short.MAX_VALUE))
														.addGroup(
																groupLayout
																		.createSequentialGroup()
																		.addGap(45)
																		.addGroup(
																				groupLayout
																						.createParallelGroup(
																								Alignment.TRAILING)
																						.addGroup(
																								groupLayout
																										.createSequentialGroup()
																										.addGroup(
																												groupLayout
																														.createParallelGroup(
																																Alignment.LEADING,
																																false)
																														.addComponent(
																																rdbtnLeve)
																														.addComponent(
																																rdbtnNada)
																														.addComponent(
																																rdbtnMediana)
																														.addComponent(
																																rdbtnIntensiva)
																														.addComponent(
																																rdbtnGrande)
																														.addComponent(
																																txtComplexionFisica,
																																GroupLayout.DEFAULT_SIZE,
																																110,
																																Short.MAX_VALUE))
																										.addPreferredGap(
																												ComponentPlacement.RELATED,
																												140,
																												Short.MAX_VALUE)
																										.addGroup(
																												groupLayout
																														.createParallelGroup(
																																Alignment.LEADING)
																														.addGroup(
																																groupLayout
																																		.createSequentialGroup()
																																		.addComponent(
																																				rdbtnPequea)
																																		.addGap(18)
																																		.addComponent(
																																				rdbtnMediana_1)
																																		.addGap(18)
																																		.addComponent(
																																				rdbtnGrande_1))
																														.addComponent(
																																txtActivaConEjercicio,
																																GroupLayout.PREFERRED_SIZE,
																																449,
																																GroupLayout.PREFERRED_SIZE)
																														.addComponent(
																																txtActivaSinEjercicio,
																																GroupLayout.PREFERRED_SIZE,
																																449,
																																GroupLayout.PREFERRED_SIZE)
																														.addComponent(
																																textField,
																																GroupLayout.PREFERRED_SIZE,
																																449,
																																GroupLayout.PREFERRED_SIZE)
																														.addComponent(
																																txtSedentariaConAlgo,
																																GroupLayout.PREFERRED_SIZE,
																																449,
																																GroupLayout.PREFERRED_SIZE)
																														.addComponent(
																																txtSedentariaConNada,
																																GroupLayout.PREFERRED_SIZE,
																																449,
																																GroupLayout.PREFERRED_SIZE)))
																						.addComponent(
																								txtComplexionFisica_1,
																								699,
																								699,
																								699)
																						.addComponent(
																								txtRutina,
																								GroupLayout.DEFAULT_SIZE,
																								699,
																								Short.MAX_VALUE)
																						.addComponent(
																								txtCondicionPreexistente,
																								GroupLayout.DEFAULT_SIZE,
																								699,
																								Short.MAX_VALUE)
																						.addGroup(
																								groupLayout
																										.createSequentialGroup()
																										.addComponent(
																												preferencia1,
																												GroupLayout.PREFERRED_SIZE,
																												135,
																												GroupLayout.PREFERRED_SIZE)
																										.addPreferredGap(
																												ComponentPlacement.RELATED)
																										.addComponent(
																												preferencia2,
																												GroupLayout.PREFERRED_SIZE,
																												135,
																												GroupLayout.PREFERRED_SIZE)
																										.addPreferredGap(
																												ComponentPlacement.RELATED)
																										.addGroup(
																												groupLayout
																														.createParallelGroup(
																																Alignment.TRAILING,
																																false)
																														.addComponent(
																																siguiente,
																																Alignment.LEADING,
																																GroupLayout.DEFAULT_SIZE,
																																GroupLayout.DEFAULT_SIZE,
																																Short.MAX_VALUE)
																														.addComponent(
																																preferencia3,
																																Alignment.LEADING,
																																0,
																																135,
																																Short.MAX_VALUE))
																										.addPreferredGap(
																												ComponentPlacement.RELATED)
																										.addComponent(
																												preferencia4,
																												GroupLayout.PREFERRED_SIZE,
																												135,
																												GroupLayout.PREFERRED_SIZE)
																										.addPreferredGap(
																												ComponentPlacement.RELATED)
																										.addComponent(
																												preferencia5,
																												GroupLayout.PREFERRED_SIZE,
																												135,
																												GroupLayout.PREFERRED_SIZE))
																						.addGroup(
																								Alignment.LEADING,
																								groupLayout
																										.createSequentialGroup()
																										.addComponent(
																												chckbxDiabetes)
																										.addGap(18)
																										.addComponent(
																												chckbxHipertension)
																										.addGap(18)
																										.addComponent(
																												chckbxCeliasis))
																						.addGroup(
																								Alignment.LEADING,
																								groupLayout
																										.createSequentialGroup()
																										.addGroup(
																												groupLayout
																														.createParallelGroup(
																																Alignment.LEADING)
																														.addComponent(
																																altura,
																																GroupLayout.DEFAULT_SIZE,
																																90,
																																Short.MAX_VALUE)
																														.addComponent(
																																txtSexo,
																																Alignment.TRAILING)
																														.addComponent(
																																txtDieta,
																																Alignment.TRAILING,
																																GroupLayout.PREFERRED_SIZE,
																																86,
																																GroupLayout.PREFERRED_SIZE))
																										.addPreferredGap(
																												ComponentPlacement.UNRELATED)
																										.addGroup(
																												groupLayout
																														.createParallelGroup(
																																Alignment.LEADING)
																														.addComponent(
																																comboBoxDieta,
																																GroupLayout.PREFERRED_SIZE,
																																150,
																																GroupLayout.PREFERRED_SIZE)
																														.addGroup(
																																groupLayout
																																		.createSequentialGroup()
																																		.addGroup(
																																				groupLayout
																																						.createParallelGroup(
																																								Alignment.TRAILING,
																																								false)
																																						.addComponent(
																																								edad,
																																								Alignment.LEADING,
																																								0,
																																								0,
																																								Short.MAX_VALUE)
																																						.addComponent(
																																								femenino,
																																								Alignment.LEADING,
																																								GroupLayout.DEFAULT_SIZE,
																																								GroupLayout.DEFAULT_SIZE,
																																								Short.MAX_VALUE))
																																		.addPreferredGap(
																																				ComponentPlacement.UNRELATED)
																																		.addComponent(
																																				masculino)))
																										.addPreferredGap(
																												ComponentPlacement.RELATED,
																												451,
																												Short.MAX_VALUE))
																						.addComponent(
																								nombreYapellido,
																								Alignment.LEADING,
																								GroupLayout.PREFERRED_SIZE,
																								349,
																								GroupLayout.PREFERRED_SIZE))
																		.addGap(30)))
										.addContainerGap()));
		groupLayout
				.setVerticalGroup(groupLayout
						.createParallelGroup(Alignment.LEADING)
						.addGroup(
								groupLayout
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(txtCargarPerfilDe,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addGap(18)
										.addComponent(nombreYapellido)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																altura,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																edad,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(femenino)
														.addComponent(masculino)
														.addComponent(
																txtSexo,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																txtDieta,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																comboBoxDieta,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(txtCondicionPreexistente,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																chckbxDiabetes)
														.addComponent(
																chckbxHipertension)
														.addComponent(
																chckbxCeliasis))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(txtRutina,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.UNRELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(rdbtnLeve)
														.addComponent(
																txtSedentariaConNada,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(rdbtnNada)
														.addComponent(
																txtSedentariaConAlgo,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																rdbtnMediana)
														.addComponent(
																textField,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																rdbtnIntensiva)
														.addComponent(
																txtActivaSinEjercicio,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																rdbtnGrande)
														.addComponent(
																txtActivaConEjercicio,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																txtComplexionFisica,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																rdbtnPequea)
														.addComponent(
																rdbtnMediana_1)
														.addComponent(
																rdbtnGrande_1))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(txtComplexionFisica_1,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																preferencia1,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																preferencia2,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																preferencia3,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																preferencia4,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																preferencia5,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addGap(44).addComponent(siguiente)
										.addGap(53)));
		frame.getContentPane().setLayout(groupLayout);

	}
}
