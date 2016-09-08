package com.kaciula.archiman.screen.main;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.ViewFlipper;

import com.kaciula.archiman.R;
import com.kaciula.archiman.data.model.User;

import java.util.ArrayList;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import timber.log.Timber;

public class MainView extends ViewFlipper implements MainContract.View, AdapterView
        .OnItemClickListener {

    private static final int CHILD_CONTENT = 0;
    private static final int CHILD_PROGRESS = 1;
    private static final int CHILD_ERROR = 2;

    @BindView(R.id.list)
    ListView listView;

    private MainContract.Presenter presenter;
    private UserAdapter adapter;

    public MainView(Context context) {
        super(context);
        init();
    }

    public MainView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    private void init() {
        inflate(getContext(), R.layout.view_main, this);
        ButterKnife.bind(this);

        adapter = new UserAdapter(getContext(), new ArrayList<User>());
        listView.setAdapter(adapter);
        listView.setOnItemClickListener(this);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (!isInEditMode())
            presenter.attachView();
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (!isInEditMode())
            presenter.detachView();
    }

    @Override
    public void setPresenter(MainContract.Presenter presenter) {
        this.presenter = presenter;
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        User user = adapter.getItem(position);
        Toast.makeText(getContext(), user.username, Toast.LENGTH_SHORT).show();
    }

    @OnClick(R.id.btn_retry)
    void onClickRetry() {
        presenter.onClickRetry();
    }

    @Override
    public void updateContent(MainData data) {
        adapter.setItems(data.users);
    }

    @Override
    public void showContent() {
        setDisplayedChild(CHILD_CONTENT);
        Timber.d("child content ? " + getDisplayedChild());
    }

    @Override
    public void showProgress() {
        setDisplayedChild(CHILD_PROGRESS);
        Timber.d("child progress ? " + getDisplayedChild());
    }

    @Override
    public void showError() {
        setDisplayedChild(CHILD_ERROR);
    }
}
