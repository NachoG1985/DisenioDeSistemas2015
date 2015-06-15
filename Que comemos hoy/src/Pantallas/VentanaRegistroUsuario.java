package Pantallas;

import java.awt.EventQueue;
import java.awt.Font;

import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.SwingConstants;

public class VentanaRegistroUsuario {

	private JFrame frame;
	private JTextField txtRegistroDeUsuario;
	private JTextField txtNombreDeUsuario;
	private JTextField txtDireccionDeEmail;
	private JTextField txtConfirmeDireccionDe;
	private JTextField txtFechaDeNacimiento;
	private JTextField txtDd;
	private JTextField txtMm;
	private JTextField txtAaaa;
	private JPasswordField pwdContrasea;
	private JTextField txtContrasea;
	private JTextField txtConfirmeContrasea;
	private JPasswordField passwordField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			@Override
			public void run() {
				try {
					VentanaRegistroUsuario window = new VentanaRegistroUsuario();
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
	public VentanaRegistroUsuario() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 800, 600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		txtRegistroDeUsuario = new JTextField();
		txtRegistroDeUsuario.setText("Registro de usuario");
		txtRegistroDeUsuario.setHorizontalAlignment(SwingConstants.CENTER);
		txtRegistroDeUsuario.setFont(new Font("Arial Black", Font.PLAIN, 16));
		txtRegistroDeUsuario.setColumns(10);

		txtNombreDeUsuario = new JTextField();
		txtNombreDeUsuario.setHorizontalAlignment(SwingConstants.CENTER);
		txtNombreDeUsuario.setText("nombre de usuario");
		txtNombreDeUsuario.setColumns(10);

		txtDireccionDeEmail = new JTextField();
		txtDireccionDeEmail.setText("direccion de email");
		txtDireccionDeEmail.setHorizontalAlignment(SwingConstants.CENTER);
		txtDireccionDeEmail.setColumns(10);

		txtConfirmeDireccionDe = new JTextField();
		txtConfirmeDireccionDe.setText("confirme direccion de email");
		txtConfirmeDireccionDe.setHorizontalAlignment(SwingConstants.CENTER);
		txtConfirmeDireccionDe.setColumns(10);

		txtFechaDeNacimiento = new JTextField();
		txtFechaDeNacimiento.setEditable(false);
		txtFechaDeNacimiento.setText("fecha de nacimiento:");
		txtFechaDeNacimiento.setHorizontalAlignment(SwingConstants.LEFT);
		txtFechaDeNacimiento.setColumns(10);

		txtDd = new JTextField();
		txtDd.setHorizontalAlignment(SwingConstants.CENTER);
		txtDd.setText("dd");
		txtDd.setColumns(10);

		txtMm = new JTextField();
		txtMm.setText("mm");
		txtMm.setHorizontalAlignment(SwingConstants.CENTER);
		txtMm.setColumns(10);

		txtAaaa = new JTextField();
		txtAaaa.setText("aaaa");
		txtAaaa.setHorizontalAlignment(SwingConstants.CENTER);
		txtAaaa.setColumns(10);

		pwdContrasea = new JPasswordField();
		pwdContrasea.setHorizontalAlignment(SwingConstants.CENTER);
		pwdContrasea.setText("contrase\u00F1a");

		txtContrasea = new JTextField();
		txtContrasea.setText("contrase\u00F1a:");
		txtContrasea.setHorizontalAlignment(SwingConstants.LEFT);
		txtContrasea.setEditable(false);
		txtContrasea.setColumns(10);

		txtConfirmeContrasea = new JTextField();
		txtConfirmeContrasea.setText("confirme contrase\u00F1a:");
		txtConfirmeContrasea.setHorizontalAlignment(SwingConstants.LEFT);
		txtConfirmeContrasea.setEditable(false);
		txtConfirmeContrasea.setColumns(10);

		passwordField = new JPasswordField();
		passwordField.setHorizontalAlignment(SwingConstants.CENTER);
		passwordField.setText("contrase\u00F1a");

		JButton btnNewButton = new JButton("siguiente");
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
																Alignment.LEADING)
														.addGroup(
																groupLayout
																		.createSequentialGroup()
																		.addContainerGap()
																		.addComponent(
																				txtRegistroDeUsuario,
																				GroupLayout.DEFAULT_SIZE,
																				764,
																				Short.MAX_VALUE))
														.addGroup(
																groupLayout
																		.createSequentialGroup()
																		.addGap(144)
																		.addGroup(
																				groupLayout
																						.createParallelGroup(
																								Alignment.LEADING,
																								false)
																						.addComponent(
																								txtDireccionDeEmail)
																						.addComponent(
																								txtNombreDeUsuario,
																								GroupLayout.DEFAULT_SIZE,
																								477,
																								Short.MAX_VALUE)
																						.addComponent(
																								txtConfirmeDireccionDe,
																								GroupLayout.PREFERRED_SIZE,
																								477,
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
																																txtContrasea,
																																GroupLayout.PREFERRED_SIZE,
																																117,
																																GroupLayout.PREFERRED_SIZE)
																														.addComponent(
																																txtFechaDeNacimiento,
																																GroupLayout.PREFERRED_SIZE,
																																117,
																																GroupLayout.PREFERRED_SIZE)
																														.addComponent(
																																txtConfirmeContrasea,
																																GroupLayout.PREFERRED_SIZE,
																																117,
																																GroupLayout.PREFERRED_SIZE))
																										.addGap(18)
																										.addGroup(
																												groupLayout
																														.createParallelGroup(
																																Alignment.LEADING)
																														.addComponent(
																																passwordField,
																																GroupLayout.PREFERRED_SIZE,
																																342,
																																GroupLayout.PREFERRED_SIZE)
																														.addGroup(
																																groupLayout
																																		.createParallelGroup(
																																				Alignment.LEADING)
																																		.addComponent(
																																				pwdContrasea)
																																		.addGroup(
																																				groupLayout
																																						.createSequentialGroup()
																																						.addComponent(
																																								txtDd,
																																								GroupLayout.PREFERRED_SIZE,
																																								66,
																																								GroupLayout.PREFERRED_SIZE)
																																						.addPreferredGap(
																																								ComponentPlacement.UNRELATED)
																																						.addComponent(
																																								txtMm,
																																								GroupLayout.PREFERRED_SIZE,
																																								66,
																																								GroupLayout.PREFERRED_SIZE)
																																						.addPreferredGap(
																																								ComponentPlacement.UNRELATED)
																																						.addComponent(
																																								txtAaaa,
																																								GroupLayout.PREFERRED_SIZE,
																																								66,
																																								GroupLayout.PREFERRED_SIZE)))
																														.addComponent(
																																btnNewButton,
																																GroupLayout.PREFERRED_SIZE,
																																209,
																																GroupLayout.PREFERRED_SIZE))))))
										.addContainerGap()));
		groupLayout
				.setVerticalGroup(groupLayout
						.createParallelGroup(Alignment.LEADING)
						.addGroup(
								groupLayout
										.createSequentialGroup()
										.addContainerGap()
										.addComponent(txtRegistroDeUsuario,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addGap(88)
										.addComponent(txtNombreDeUsuario,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(txtDireccionDeEmail,
												GroupLayout.PREFERRED_SIZE,
												GroupLayout.DEFAULT_SIZE,
												GroupLayout.PREFERRED_SIZE)
										.addPreferredGap(
												ComponentPlacement.RELATED)
										.addComponent(txtConfirmeDireccionDe,
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
																txtFechaDeNacimiento,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																txtDd,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																txtMm,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																txtAaaa,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.UNRELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																pwdContrasea,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																txtContrasea,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addPreferredGap(
												ComponentPlacement.UNRELATED)
										.addGroup(
												groupLayout
														.createParallelGroup(
																Alignment.BASELINE)
														.addComponent(
																txtConfirmeContrasea,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(
																passwordField,
																GroupLayout.PREFERRED_SIZE,
																GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE))
										.addGap(18).addComponent(btnNewButton)
										.addContainerGap(233, Short.MAX_VALUE)));
		frame.getContentPane().setLayout(groupLayout);
	}
}
