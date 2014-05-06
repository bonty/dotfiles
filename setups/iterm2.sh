#!/bin/sh

NAME='my color scheme'
ANSI_0_COLOR_1='0.0'
ANSI_0_COLOR_2='0.0'
ANSI_0_COLOR_3='0.0'
ANSI_1_COLOR_1='0.13333333333333333'
ANSI_1_COLOR_2='0.13333333333333333'
ANSI_1_COLOR_3='0.89803921568627454'
ANSI_2_COLOR_1='0.1764705882352941'
ANSI_2_COLOR_2='0.8901960784313725'
ANSI_2_COLOR_3='0.65098039215686276'
ANSI_3_COLOR_1='0.1764705882352941'
ANSI_3_COLOR_2='0.58431375026702881'
ANSI_3_COLOR_3='0.9882352941176471'
ANSI_4_COLOR_1='1'
ANSI_4_COLOR_2='0.55294120311737061'
ANSI_4_COLOR_3='0.76862745098039209'
ANSI_5_COLOR_1='0.45098039507865906'
ANSI_5_COLOR_2='0.14509803921568626'
ANSI_5_COLOR_3='0.98039215686274506'
ANSI_6_COLOR_1='0.94117647409439087'
ANSI_6_COLOR_2='0.85098039215686272'
ANSI_6_COLOR_3='0.40392156862745099'
ANSI_7_COLOR_1='0.94901960784313721'
ANSI_7_COLOR_2='0.94901961088180542'
ANSI_7_COLOR_3='0.94901961088180542'
ANSI_8_COLOR_1='0.33333333333333331'
ANSI_8_COLOR_2='0.33333333333333331'
ANSI_8_COLOR_3='0.33333333333333331'
ANSI_9_COLOR_1='0.3333333432674408'
ANSI_9_COLOR_2='0.3333333432674408'
ANSI_9_COLOR_3='1'
ANSI_10_COLOR_1='0.3333333432674408'
ANSI_10_COLOR_2='1'
ANSI_10_COLOR_3='0.3333333432674408'
ANSI_11_COLOR_1='0.3333333432674408'
ANSI_11_COLOR_2='1'
ANSI_11_COLOR_3='1'
ANSI_12_COLOR_1='1'
ANSI_12_COLOR_2='0.3333333432674408'
ANSI_12_COLOR_3='0.3333333432674408'
ANSI_13_COLOR_1='1'
ANSI_13_COLOR_2='0.3333333432674408'
ANSI_13_COLOR_3='1'
ANSI_14_COLOR_1='1'
ANSI_14_COLOR_2='1'
ANSI_14_COLOR_3='0.3333333432674408'
ANSI_15_COLOR_1='1'
ANSI_15_COLOR_2='1'
ANSI_15_COLOR_3='1'
BACKGROUND_COLOR_1='0.086274512112140656'
BACKGROUND_COLOR_2='0.086274512112140656'
BACKGROUND_COLOR_3='0.078431375324726105'
BOLD_COLOR_1='1'
BOLD_COLOR_2='1'
BOLD_COLOR_3='1'
CURSOR_COLOR_1='0.73333334922790527'
CURSOR_COLOR_2='0.73333334922790527'
CURSOR_COLOR_3='0.73333334922790527'
CURSOR_TEXT_COLOR_1='1'
CURSOR_TEXT_COLOR_2='1'
CURSOR_TEXT_COLOR_3='1'
FOREGROUND_COLOR_1='0.73333334922790527'
FOREGROUND_COLOR_2='0.73333334922790527'
FOREGROUND_COLOR_3='0.73333334922790527'
SELECTED_TEXT_COLOR_1='0.0'
SELECTED_TEXT_COLOR_2='0.0'
SELECTED_TEXT_COLOR_3='0.0'
SELECTION_COLOR_1='1'
SELECTION_COLOR_2='0.8353000283241272'
SELECTION_COLOR_3='0.70980000495910645'

