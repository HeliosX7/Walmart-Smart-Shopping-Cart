package com.horizon.hr_cart.hrcart.hr_cart;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class Login extends AppCompatActivity {

    Button btnMove;
    TextView username;
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login);
        btnMove = (Button) findViewById(R.id.btnmove);
        username = (EditText)findViewById(R.id.username);
        btnMove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(username.getText().toString().trim().length() == 0) {
                    Toast.makeText(Login.this, "Enter cart number...", Toast.LENGTH_SHORT).show();
                }
                else {
                    String input = username.getText().toString();
                    Intent i = new Intent(Login.this, Bill.class);
                    i.putExtra("input",input);
                    startActivity(i);
                }
            }
        });

    }
}
