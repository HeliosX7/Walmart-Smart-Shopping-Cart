package com.horizon.hr_cart.hrcart;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.List;

public class Bill extends Activity {

    Button pay1;
    private TextView txtInput;
    DatabaseReference databaseRef;
    ListView listviewitems;

    List<Item> itemList;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(com.horizon.hr_cart.hrcart.hr_cart.R.layout.bill);
        txtInput = (TextView)findViewById(com.horizon.hr_cart.hrcart.hr_cart.R.id.txtInput);
        databaseRef = FirebaseDatabase.getInstance().getReference("Carts/Cart01");
        listviewitems = (ListView) findViewById(R.id.listviewitem);
        Intent i = getIntent();
        final String input = i.getStringExtra("input");
        txtInput.setText("Cart Number : " + input);
        pay1 = (Button) findViewById(com.horizon.hr_cart.hrcart.hr_cart.R.id.pay1);
        pay1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent i = new Intent(Bill.this, MakePayment.class);
                i.putExtra("input",input);
                startActivity(i);
            }
        });
    }
        @Override
        protected void onStart() {
            super.onStart();
            databaseRef.addValueEventListener(new ValueEventListener() {
                @Override
                public void onDataChange(@NonNull DataSnapshot dataSnapshot) {

                    for(DataSnapshot artistSnapshot : dataSnapshot.getChildren())
                    {
                        Item itms = artistSnapshot.getValue(Item.class);

                        itemList.add(itms);
                    }
                    ItemList adapter = new ItemList(Bill.this,itemList);
                    listviewitems.setAdapter(adapter);

                }

                @Override
                public void onCancelled(@NonNull DatabaseError databaseError) {

                }
            });
        }




}
