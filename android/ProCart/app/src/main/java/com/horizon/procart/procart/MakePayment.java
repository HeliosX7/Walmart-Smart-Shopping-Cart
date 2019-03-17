package com.horizon.procart.procart;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Date;

public class MakePayment extends Activity {
    Button phonepe;
    Button paytm;
    Button paypal;
    Button qpay;
    Button next;
    TextView receipt1;
    Date date = new Date();
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.make_payment);

        phonepe = (Button)findViewById(R.id.phonepe);
        paytm = (Button)findViewById(R.id.paytm01);
        paypal = (Button)findViewById(R.id.paypal);
        qpay = (Button)findViewById(R.id.qpay);
        receipt1 = (TextView)findViewById(R.id.receipt1);
        next = (Button)findViewById(R.id.next);

        Intent i = getIntent();
        final String input = i.getStringExtra("input");
        final String q = input + date.getTime()+"$@#";
        phonepe.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MakePayment.this,"Payment Successful",Toast.LENGTH_SHORT).show();
                receipt1.setText(q);

            }
        });
        qpay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MakePayment.this,"Payment Successful",Toast.LENGTH_SHORT).show();
                receipt1.setText(q);
            }
        });
        paypal.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MakePayment.this,"Payment Successful",Toast.LENGTH_SHORT).show();
                receipt1.setText(q);
            }
        });
        paytm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MakePayment.this,"Payment Successful",Toast.LENGTH_SHORT).show();
                receipt1.setText(q);
            }
        });
        next.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MakePayment.this,QRcode.class);
                i.putExtra("input",input);
                startActivity(i);
            }
        });
    }

}
