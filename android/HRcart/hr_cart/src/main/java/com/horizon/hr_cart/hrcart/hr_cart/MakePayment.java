package com.horizon.hr_cart.hrcart.hr_cart;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import java.util.Date;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.zxing.WriterException;

import org.w3c.dom.Text;

public class MakePayment extends Activity {

    Button bhim;
    Button tez;
    Button paypal;
    Button paytm;
    TextView rptno;
    Button next;
    Date date = new Date();
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.make_payment);



        bhim = (Button) findViewById(R.id.bhim);
        tez = (Button) findViewById(R.id.tez);
        paypal = (Button) findViewById(R.id.paypal);
        paytm = (Button) findViewById(R.id.paytm);
        rptno = (TextView)findViewById(R.id.rptno);
        next = (Button)findViewById(R.id.next);
        Intent i = getIntent();
        final String input = i.getStringExtra("input");
        final String q = input+ date.getTime()+"$#@";

        bhim.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MakePayment.this, "Payment Successful", Toast.LENGTH_SHORT).show( );
                rptno.setText(q);

            }
        });
        tez.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MakePayment.this, "Payment Successful", Toast.LENGTH_SHORT).show( );
                rptno.setText(q);
            }
        });
        paypal.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MakePayment.this, "Payment Successful", Toast.LENGTH_SHORT).show( );
                rptno.setText(q);
            }
        });
        paytm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MakePayment.this, "Payment Successful", Toast.LENGTH_SHORT).show( );
                rptno.setText(q);
            }
        });

        next.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MakePayment.this, MainActivity.class);
                i.putExtra("input",q);
                startActivity(i);
            }
        });




    }




}
