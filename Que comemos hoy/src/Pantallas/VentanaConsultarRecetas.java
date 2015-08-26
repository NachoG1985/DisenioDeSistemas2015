package Pantallas;

import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.DefaultComboBoxModel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollBar;
import javax.swing.JSeparator;
import javax.swing.JTextField;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.SwingConstants;

public class VentanaConsultarRecetas {

	private JFrame frame;
	private JTextField txtqueComemosHoy;
	private JTextField txtCatalogoAConsultar;
	private JTextField txtFiltrosDeRecetas;
	private JTextField txtDificultad;
	private JTextField txtCalificacion;
	private JTextField txtMaximoCalorias;
	private JTextField txtTemporada;
	private JTextField txtIngredientePrincipal;
	private JTextField txtSectorPiramideAlimenticia;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			@Override
			public void run() {
				try {
					VentanaConsultarRecetas window = new VentanaConsultarRecetas();
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
	public VentanaConsultarRecetas() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 800, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		txtqueComemosHoy = new JTextField();
		txtqueComemosHoy.setEditable(false);
		txtqueComemosHoy.setFont(new Font("Arial Black", Font.PLAIN, 16));
		txtqueComemosHoy.setText("\u00BFQue comemos hoy?");
		txtqueComemosHoy.setHorizontalAlignment(SwingConstants.CENTER);
		txtqueComemosHoy.setColumns(10);

		JButton btnNewButton = new JButton("home");
		btnNewButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent arg0) {
			}
		});

		JButton btnCargarReceta = new JButton("cargar receta");

		JButton btnSalir = new JButton("salir");

		JPanel panel = new JPanel();

		JPanel panel_1 = new JPanel();
		GroupLayout groupLayout = new GroupLayout(frame.getContentPane());
		groupLayout
				.setHorizontalGroup(groupLayout
						.createParallelGroup(Alignment.TRAILING)
						.addGroup(
								groupLayout
										.createSequentialGroup()
										.addContainerGap()
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.LEADING)
														.addGroup(
																groupLayout
																		.createSequentialGroup()
																		.addComponent(
																				txtqueComemosHoy,
																				GroupLayout.PREFERRED_SIZE,
																				419,
																				GroupLayout.PREFERRED_SIZE)
																		.addGap(22)
																		.addComponent(
																				btnNewButton,
																				GroupLayout.PREFERRED_SIZE,
																				89,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				btnCargarReceta)
																		.addPreferredGap(
																				ComponentPlacement.UNRELATED)
																		.addComponent(
																				btnSalir,
																				GroupLayout.PREFERRED_SIZE,
																				72,
																				GroupLayout.PREFERRED_SIZE))
														.addGroup(
																groupLayout
																		.createSequentialGroup()
																		.addComponent(
																				panel,
																				GroupLayout.PREFERRED_SIZE,
																				163,
																				GroupLayout.PREFERRED_SIZE)
																		.addPreferredGap(
																				ComponentPlacement.RELATED)
																		.addComponent(
																				panel_1,
																				GroupLayout.PREFERRED_SIZE,
																				594,
																				GroupLayout.PREFERRED_SIZE)))
										.addContainerGap(11, Short.MAX_VALUE)));
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
																Alignment.LEADING)
														.addComponent(
																btnSalir,
																GroupLayout.PREFERRED_SIZE,
																41,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																txtqueComemosHoy,
																GroupLayout.PREFERRED_SIZE,
																41,
																GroupLayout.PREFERRED_SIZE)
														.addGroup(
																groupLayout
																		.createParallelGroup(
																				Alignment.BASELINE)
																		.addComponent(
																				btnCargarReceta,
																				GroupLayout.PREFERRED_SIZE,
																				41,
																				GroupLayout.PREFERRED_SIZE)
																		.addComponent(
																				btnNewButton,
																				GroupLayout.PREFERRED_SIZE,
																				41,
																				GroupLayout.PREFERRED_SIZE)))
										.addPreferredGap(
												ComponentPlacement.UNRELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.LEADING)
														.addComponent(
																panel,
																GroupLayout.PREFERRED_SIZE,
																341,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																panel_1,
																GroupLayout.DEFAULT_SIZE,
																488,
																Short.MAX_VALUE))
										.addContainerGap()));

		JScrollBar scrollBar = new JScrollBar();
		GroupLayout gl_panel_1 = new GroupLayout(panel_1);
		gl_panel_1.setHorizontalGroup(gl_panel_1.createParallelGroup(
				Alignment.TRAILING).addGroup(
				gl_panel_1
						.createSequentialGroup()
						.addContainerGap(577, Short.MAX_VALUE)
						.addComponent(scrollBar, GroupLayout.PREFERRED_SIZE,
								GroupLayout.DEFAULT_SIZE,
								GroupLayout.PREFERRED_SIZE)));
		gl_panel_1.setVerticalGroup(gl_panel_1.createParallelGroup(
				Alignment.TRAILING).addComponent(scrollBar,
				GroupLayout.DEFAULT_SIZE, 488, Short.MAX_VALUE));
		panel_1.setLayout(gl_panel_1);

		txtCatalogoAConsultar = new JTextField();
		txtCatalogoAConsultar.setFont(new Font("Tahoma", Font.BOLD, 11));
		txtCatalogoAConsultar.setEditable(false);
		txtCatalogoAConsultar.setHorizontalAlignment(SwingConstants.CENTER);
		txtCatalogoAConsultar.setText("Catalogo a consultar");
		txtCatalogoAConsultar.setColumns(10);

		JRadioButton rdbtnNewRadioButton = new JRadioButton("Todas");

		JRadioButton rdbtnSoloPropias = new JRadioButton("Solo propias");

		JRadioButton rdbtnSoloGenerales = new JRadioButton("Solo generales");

		JSeparator separator = new JSeparator();

		txtFiltrosDeRecetas = new JTextField();
		txtFiltrosDeRecetas.setFont(new Font("Tahoma", Font.BOLD, 11));
		txtFiltrosDeRecetas.setEditable(false);
		txtFiltrosDeRecetas.setHorizontalAlignment(SwingConstants.CENTER);
		txtFiltrosDeRecetas.setText("Filtros de recetas");
		txtFiltrosDeRecetas.setColumns(10);

		JComboBox comboBox = new JComboBox();
		comboBox.setModel(new DefaultComboBoxModel(new String[]{"", "1", "2",
				"3", "4", "5"}));

		txtDificultad = new JTextField();
		txtDificultad.setEditable(false);
		txtDificultad.setText("Dificultad");
		txtDificultad.setColumns(10);

		txtCalificacion = new JTextField();
		txtCalificacion.setText("Calificacion");
		txtCalificacion.setEditable(false);
		txtCalificacion.setColumns(10);

		JComboBox comboBox_1 = new JComboBox();
		comboBox_1.setModel(new DefaultComboBoxModel(new String[]{"", "0", "1",
				"2", "3", "4", "5"}));

		txtMaximoCalorias = new JTextField();
		txtMaximoCalorias.setHorizontalAlignment(SwingConstants.CENTER);
		txtMaximoCalorias.setText("Maximo calorias");
		txtMaximoCalorias.setColumns(10);

		txtTemporada = new JTextField();
		txtTemporada.setHorizontalAlignment(SwingConstants.CENTER);
		txtTemporada.setText("Temporada");
		txtTemporada.setColumns(10);

		txtIngredientePrincipal = new JTextField();
		txtIngredientePrincipal.setHorizontalAlignment(SwingConstants.CENTER);
		txtIngredientePrincipal.setText("Ingrediente principal");
		txtIngredientePrincipal.setColumns(10);

		txtSectorPiramideAlimenticia = new JTextField();
		txtSectorPiramideAlimenticia.setText("Sector piramide alimenticia");
		txtSectorPiramideAlimenticia
				.setHorizontalAlignment(SwingConstants.CENTER);
		txtSectorPiramideAlimenticia.setColumns(10);

		JButton btnNewButton_1 = new JButton("Aplicar filtros");
		GroupLayout gl_panel = new GroupLayout(panel);
		gl_panel.setHorizontalGroup(gl_panel
				.createParallelGroup(Alignment.TRAILING)
				.addGroup(
						Alignment.LEADING,
						gl_panel.createSequentialGroup()
								.addContainerGap()
								.addGroup(
										gl_panel.createParallelGroup(
												Alignment.LEADING)
												.addComponent(
														btnNewButton_1,
														GroupLayout.DEFAULT_SIZE,
														143, Short.MAX_VALUE)
												.addComponent(
														txtTemporada,
														GroupLayout.DEFAULT_SIZE,
														144, Short.MAX_VALUE)
												.addComponent(
														txtMaximoCalorias,
														GroupLayout.DEFAULT_SIZE,
														143, Short.MAX_VALUE)
												.addComponent(
														separator,
														GroupLayout.DEFAULT_SIZE,
														143, Short.MAX_VALUE)
												.addComponent(
														rdbtnSoloGenerales)
												.addComponent(rdbtnSoloPropias)
												.addComponent(
														rdbtnNewRadioButton)
												.addComponent(
														txtCatalogoAConsultar,
														GroupLayout.DEFAULT_SIZE,
														143, Short.MAX_VALUE)
												.addComponent(
														txtFiltrosDeRecetas,
														GroupLayout.DEFAULT_SIZE,
														143, Short.MAX_VALUE)
												.addGroup(
														Alignment.TRAILING,
														gl_panel.createSequentialGroup()
																.addComponent(
																		txtDificultad,
																		GroupLayout.PREFERRED_SIZE,
																		GroupLayout.DEFAULT_SIZE,
																		GroupLayout.PREFERRED_SIZE)
																.addPreferredGap(
																		ComponentPlacement.RELATED,
																		96,
																		Short.MAX_VALUE)
																.addComponent(
																		comboBox,
																		GroupLayout.PREFERRED_SIZE,
																		41,
																		GroupLayout.PREFERRED_SIZE))
												.addGroup(
														gl_panel.createSequentialGroup()
																.addComponent(
																		txtCalificacion,
																		GroupLayout.PREFERRED_SIZE,
																		86,
																		GroupLayout.PREFERRED_SIZE)
																.addGap(16)
																.addComponent(
																		comboBox_1,
																		0,
																		41,
																		Short.MAX_VALUE))
												.addComponent(
														txtIngredientePrincipal,
														GroupLayout.DEFAULT_SIZE,
														144, Short.MAX_VALUE)
												.addComponent(
														txtSectorPiramideAlimenticia,
														GroupLayout.DEFAULT_SIZE,
														143, Short.MAX_VALUE))
								.addContainerGap()));
		gl_panel.setVerticalGroup(gl_panel
				.createParallelGroup(Alignment.LEADING)
				.addGroup(
						gl_panel.createSequentialGroup()
								.addContainerGap()
								.addComponent(txtCatalogoAConsultar,
										GroupLayout.PREFERRED_SIZE, 19,
										GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.UNRELATED)
								.addComponent(rdbtnNewRadioButton)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(rdbtnSoloPropias)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(rdbtnSoloGenerales)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(separator,
										GroupLayout.PREFERRED_SIZE, 1,
										GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(txtFiltrosDeRecetas,
										GroupLayout.PREFERRED_SIZE,
										GroupLayout.DEFAULT_SIZE,
										GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addGroup(
										gl_panel.createParallelGroup(
												Alignment.BASELINE)
												.addComponent(
														comboBox,
														GroupLayout.PREFERRED_SIZE,
														GroupLayout.DEFAULT_SIZE,
														GroupLayout.PREFERRED_SIZE)
												.addComponent(
														txtDificultad,
														GroupLayout.PREFERRED_SIZE,
														GroupLayout.DEFAULT_SIZE,
														GroupLayout.PREFERRED_SIZE))
								.addPreferredGap(ComponentPlacement.RELATED)
								.addGroup(
										gl_panel.createParallelGroup(
												Alignment.LEADING)
												.addComponent(
														txtCalificacion,
														GroupLayout.PREFERRED_SIZE,
														GroupLayout.DEFAULT_SIZE,
														GroupLayout.PREFERRED_SIZE)
												.addComponent(
														comboBox_1,
														GroupLayout.PREFERRED_SIZE,
														GroupLayout.DEFAULT_SIZE,
														GroupLayout.PREFERRED_SIZE))
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(txtMaximoCalorias,
										GroupLayout.PREFERRED_SIZE,
										GroupLayout.DEFAULT_SIZE,
										GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(txtTemporada,
										GroupLayout.PREFERRED_SIZE,
										GroupLayout.DEFAULT_SIZE,
										GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(txtIngredientePrincipal,
										GroupLayout.PREFERRED_SIZE,
										GroupLayout.DEFAULT_SIZE,
										GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(txtSectorPiramideAlimenticia,
										GroupLayout.PREFERRED_SIZE,
										GroupLayout.DEFAULT_SIZE,
										GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.UNRELATED)
								.addComponent(btnNewButton_1)
								.addContainerGap(16, Short.MAX_VALUE)));
		panel.setLayout(gl_panel);
		frame.getContentPane().setLayout(groupLayout);
	}
}
