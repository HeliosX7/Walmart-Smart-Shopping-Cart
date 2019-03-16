package com.horizon.hr_cart.hrcart;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import java.util.List;


public class ItemList extends ArrayAdapter <Item>
    {
         private Activity context;
         private List<Item> itemList;

         public ItemList (Activity context, List<Item>itemList)
         {
             super(context,R.layout.bill, itemList);
             this.context = context;
             this.itemList = itemList;

         }
         @NonNull
        @Override
        public View getView(int position, View convertView,ViewGroup parent)
         {
             LayoutInflater inflater = context.getLayoutInflater();
             View listViewItem = inflater.inflate(R.layout.bill,null,true);
             TextView units01 = (TextView) listViewItem.findViewById(R.id.units01);
             TextView price01 = (TextView) listViewItem.findViewById(R.id.price01);
             TextView item01 = (TextView) listViewItem.findViewById(R.id.item01);

             Item itm = itemList.get(position);
             units01.setText(itm.getUnits());
             price01.setText(itm.getPrice());
             item01.setText(itm.getItemname());

             return listViewItem;
         }

    }

