package com.benatkin.teatimer.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Bundle;
import android.os.Handler;
import android.widget.Button;
import android.widget.TextView;
import android.view.View;
import java.util.Date;

public class TeaTimer extends Activity {
	Date endDate;
	Runnable task;
	Handler handler = null;
	
	public void updateTime() {
		Date currentDate = new Date();
		long difference = (endDate.getTime() - currentDate.getTime()) / 1000;
		long minutes = difference / 60;
		long seconds = difference % 60;
		TextView time = (TextView) findViewById(R.id.Time);
		String str = minutes + ":" + (seconds > 9 ? "" : "0") + seconds;
		time.setText(str);
		if (difference < 1) {
			handler.removeCallbacks(task);
			time.setText("0:00");
			new AlertDialog.Builder(this)
				.setMessage("your tea is ready!")
				.setPositiveButton("OK", null)
				.setCancelable(false)
				.show();
		} else {
			handler.postDelayed(task, 100);
		}
	}
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        handler = new Handler();
        task = new Runnable() {
			@Override
			public void run() {
				updateTime();
			}
        };
        
        final Button green = (Button) findViewById(R.id.Green);
        final Button black = (Button) findViewById(R.id.Black);
        View.OnClickListener listener = new View.OnClickListener() {
            public void onClick(View v) {
                int minutes = v.getId() == R.id.Green ? 2 : 5;
                final Date now = new Date();
                endDate = new Date(now.getTime() + minutes * 60 * 1000 + 900);
                handler.removeCallbacks(task);
                
                updateTime();
            }
        };
        green.setOnClickListener(listener);
        black.setOnClickListener(listener);
    }
}