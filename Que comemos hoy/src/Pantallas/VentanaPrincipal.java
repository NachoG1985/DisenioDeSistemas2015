package Pantallas;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.Box;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JTextField;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.SwingConstants;

public class VentanaPrincipal {

	private JFrame frame;
	private JTextField txtquComemosHoy;
	private JTextField txtUltimasRecetas;
	private final Component rigidArea = Box.createRigidArea(new Dimension(20,
			20));
	private JTextField txtNombrereceta;
	private JTextField txtCantidadCalorias;
	private JTextField txtIngredientePrincipal;
	private JTextField textField;
	private JTextField txtTemporada;
	private JTextField textField_1;
	private JTextField textField_2;
	private JTextField textField_3;
	private JTextField textField_4;
	private JTextField textField_5;
	private JTextField textField_6;
	private JTextField textField_7;
	private JTextField textField_8;
	private JTextField textField_9;
	private JTextField textField_10;
	private JTextField textField_11;
	private JTextField textField_12;
	private JTextField textField_13;
	private JTextField textField_14;
	private JTextField textField_15;
	private JTextField textField_16;
	private JTextField textField_17;
	private JTextField textField_18;
	private JTextField textField_19;
	private JTextField textField_20;
	private JTextField textField_21;
	private JTextField textField_22;
	private JTextField textField_23;
	private JTextField textField_24;
	private JTextField textField_25;
	private JTextField textField_26;
	private JTextField textField_27;
	private JTextField textField_28;
	private JTextField textField_29;
	private JTextField textField_30;
	private JTextField textField_31;
	private JTextField textField_32;
	private JTextField textField_33;
	private JTextField textField_34;
	private JTextField textField_35;
	private JTextField textField_36;
	private JTextField textField_37;
	private JTextField textField_38;
	private JTextField textField_39;
	private JTextField textField_40;
	private JTextField textField_41;
	private JTextField textField_42;
	private JTextField textField_43;
	private JTextField textField_44;
	private JTextField textField_45;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			@Override
			public void run() {
				try {
					VentanaPrincipal window = new VentanaPrincipal();
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
	public VentanaPrincipal() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 800, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		txtquComemosHoy = new JTextField();
		txtquComemosHoy.setEditable(false);
		txtquComemosHoy.setText("\u00BFQu\u00E9 comemos hoy?");
		txtquComemosHoy.setFont(new Font("Arial Black", Font.PLAIN, 16));
		txtquComemosHoy.setHorizontalAlignment(SwingConstants.CENTER);
		txtquComemosHoy.setColumns(10);

		JButton btnNewButton = new JButton("Consultar recetas");

		JButton btnCargarReceta = new JButton("Cargar receta");

		JButton btnSalir = new JButton("Salir");

		txtUltimasRecetas = new JTextField();
		txtUltimasRecetas.setFont(new Font("Arial Black", Font.PLAIN, 14));
		txtUltimasRecetas.setEditable(false);
		txtUltimasRecetas.setText("Ultimas recetas:");
		txtUltimasRecetas.setColumns(10);

		JPanel receta4 = new JPanel();

		JPanel receta5 = new JPanel();

		JCheckBox checkBox = new JCheckBox("Cena");

		JCheckBox checkBox_1 = new JCheckBox("Merienda");

		JCheckBox checkBox_2 = new JCheckBox("Almuerzo");

		JCheckBox checkBox_3 = new JCheckBox("Desayuno");

		textField_1 = new JTextField();
		textField_1.setText("nombreReceta");
		textField_1.setHorizontalAlignment(SwingConstants.CENTER);
		textField_1.setEditable(false);
		textField_1.setColumns(10);

		textField_2 = new JTextField();
		textField_2.setText("ingrediente principal");
		textField_2.setHorizontalAlignment(SwingConstants.CENTER);
		textField_2.setEditable(false);
		textField_2.setColumns(10);

		textField_3 = new JTextField();
		textField_3.setText("dificultad");
		textField_3.setHorizontalAlignment(SwingConstants.CENTER);
		textField_3.setEditable(false);
		textField_3.setColumns(10);

		textField_4 = new JTextField();
		textField_4.setText("calorias");
		textField_4.setHorizontalAlignment(SwingConstants.CENTER);
		textField_4.setEditable(false);
		textField_4.setColumns(10);

		textField_5 = new JTextField();
		textField_5.setText("Temporada");
		textField_5.setHorizontalAlignment(SwingConstants.CENTER);
		textField_5.setEditable(false);
		textField_5.setColumns(10);
		GroupLayout gl_receta5 = new GroupLayout(receta5);
		gl_receta5
				.setHorizontalGroup(gl_receta5
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGroup(
								gl_receta5
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												gl_receta5
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(checkBox)
														.addComponent(
																checkBox_1)
														.addComponent(
																checkBox_2)
														.addComponent(
																checkBox_3)
														.addComponent(
																textField_1,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addComponent(
																textField_2,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addGroup(
																gl_receta5
																		.createSequentialGroup()
																		.addComponent(
																				textField_3,
																				GroupLayout.PREFERRED_SIZE,
																				55,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				textField_4,
																				GroupLayout.DEFAULT_SIZE,
																				66,
																				Short.MAX_VALUE))
														.addComponent(
																textField_5,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE))
										.addContainerGap()));
		gl_receta5
				.setVerticalGroup(gl_receta5
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGroup(
								gl_receta5
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(textField_1,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												gl_receta5
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																textField_3,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																textField_4,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_2,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_3)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_2)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_1)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_5,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addContainerGap(20, Short.MAX_VALUE)));
		receta5.setLayout(gl_receta5);

		JPanel receta3 = new JPanel();

		JCheckBox checkBox_4 = new JCheckBox("Cena");

		JCheckBox checkBox_5 = new JCheckBox("Merienda");

		JCheckBox checkBox_6 = new JCheckBox("Almuerzo");

		JCheckBox checkBox_7 = new JCheckBox("Desayuno");

		textField_6 = new JTextField();
		textField_6.setText("nombreReceta");
		textField_6.setHorizontalAlignment(SwingConstants.CENTER);
		textField_6.setEditable(false);
		textField_6.setColumns(10);

		textField_7 = new JTextField();
		textField_7.setText("ingrediente principal");
		textField_7.setHorizontalAlignment(SwingConstants.CENTER);
		textField_7.setEditable(false);
		textField_7.setColumns(10);

		textField_8 = new JTextField();
		textField_8.setText("dificultad");
		textField_8.setHorizontalAlignment(SwingConstants.CENTER);
		textField_8.setEditable(false);
		textField_8.setColumns(10);

		textField_9 = new JTextField();
		textField_9.setText("calorias");
		textField_9.setHorizontalAlignment(SwingConstants.CENTER);
		textField_9.setEditable(false);
		textField_9.setColumns(10);

		textField_10 = new JTextField();
		textField_10.setText("Temporada");
		textField_10.setHorizontalAlignment(SwingConstants.CENTER);
		textField_10.setEditable(false);
		textField_10.setColumns(10);
		GroupLayout gl_receta3 = new GroupLayout(receta3);
		gl_receta3
				.setHorizontalGroup(gl_receta3
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGroup(
								gl_receta3
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												gl_receta3
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																checkBox_4)
														.addComponent(
																checkBox_5)
														.addComponent(
																checkBox_6)
														.addComponent(
																checkBox_7)
														.addComponent(
																textField_6,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addComponent(
																textField_7,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addGroup(
																gl_receta3
																		.createSequentialGroup()
																		.addComponent(
																				textField_8,
																				GroupLayout.PREFERRED_SIZE,
																				55,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				textField_9,
																				GroupLayout.DEFAULT_SIZE,
																				66,
																				Short.MAX_VALUE))
														.addComponent(
																textField_10,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE))
										.addContainerGap()));
		gl_receta3
				.setVerticalGroup(gl_receta3
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGroup(
								gl_receta3
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(textField_6,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												gl_receta3
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																textField_8,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																textField_9,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_7,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_7)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_6)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_5)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_4)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_10,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addContainerGap(20, Short.MAX_VALUE)));
		receta3.setLayout(gl_receta3);

		JPanel receta2 = new JPanel();

		JCheckBox checkBox_8 = new JCheckBox("Cena");

		JCheckBox checkBox_9 = new JCheckBox("Merienda");

		JCheckBox checkBox_10 = new JCheckBox("Almuerzo");

		JCheckBox checkBox_11 = new JCheckBox("Desayuno");

		textField_11 = new JTextField();
		textField_11.setText("nombreReceta");
		textField_11.setHorizontalAlignment(SwingConstants.CENTER);
		textField_11.setEditable(false);
		textField_11.setColumns(10);

		textField_12 = new JTextField();
		textField_12.setText("ingrediente principal");
		textField_12.setHorizontalAlignment(SwingConstants.CENTER);
		textField_12.setEditable(false);
		textField_12.setColumns(10);

		textField_13 = new JTextField();
		textField_13.setText("dificultad");
		textField_13.setHorizontalAlignment(SwingConstants.CENTER);
		textField_13.setEditable(false);
		textField_13.setColumns(10);

		textField_14 = new JTextField();
		textField_14.setText("calorias");
		textField_14.setHorizontalAlignment(SwingConstants.CENTER);
		textField_14.setEditable(false);
		textField_14.setColumns(10);

		textField_15 = new JTextField();
		textField_15.setText("Temporada");
		textField_15.setHorizontalAlignment(SwingConstants.CENTER);
		textField_15.setEditable(false);
		textField_15.setColumns(10);
		GroupLayout gl_receta2 = new GroupLayout(receta2);
		gl_receta2
				.setHorizontalGroup(gl_receta2
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGroup(
								gl_receta2
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												gl_receta2
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																checkBox_8)
														.addComponent(
																checkBox_9)
														.addComponent(
																checkBox_10)
														.addComponent(
																checkBox_11)
														.addComponent(
																textField_11,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addComponent(
																textField_12,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addGroup(
																gl_receta2
																		.createSequentialGroup()
																		.addComponent(
																				textField_13,
																				GroupLayout.PREFERRED_SIZE,
																				55,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				textField_14,
																				GroupLayout.DEFAULT_SIZE,
																				66,
																				Short.MAX_VALUE))
														.addComponent(
																textField_15,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE))
										.addContainerGap()));
		gl_receta2
				.setVerticalGroup(gl_receta2
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGroup(
								gl_receta2
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(textField_11,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												gl_receta2
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																textField_13,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																textField_14,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_12,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_11)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_10)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_9)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_8)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_15,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addContainerGap(20, Short.MAX_VALUE)));
		receta2.setLayout(gl_receta2);

		JPanel receta1 = new JPanel();

		JCheckBox checkBox_12 = new JCheckBox("Cena");

		JCheckBox checkBox_13 = new JCheckBox("Merienda");

		JCheckBox checkBox_14 = new JCheckBox("Almuerzo");

		JCheckBox checkBox_15 = new JCheckBox("Desayuno");

		textField_16 = new JTextField();
		textField_16.setText("nombreReceta");
		textField_16.setHorizontalAlignment(SwingConstants.CENTER);
		textField_16.setEditable(false);
		textField_16.setColumns(10);

		textField_17 = new JTextField();
		textField_17.setText("ingrediente principal");
		textField_17.setHorizontalAlignment(SwingConstants.CENTER);
		textField_17.setEditable(false);
		textField_17.setColumns(10);

		textField_18 = new JTextField();
		textField_18.setText("dificultad");
		textField_18.setHorizontalAlignment(SwingConstants.CENTER);
		textField_18.setEditable(false);
		textField_18.setColumns(10);

		textField_19 = new JTextField();
		textField_19.setText("calorias");
		textField_19.setHorizontalAlignment(SwingConstants.CENTER);
		textField_19.setEditable(false);
		textField_19.setColumns(10);

		textField_20 = new JTextField();
		textField_20.setText("Temporada");
		textField_20.setHorizontalAlignment(SwingConstants.CENTER);
		textField_20.setEditable(false);
		textField_20.setColumns(10);
		GroupLayout gl_receta1 = new GroupLayout(receta1);
		gl_receta1
				.setHorizontalGroup(gl_receta1
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGroup(
								gl_receta1
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												gl_receta1
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																checkBox_12)
														.addComponent(
																checkBox_13)
														.addComponent(
																checkBox_14)
														.addComponent(
																checkBox_15)
														.addComponent(
																textField_16,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addComponent(
																textField_17,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addGroup(
																gl_receta1
																		.createSequentialGroup()
																		.addComponent(
																				textField_18,
																				GroupLayout.PREFERRED_SIZE,
																				55,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				textField_19,
																				GroupLayout.DEFAULT_SIZE,
																				66,
																				Short.MAX_VALUE))
														.addComponent(
																textField_20,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE))
										.addContainerGap()));
		gl_receta1
				.setVerticalGroup(gl_receta1
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGroup(
								gl_receta1
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(textField_16,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												gl_receta1
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																textField_18,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																textField_19,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_17,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_15)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_14)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_13)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_12)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_20,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addContainerGap(20, Short.MAX_VALUE)));
		receta1.setLayout(gl_receta1);

		JPanel receta6 = new JPanel();

		JCheckBox checkBox_16 = new JCheckBox("Cena");

		JCheckBox checkBox_17 = new JCheckBox("Merienda");

		JCheckBox checkBox_18 = new JCheckBox("Almuerzo");

		JCheckBox checkBox_19 = new JCheckBox("Desayuno");

		textField_21 = new JTextField();
		textField_21.setText("nombreReceta");
		textField_21.setHorizontalAlignment(SwingConstants.CENTER);
		textField_21.setEditable(false);
		textField_21.setColumns(10);

		textField_22 = new JTextField();
		textField_22.setText("ingrediente principal");
		textField_22.setHorizontalAlignment(SwingConstants.CENTER);
		textField_22.setEditable(false);
		textField_22.setColumns(10);

		textField_23 = new JTextField();
		textField_23.setText("dificultad");
		textField_23.setHorizontalAlignment(SwingConstants.CENTER);
		textField_23.setEditable(false);
		textField_23.setColumns(10);

		textField_24 = new JTextField();
		textField_24.setText("calorias");
		textField_24.setHorizontalAlignment(SwingConstants.CENTER);
		textField_24.setEditable(false);
		textField_24.setColumns(10);

		textField_25 = new JTextField();
		textField_25.setText("Temporada");
		textField_25.setHorizontalAlignment(SwingConstants.CENTER);
		textField_25.setEditable(false);
		textField_25.setColumns(10);
		GroupLayout gl_receta6 = new GroupLayout(receta6);
		gl_receta6
				.setHorizontalGroup(gl_receta6
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGroup(
								gl_receta6
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												gl_receta6
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																checkBox_16)
														.addComponent(
																checkBox_17)
														.addComponent(
																checkBox_18)
														.addComponent(
																checkBox_19)
														.addComponent(
																textField_21,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addComponent(
																textField_22,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addGroup(
																gl_receta6
																		.createSequentialGroup()
																		.addComponent(
																				textField_23,
																				GroupLayout.PREFERRED_SIZE,
																				55,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				textField_24,
																				GroupLayout.DEFAULT_SIZE,
																				66,
																				Short.MAX_VALUE))
														.addComponent(
																textField_25,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE))
										.addContainerGap()));
		gl_receta6
				.setVerticalGroup(gl_receta6
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGroup(
								gl_receta6
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(textField_21,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												gl_receta6
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																textField_23,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																textField_24,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_22,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_19)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_18)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_17)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_16)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_25,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addContainerGap(20, Short.MAX_VALUE)));
		receta6.setLayout(gl_receta6);

		JPanel receta7 = new JPanel();

		JCheckBox checkBox_20 = new JCheckBox("Cena");

		JCheckBox checkBox_21 = new JCheckBox("Merienda");

		JCheckBox checkBox_22 = new JCheckBox("Almuerzo");

		JCheckBox checkBox_23 = new JCheckBox("Desayuno");

		textField_26 = new JTextField();
		textField_26.setText("nombreReceta");
		textField_26.setHorizontalAlignment(SwingConstants.CENTER);
		textField_26.setEditable(false);
		textField_26.setColumns(10);

		textField_27 = new JTextField();
		textField_27.setText("ingrediente principal");
		textField_27.setHorizontalAlignment(SwingConstants.CENTER);
		textField_27.setEditable(false);
		textField_27.setColumns(10);

		textField_28 = new JTextField();
		textField_28.setText("dificultad");
		textField_28.setHorizontalAlignment(SwingConstants.CENTER);
		textField_28.setEditable(false);
		textField_28.setColumns(10);

		textField_29 = new JTextField();
		textField_29.setText("calorias");
		textField_29.setHorizontalAlignment(SwingConstants.CENTER);
		textField_29.setEditable(false);
		textField_29.setColumns(10);

		textField_30 = new JTextField();
		textField_30.setText("Temporada");
		textField_30.setHorizontalAlignment(SwingConstants.CENTER);
		textField_30.setEditable(false);
		textField_30.setColumns(10);
		GroupLayout gl_receta7 = new GroupLayout(receta7);
		gl_receta7
				.setHorizontalGroup(gl_receta7
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGroup(
								gl_receta7
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												gl_receta7
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																checkBox_20)
														.addComponent(
																checkBox_21)
														.addComponent(
																checkBox_22)
														.addComponent(
																checkBox_23)
														.addComponent(
																textField_26,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addComponent(
																textField_27,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addGroup(
																gl_receta7
																		.createSequentialGroup()
																		.addComponent(
																				textField_28,
																				GroupLayout.PREFERRED_SIZE,
																				55,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				textField_29,
																				GroupLayout.DEFAULT_SIZE,
																				66,
																				Short.MAX_VALUE))
														.addComponent(
																textField_30,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE))
										.addContainerGap()));
		gl_receta7
				.setVerticalGroup(gl_receta7
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGroup(
								gl_receta7
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(textField_26,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												gl_receta7
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																textField_28,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																textField_29,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_27,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_23)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_22)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_21)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_20)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_30,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addContainerGap(20, Short.MAX_VALUE)));
		receta7.setLayout(gl_receta7);

		JPanel receta8 = new JPanel();

		JCheckBox checkBox_24 = new JCheckBox("Cena");

		JCheckBox checkBox_25 = new JCheckBox("Merienda");

		JCheckBox checkBox_26 = new JCheckBox("Almuerzo");

		JCheckBox checkBox_27 = new JCheckBox("Desayuno");

		textField_31 = new JTextField();
		textField_31.setText("nombreReceta");
		textField_31.setHorizontalAlignment(SwingConstants.CENTER);
		textField_31.setEditable(false);
		textField_31.setColumns(10);

		textField_32 = new JTextField();
		textField_32.setText("ingrediente principal");
		textField_32.setHorizontalAlignment(SwingConstants.CENTER);
		textField_32.setEditable(false);
		textField_32.setColumns(10);

		textField_33 = new JTextField();
		textField_33.setText("dificultad");
		textField_33.setHorizontalAlignment(SwingConstants.CENTER);
		textField_33.setEditable(false);
		textField_33.setColumns(10);

		textField_34 = new JTextField();
		textField_34.setText("calorias");
		textField_34.setHorizontalAlignment(SwingConstants.CENTER);
		textField_34.setEditable(false);
		textField_34.setColumns(10);

		textField_35 = new JTextField();
		textField_35.setText("Temporada");
		textField_35.setHorizontalAlignment(SwingConstants.CENTER);
		textField_35.setEditable(false);
		textField_35.setColumns(10);
		GroupLayout gl_receta8 = new GroupLayout(receta8);
		gl_receta8
				.setHorizontalGroup(gl_receta8
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGroup(
								gl_receta8
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												gl_receta8
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																checkBox_24)
														.addComponent(
																checkBox_25)
														.addComponent(
																checkBox_26)
														.addComponent(
																checkBox_27)
														.addComponent(
																textField_31,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addComponent(
																textField_32,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addGroup(
																gl_receta8
																		.createSequentialGroup()
																		.addComponent(
																				textField_33,
																				GroupLayout.PREFERRED_SIZE,
																				55,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				textField_34,
																				GroupLayout.DEFAULT_SIZE,
																				66,
																				Short.MAX_VALUE))
														.addComponent(
																textField_35,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE))
										.addContainerGap()));
		gl_receta8
				.setVerticalGroup(gl_receta8
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGroup(
								gl_receta8
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(textField_31,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												gl_receta8
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																textField_33,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																textField_34,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_32,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_27)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_26)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_25)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_24)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_35,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addContainerGap(20, Short.MAX_VALUE)));
		receta8.setLayout(gl_receta8);

		JPanel receta9 = new JPanel();

		JCheckBox checkBox_28 = new JCheckBox("Cena");

		JCheckBox checkBox_29 = new JCheckBox("Merienda");

		JCheckBox checkBox_30 = new JCheckBox("Almuerzo");

		JCheckBox checkBox_31 = new JCheckBox("Desayuno");

		textField_36 = new JTextField();
		textField_36.setText("nombreReceta");
		textField_36.setHorizontalAlignment(SwingConstants.CENTER);
		textField_36.setEditable(false);
		textField_36.setColumns(10);

		textField_37 = new JTextField();
		textField_37.setText("ingrediente principal");
		textField_37.setHorizontalAlignment(SwingConstants.CENTER);
		textField_37.setEditable(false);
		textField_37.setColumns(10);

		textField_38 = new JTextField();
		textField_38.setText("dificultad");
		textField_38.setHorizontalAlignment(SwingConstants.CENTER);
		textField_38.setEditable(false);
		textField_38.setColumns(10);

		textField_39 = new JTextField();
		textField_39.setText("calorias");
		textField_39.setHorizontalAlignment(SwingConstants.CENTER);
		textField_39.setEditable(false);
		textField_39.setColumns(10);

		textField_40 = new JTextField();
		textField_40.setText("Temporada");
		textField_40.setHorizontalAlignment(SwingConstants.CENTER);
		textField_40.setEditable(false);
		textField_40.setColumns(10);
		GroupLayout gl_receta9 = new GroupLayout(receta9);
		gl_receta9
				.setHorizontalGroup(gl_receta9
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGroup(
								gl_receta9
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												gl_receta9
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																checkBox_28)
														.addComponent(
																checkBox_29)
														.addComponent(
																checkBox_30)
														.addComponent(
																checkBox_31)
														.addComponent(
																textField_36,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addComponent(
																textField_37,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addGroup(
																gl_receta9
																		.createSequentialGroup()
																		.addComponent(
																				textField_38,
																				GroupLayout.PREFERRED_SIZE,
																				55,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				textField_39,
																				GroupLayout.DEFAULT_SIZE,
																				66,
																				Short.MAX_VALUE))
														.addComponent(
																textField_40,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE))
										.addContainerGap()));
		gl_receta9
				.setVerticalGroup(gl_receta9
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGroup(
								gl_receta9
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(textField_36,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												gl_receta9
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																textField_38,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																textField_39,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_37,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_31)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_30)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_29)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_28)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_40,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addContainerGap(20, Short.MAX_VALUE)));
		receta9.setLayout(gl_receta9);

		JPanel receta10 = new JPanel();

		JCheckBox checkBox_32 = new JCheckBox("Cena");

		JCheckBox checkBox_33 = new JCheckBox("Merienda");

		JCheckBox checkBox_34 = new JCheckBox("Almuerzo");

		JCheckBox checkBox_35 = new JCheckBox("Desayuno");

		textField_41 = new JTextField();
		textField_41.setText("nombreReceta");
		textField_41.setHorizontalAlignment(SwingConstants.CENTER);
		textField_41.setEditable(false);
		textField_41.setColumns(10);

		textField_42 = new JTextField();
		textField_42.setText("ingrediente principal");
		textField_42.setHorizontalAlignment(SwingConstants.CENTER);
		textField_42.setEditable(false);
		textField_42.setColumns(10);

		textField_43 = new JTextField();
		textField_43.setText("dificultad");
		textField_43.setHorizontalAlignment(SwingConstants.CENTER);
		textField_43.setEditable(false);
		textField_43.setColumns(10);

		textField_44 = new JTextField();
		textField_44.setText("calorias");
		textField_44.setHorizontalAlignment(SwingConstants.CENTER);
		textField_44.setEditable(false);
		textField_44.setColumns(10);

		textField_45 = new JTextField();
		textField_45.setText("Temporada");
		textField_45.setHorizontalAlignment(SwingConstants.CENTER);
		textField_45.setEditable(false);
		textField_45.setColumns(10);
		GroupLayout gl_receta10 = new GroupLayout(receta10);
		gl_receta10
				.setHorizontalGroup(gl_receta10
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGap(0, 147, Short.MAX_VALUE)
						.addGroup(
								gl_receta10
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												gl_receta10
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																checkBox_32)
														.addComponent(
																checkBox_33)
														.addComponent(
																checkBox_34)
														.addComponent(
																checkBox_35)
														.addComponent(
																textField_41,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addComponent(
																textField_42,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addGroup(
																gl_receta10
																		.createSequentialGroup()
																		.addComponent(
																				textField_43,
																				GroupLayout.PREFERRED_SIZE,
																				55,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				textField_44,
																				GroupLayout.DEFAULT_SIZE,
																				66,
																				Short.MAX_VALUE))
														.addComponent(
																textField_45,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE))
										.addContainerGap()));
		gl_receta10
				.setVerticalGroup(gl_receta10
						.createParallelGroup(Alignment.LEADING)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGap(0, 219, Short.MAX_VALUE)
						.addGroup(
								gl_receta10
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(textField_41,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												gl_receta10
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																textField_43,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																textField_44,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_42,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_35)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_34)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_33)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(checkBox_32)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(textField_45,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addContainerGap(20, Short.MAX_VALUE)));
		receta10.setLayout(gl_receta10);
		GroupLayout groupLayout = new GroupLayout(frame.getContentPane());
		groupLayout
				.setHorizontalGroup(groupLayout
						.createParallelGroup(Alignment.TRAILING)
						.addGroup(
								groupLayout
										.createSequentialGroup()
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.LEADING)
														.addGroup(
																groupLayout
																		.createSequentialGroup()
																		.addContainerGap()
																		.addGroup(
																				groupLayout
																						.createParallelGroup(
																								Alignment.LEADING)
																						.addComponent(
																								txtUltimasRecetas,
																								Alignment.TRAILING,
																								GroupLayout.DEFAULT_SIZE,
																								764,
																								Short.MAX_VALUE)
																						.addGroup(
																								Alignment.TRAILING,
																								groupLayout
																										.createSequentialGroup()
																										.addComponent(
																												txtquComemosHoy,
																												GroupLayout.PREFERRED_SIZE,
																												358,
																												GroupLayout.PREFERRED_SIZE)
																										.addPreferredGap(
																												ComponentPlacement.UNRELATED)
																										.addComponent(
																												btnNewButton)
																										.addPreferredGap(
																												ComponentPlacement.RELATED)
																										.addComponent(
																												btnCargarReceta,
																												GroupLayout.PREFERRED_SIZE,
																												117,
																												GroupLayout.PREFERRED_SIZE)
																										.addPreferredGap(
																												ComponentPlacement.RELATED)
																										.addComponent(
																												btnSalir,
																												GroupLayout.PREFERRED_SIZE,
																												117,
																												GroupLayout.PREFERRED_SIZE))
																						.addGroup(
																								Alignment.TRAILING,
																								groupLayout
																										.createSequentialGroup()
																										.addComponent(
																												receta1,
																												GroupLayout.PREFERRED_SIZE,
																												147,
																												GroupLayout.PREFERRED_SIZE)
																										.addPreferredGap(
																												ComponentPlacement.RELATED)
																										.addComponent(
																												receta2,
																												GroupLayout.PREFERRED_SIZE,
																												147,
																												GroupLayout.PREFERRED_SIZE)
																										.addPreferredGap(
																												ComponentPlacement.RELATED)
																										.addComponent(
																												receta3,
																												GroupLayout.PREFERRED_SIZE,
																												147,
																												GroupLayout.PREFERRED_SIZE)
																										.addPreferredGap(
																												ComponentPlacement.RELATED)
																										.addComponent(
																												receta4,
																												GroupLayout.PREFERRED_SIZE,
																												147,
																												GroupLayout.PREFERRED_SIZE)
																										.addPreferredGap(
																												ComponentPlacement.RELATED)
																										.addComponent(
																												receta5,
																												GroupLayout.PREFERRED_SIZE,
																												147,
																												GroupLayout.PREFERRED_SIZE))))
														.addGroup(
																Alignment.TRAILING,
																groupLayout
																		.createSequentialGroup()
																		.addGap(15)
																		.addComponent(
																				receta6,
																				GroupLayout.PREFERRED_SIZE,
																				147,
																				GroupLayout.PREFERRED_SIZE)
																		.addGap(6)
																		.addComponent(
																				receta7,
																				GroupLayout.PREFERRED_SIZE,
																				147,
																				GroupLayout.PREFERRED_SIZE)
																		.addGap(6)
																		.addComponent(
																				receta8,
																				GroupLayout.PREFERRED_SIZE,
																				147,
																				GroupLayout.PREFERRED_SIZE)
																		.addGap(6)
																		.addComponent(
																				receta9,
																				GroupLayout.PREFERRED_SIZE,
																				147,
																				GroupLayout.PREFERRED_SIZE)
																		.addGap(6)
																		.addComponent(
																				receta10,
																				GroupLayout.DEFAULT_SIZE,
																				147,
																				Short.MAX_VALUE)))
										.addContainerGap()));
		groupLayout
				.setVerticalGroup(groupLayout
						.createParallelGroup(Alignment.LEADING)
						.addGroup(
								groupLayout
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																txtquComemosHoy,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																btnNewButton,
																GroupLayout.PREFERRED_SIZE,
																28,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																btnCargarReceta,
																GroupLayout.PREFERRED_SIZE,
																28,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																btnSalir,
																GroupLayout.PREFERRED_SIZE,
																28,
																GroupLayout.PREFERRED_SIZE))
										.addGap(18)
										.addComponent(txtUltimasRecetas,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.UNRELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																receta4,
																GroupLayout.PREFERRED_SIZE,
																219,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																receta5,
																GroupLayout.PREFERRED_SIZE,
																219,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																receta3,
																GroupLayout.PREFERRED_SIZE,
																219,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																receta2,
																GroupLayout.PREFERRED_SIZE,
																219,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																receta1,
																GroupLayout.PREFERRED_SIZE,
																219,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																receta6,
																GroupLayout.PREFERRED_SIZE,
																219,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																receta7,
																GroupLayout.PREFERRED_SIZE,
																219,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																receta8,
																GroupLayout.PREFERRED_SIZE,
																219,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																receta9,
																GroupLayout.PREFERRED_SIZE,
																219,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																receta10,
																GroupLayout.DEFAULT_SIZE,
																219,
																Short.MAX_VALUE))
										.addGap(302)));

		txtNombrereceta = new JTextField();
		txtNombrereceta.setHorizontalAlignment(SwingConstants.CENTER);
		txtNombrereceta.setEditable(false);
		txtNombrereceta.setText("nombreReceta");
		txtNombrereceta.setColumns(10);

		txtCantidadCalorias = new JTextField();
		txtCantidadCalorias.setEditable(false);
		txtCantidadCalorias.setHorizontalAlignment(SwingConstants.CENTER);
		txtCantidadCalorias.setText("dificultad");
		txtCantidadCalorias.setColumns(10);

		txtIngredientePrincipal = new JTextField();
		txtIngredientePrincipal.setEditable(false);
		txtIngredientePrincipal.setText("ingrediente principal");
		txtIngredientePrincipal.setHorizontalAlignment(SwingConstants.CENTER);
		txtIngredientePrincipal.setColumns(10);

		textField = new JTextField();
		textField.setText("calorias");
		textField.setHorizontalAlignment(SwingConstants.CENTER);
		textField.setEditable(false);
		textField.setColumns(10);

		JCheckBox chckbxDesayuno = new JCheckBox("Desayuno");

		JCheckBox chckbxAlmuerzo = new JCheckBox("Almuerzo");

		JCheckBox chckbxMerienda = new JCheckBox("Merienda");

		JCheckBox chckbxCena = new JCheckBox("Cena");

		txtTemporada = new JTextField();
		txtTemporada.setEditable(false);
		txtTemporada.setHorizontalAlignment(SwingConstants.CENTER);
		txtTemporada.setText("Temporada");
		txtTemporada.setColumns(10);
		GroupLayout gl_receta4 = new GroupLayout(receta4);
		gl_receta4
				.setHorizontalGroup(gl_receta4
						.createParallelGroup(Alignment.LEADING)
						.addGroup(
								gl_receta4
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												gl_receta4
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																chckbxCena)
														.addComponent(
																chckbxMerienda)
														.addComponent(
																chckbxAlmuerzo)
														.addComponent(
																chckbxDesayuno)
														.addComponent(
																txtNombrereceta,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addComponent(
																txtIngredientePrincipal,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE)
														.addGroup(
																gl_receta4
																		.createSequentialGroup()
																		.addComponent(
																				txtCantidadCalorias,
																				GroupLayout.PREFERRED_SIZE,
																				55,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				textField,
																				GroupLayout.DEFAULT_SIZE,
																				66,
																				Short.MAX_VALUE))
														.addComponent(
																txtTemporada,
																GroupLayout.DEFAULT_SIZE,
																127,
																Short.MAX_VALUE))
										.addContainerGap()));
		gl_receta4
				.setVerticalGroup(gl_receta4
						.createParallelGroup(Alignment.LEADING)
						.addGroup(
								gl_receta4
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(txtNombrereceta,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addGroup(
												gl_receta4
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																txtCantidadCalorias,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																textField,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(txtIngredientePrincipal,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(chckbxDesayuno)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(chckbxAlmuerzo)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(chckbxMerienda)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(chckbxCena)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(txtTemporada,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addContainerGap(20, Short.MAX_VALUE)));
		receta4.setLayout(gl_receta4);
		frame.getContentPane().setLayout(groupLayout);
	}
	private static void addPopup(Component component, final JPopupMenu popup) {
		component.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				if (e.isPopupTrigger()) {
					showMenu(e);
				}
			}
			@Override
			public void mouseReleased(MouseEvent e) {
				if (e.isPopupTrigger()) {
					showMenu(e);
				}
			}
			private void showMenu(MouseEvent e) {
				popup.show(e.getComponent(), e.getX(), e.getY());
			}
		});
	}
}
