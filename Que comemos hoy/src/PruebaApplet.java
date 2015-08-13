import java.applet.Applet;
import java.awt.Color;
import java.awt.Graphics;

public class PruebaApplet extends Applet {
	public PruebaApplet() {
	}

	@Override
	public void init() {
		setBackground(Color.white);
	}

	@Override
	public void paint(Graphics g) {
		g.drawString("Primer applet", 10, 10);
	}
}