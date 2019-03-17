package com.horizon.procart.procart;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

public class ItemsList extends ArrayAdapter<Item> {

    private Activity context;
    private List<Item> itemsLists;
    public ItemsList(Activity context,List<Item> itemsLists){
        super(context,R.layout.bill_layout,itemsLists);
        this.context=context;
        this.itemsLists=itemsLists;
    }

    @NonNull
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = context.getLayoutInflater();
        View listViewItem = inflater.inflate(R.layout.bill_layout,null,true);

        TextView item = (TextView) listViewItem.findViewById(R.id.item);
        TextView quantity = (TextView) listViewItem.findViewById(R.id.quantity);
        TextView price = (TextView) listViewItem.findViewById(R.id.price);

        Item items = itemsLists.get(position);
        price.setText(items.getPrice());
        quantity.setText(items.getQuantity());
        item.setText(items.getItem());



        return listViewItem;
    }
}