# setup color
defaults write -app iTerm 'custom color presets' -dict-add \"$NAME\" \
"{
  \"Ansi 0 Color\" = {
    \"Red Component\" = \"$ANSI_0_COLOR_1\";
    \"Green Component\" = \"$ANSI_0_COLOR_2\";
    \"Blue Component\" = \"$ANSI_0_COLOR_3\";
  };
  \"Ansi 1 Color\" = {
    \"Red Component\" = \"$ANSI_1_COLOR_1\";
    \"Green Component\" = \"$ANSI_1_COLOR_2\";
    \"Blue Component\" = \"$ANSI_1_COLOR_3\";
  };
  \"Ansi 2 Color\" = {
    \"Red Component\" = \"$ANSI_2_COLOR_1\";
    \"Green Component\" = \"$ANSI_2_COLOR_2\";
    \"Blue Component\" = \"$ANSI_2_COLOR_3\";
  };
  \"Ansi 3 Color\" = {
    \"Red Component\" = \"$ANSI_3_COLOR_1\";
    \"Green Component\" = \"$ANSI_3_COLOR_2\";
    \"Blue Component\" = \"$ANSI_3_COLOR_3\";
  };
  \"Ansi 4 Color\" = {
    \"Red Component\" = \"$ANSI_4_COLOR_1\";
    \"Green Component\" = \"$ANSI_4_COLOR_2\";
    \"Blue Component\" = \"$ANSI_4_COLOR_3\";
  };
  \"Ansi 5 Color\" = {
    \"Red Component\" = \"$ANSI_5_COLOR_1\";
    \"Green Component\" = \"$ANSI_5_COLOR_2\";
    \"Blue Component\" = \"$ANSI_5_COLOR_3\";
  };
  \"Ansi 6 Color\" = {
    \"Red Component\" = \"$ANSI_6_COLOR_1\";
    \"Green Component\" = \"$ANSI_6_COLOR_2\";
    \"Blue Component\" = \"$ANSI_6_COLOR_3\";
  };
  \"Ansi 7 Color\" = {
    \"Red Component\" = \"$ANSI_7_COLOR_1\";
    \"Green Component\" = \"$ANSI_7_COLOR_2\";
    \"Blue Component\" = \"$ANSI_7_COLOR_3\";
  };
  \"Ansi 8 Color\" = {
    \"Red Component\" = \"$ANSI_8_COLOR_1\";
    \"Green Component\" = \"$ANSI_8_COLOR_2\";
    \"Blue Component\" = \"$ANSI_8_COLOR_3\";
  };
  \"Ansi 9 Color\" = {
    \"Red Component\" = \"$ANSI_9_COLOR_1\";
    \"Green Component\" = \"$ANSI_9_COLOR_2\";
    \"Blue Component\" = \"$ANSI_9_COLOR_3\";
  };
  \"Ansi 10 Color\" = {
    \"Red Component\" = \"$ANSI_10_COLOR_1\";
    \"Green Component\" = \"$ANSI_10_COLOR_2\";
    \"Blue Component\" = \"$ANSI_10_COLOR_3\";
  };
  \"Ansi 11 Color\" = {
    \"Red Component\" = \"$ANSI_11_COLOR_1\";
    \"Green Component\" = \"$ANSI_11_COLOR_2\";
    \"Blue Component\" = \"$ANSI_11_COLOR_3\";
  };
  \"Ansi 12 Color\" = {
    \"Red Component\" = \"$ANSI_12_COLOR_1\";
    \"Green Component\" = \"$ANSI_12_COLOR_2\";
    \"Blue Component\" = \"$ANSI_12_COLOR_3\";
  };
  \"Ansi 13 Color\" = {
    \"Red Component\" = \"$ANSI_13_COLOR_1\";
    \"Green Component\" = \"$ANSI_13_COLOR_2\";
    \"Blue Component\" = \"$ANSI_13_COLOR_3\";
  };
  \"Ansi 14 Color\" = {
    \"Red Component\" = \"$ANSI_14_COLOR_1\";
    \"Green Component\" = \"$ANSI_14_COLOR_2\";
    \"Blue Component\" = \"$ANSI_14_COLOR_3\";
  };
  \"Ansi 15 Color\" = {
    \"Red Component\" = \"$ANSI_15_COLOR_1\";
    \"Green Component\" = \"$ANSI_15_COLOR_2\";
    \"Blue Component\" = \"$ANSI_15_COLOR_3\";
  };
  \"Background Color\" = {
    \"Red Component\" = \"$BACKGROUND_COLOR_1\";
    \"Green Component\" = \"$BACKGROUND_COLOR_2\";
    \"Blue Component\" = \"$BACKGROUND_COLOR_3\";
  };
  \"Bold Color\" = {
    \"Red Component\" = \"$BOLD_COLOR_1\";
    \"Green Component\" = \"$BOLD_COLOR_2\";
    \"Blue Component\" = \"$BOLD_COLOR_3\";
  };
  \"Cursor Color\" = {
    \"Red Component\" = \"$CURSOR_COLOR_1\";
    \"Green Component\" = \"$CURSOR_COLOR_2\";
    \"Blue Component\" = \"$CURSOR_COLOR_3\";
  };
  \"Cursor Text Color\" = {
    \"Red Component\" = \"$CURSOR_TEXT_COLOR_1\";
    \"Green Component\" = \"$CURSOR_TEXT_COLOR_2\";
    \"Blue Component\" = \"$CURSOR_TEXT_COLOR_3\";
  };
  \"Foreground Color\" = {
    \"Red Component\" = \"$FOREGROUND_COLOR_1\";
    \"Green Component\" = \"$FOREGROUND_COLOR_2\";
    \"Blue Component\" = \"$FOREGROUND_COLOR_3\";
  };
  \"Selected Text Color\" = {
    \"Red Component\" = \"$SELECTED_TEXT_COLOR_1\";
    \"Green Component\" = \"$SELECTED_TEXT_COLOR_2\";
    \"Blue Component\" = \"$SELECTED_TEXT_COLOR_3\";
  };
  \"Selection Color\" = {
    \"Red Component\" = \"$SELECTION_COLOR_1\";
    \"Green Component\" = \"$SELECTION_COLOR_2\";
    \"Blue Component\" = \"$SELECTION_COLOR_3\";
  };
}"
