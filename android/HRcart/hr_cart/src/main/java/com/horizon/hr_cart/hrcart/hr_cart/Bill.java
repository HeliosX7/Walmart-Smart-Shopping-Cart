package com.horizon.hr_cart.hrcart.hr_cart;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Bill extends Activity {

    Button pay1;
    TextView txtInput;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bill);
        txtInput = (TextView)findViewById(R.id.txtInput);
        Intent i = getIntent();
        final String input = i.getStringExtra("input");
        txtInput.setText("Cart Number : " + input);
        pay1 = (Button) findViewById(R.id.pay1);
        pay1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent i = new Intent(Bill.this, MakePayment.class);
               i.putExtra("input",input);
               startActivity(i);
           }
        });

    }
}
