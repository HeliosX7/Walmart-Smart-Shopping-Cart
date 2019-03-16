package com.horizon.hr_cart.hrcart;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Date;

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
        setContentView(com.horizon.hr_cart.hrcart.hr_cart.R.layout.make_payment);



        bhim = (Button) findViewById(com.horizon.hr_cart.hrcart.hr_cart.R.id.bhim);
        tez = (Button) findViewById(com.horizon.hr_cart.hrcart.hr_cart.R.id.tez);
        paypal = (Button) findViewById(com.horizon.hr_cart.hrcart.hr_cart.R.id.paypal);
        paytm = (Button) findViewById(com.horizon.hr_cart.hrcart.hr_cart.R.id.paytm);
        rptno = (TextView)findViewById(com.horizon.hr_cart.hrcart.hr_cart.R.id.rptno);
        next = (Button)findViewById(com.horizon.hr_cart.hrcart.hr_cart.R.id.next);
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
