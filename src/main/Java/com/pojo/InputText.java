package com.pojo;

public class InputText {
        private  Text inputText;

    @Override
    public String toString() {
        return "InputText{" +
                "inputText=" + inputText +
                '}';
    }

    public Text getInputText() {
        return inputText;
    }

    public void setInputText(Text inputText) {
        this.inputText = inputText;
    }
}
