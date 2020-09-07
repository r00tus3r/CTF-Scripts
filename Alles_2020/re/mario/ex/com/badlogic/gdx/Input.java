package com.badlogic.gdx;

import com.badlogic.gdx.utils.ObjectIntMap;

public interface Input {
  void cancelVibrate();
  
  float getAccelerometerX();
  
  float getAccelerometerY();
  
  float getAccelerometerZ();
  
  float getAzimuth();
  
  long getCurrentEventTime();
  
  int getDeltaX();
  
  int getDeltaX(int paramInt);
  
  int getDeltaY();
  
  int getDeltaY(int paramInt);
  
  float getGyroscopeX();
  
  float getGyroscopeY();
  
  float getGyroscopeZ();
  
  InputProcessor getInputProcessor();
  
  int getMaxPointers();
  
  Orientation getNativeOrientation();
  
  float getPitch();
  
  float getPressure();
  
  float getPressure(int paramInt);
  
  float getRoll();
  
  int getRotation();
  
  void getRotationMatrix(float[] paramArrayOfFloat);
  
  void getTextInput(TextInputListener paramTextInputListener, String paramString1, String paramString2, String paramString3);
  
  int getX();
  
  int getX(int paramInt);
  
  int getY();
  
  int getY(int paramInt);
  
  boolean isButtonJustPressed(int paramInt);
  
  boolean isButtonPressed(int paramInt);
  
  @Deprecated
  boolean isCatchBackKey();
  
  boolean isCatchKey(int paramInt);
  
  @Deprecated
  boolean isCatchMenuKey();
  
  boolean isCursorCatched();
  
  boolean isKeyJustPressed(int paramInt);
  
  boolean isKeyPressed(int paramInt);
  
  boolean isPeripheralAvailable(Peripheral paramPeripheral);
  
  boolean isTouched();
  
  boolean isTouched(int paramInt);
  
  boolean justTouched();
  
  @Deprecated
  void setCatchBackKey(boolean paramBoolean);
  
  void setCatchKey(int paramInt, boolean paramBoolean);
  
  @Deprecated
  void setCatchMenuKey(boolean paramBoolean);
  
  void setCursorCatched(boolean paramBoolean);
  
  void setCursorPosition(int paramInt1, int paramInt2);
  
  void setInputProcessor(InputProcessor paramInputProcessor);
  
  void setOnscreenKeyboardVisible(boolean paramBoolean);
  
  void vibrate(int paramInt);
  
  void vibrate(long[] paramArrayOfLong, int paramInt);
  
  public static class Buttons {
    public static final int BACK = 3;
    
    public static final int FORWARD = 4;
    
    public static final int LEFT = 0;
    
    public static final int MIDDLE = 2;
    
    public static final int RIGHT = 1;
  }
  
  public static class Keys {
    public static final int A = 29;
    
    public static final int ALT_LEFT = 57;
    
    public static final int ALT_RIGHT = 58;
    
    public static final int ANY_KEY = -1;
    
    public static final int APOSTROPHE = 75;
    
    public static final int AT = 77;
    
    public static final int B = 30;
    
    public static final int BACK = 4;
    
    public static final int BACKSLASH = 73;
    
    public static final int BACKSPACE = 67;
    
    public static final int BUTTON_A = 96;
    
    public static final int BUTTON_B = 97;
    
    public static final int BUTTON_C = 98;
    
    public static final int BUTTON_CIRCLE = 255;
    
    public static final int BUTTON_L1 = 102;
    
    public static final int BUTTON_L2 = 104;
    
    public static final int BUTTON_MODE = 110;
    
    public static final int BUTTON_R1 = 103;
    
    public static final int BUTTON_R2 = 105;
    
    public static final int BUTTON_SELECT = 109;
    
    public static final int BUTTON_START = 108;
    
    public static final int BUTTON_THUMBL = 106;
    
    public static final int BUTTON_THUMBR = 107;
    
    public static final int BUTTON_X = 99;
    
    public static final int BUTTON_Y = 100;
    
    public static final int BUTTON_Z = 101;
    
    public static final int C = 31;
    
    public static final int CALL = 5;
    
    public static final int CAMERA = 27;
    
    public static final int CENTER = 23;
    
    public static final int CLEAR = 28;
    
    public static final int COLON = 243;
    
    public static final int COMMA = 55;
    
    public static final int CONTROL_LEFT = 129;
    
    public static final int CONTROL_RIGHT = 130;
    
    public static final int D = 32;
    
    public static final int DEL = 67;
    
    public static final int DOWN = 20;
    
    public static final int DPAD_CENTER = 23;
    
    public static final int DPAD_DOWN = 20;
    
    public static final int DPAD_LEFT = 21;
    
    public static final int DPAD_RIGHT = 22;
    
    public static final int DPAD_UP = 19;
    
    public static final int E = 33;
    
    public static final int END = 132;
    
    public static final int ENDCALL = 6;
    
    public static final int ENTER = 66;
    
    public static final int ENVELOPE = 65;
    
    public static final int EQUALS = 70;
    
    public static final int ESCAPE = 131;
    
    public static final int EXPLORER = 64;
    
    public static final int F = 34;
    
    public static final int F1 = 244;
    
    public static final int F10 = 253;
    
    public static final int F11 = 254;
    
    public static final int F12 = 255;
    
    public static final int F2 = 245;
    
    public static final int F3 = 246;
    
    public static final int F4 = 247;
    
    public static final int F5 = 248;
    
    public static final int F6 = 249;
    
    public static final int F7 = 250;
    
    public static final int F8 = 251;
    
    public static final int F9 = 252;
    
    public static final int FOCUS = 80;
    
    public static final int FORWARD_DEL = 112;
    
    public static final int G = 35;
    
    public static final int GRAVE = 68;
    
    public static final int H = 36;
    
    public static final int HEADSETHOOK = 79;
    
    public static final int HOME = 3;
    
    public static final int I = 37;
    
    public static final int INSERT = 133;
    
    public static final int J = 38;
    
    public static final int K = 39;
    
    public static final int L = 40;
    
    public static final int LEFT = 21;
    
    public static final int LEFT_BRACKET = 71;
    
    public static final int M = 41;
    
    public static final int MEDIA_FAST_FORWARD = 90;
    
    public static final int MEDIA_NEXT = 87;
    
    public static final int MEDIA_PLAY_PAUSE = 85;
    
    public static final int MEDIA_PREVIOUS = 88;
    
    public static final int MEDIA_REWIND = 89;
    
    public static final int MEDIA_STOP = 86;
    
    public static final int MENU = 82;
    
    public static final int META_ALT_LEFT_ON = 16;
    
    public static final int META_ALT_ON = 2;
    
    public static final int META_ALT_RIGHT_ON = 32;
    
    public static final int META_SHIFT_LEFT_ON = 64;
    
    public static final int META_SHIFT_ON = 1;
    
    public static final int META_SHIFT_RIGHT_ON = 128;
    
    public static final int META_SYM_ON = 4;
    
    public static final int MINUS = 69;
    
    public static final int MUTE = 91;
    
    public static final int N = 42;
    
    public static final int NOTIFICATION = 83;
    
    public static final int NUM = 78;
    
    public static final int NUMPAD_0 = 144;
    
    public static final int NUMPAD_1 = 145;
    
    public static final int NUMPAD_2 = 146;
    
    public static final int NUMPAD_3 = 147;
    
    public static final int NUMPAD_4 = 148;
    
    public static final int NUMPAD_5 = 149;
    
    public static final int NUMPAD_6 = 150;
    
    public static final int NUMPAD_7 = 151;
    
    public static final int NUMPAD_8 = 152;
    
    public static final int NUMPAD_9 = 153;
    
    public static final int NUM_0 = 7;
    
    public static final int NUM_1 = 8;
    
    public static final int NUM_2 = 9;
    
    public static final int NUM_3 = 10;
    
    public static final int NUM_4 = 11;
    
    public static final int NUM_5 = 12;
    
    public static final int NUM_6 = 13;
    
    public static final int NUM_7 = 14;
    
    public static final int NUM_8 = 15;
    
    public static final int NUM_9 = 16;
    
    public static final int O = 43;
    
    public static final int P = 44;
    
    public static final int PAGE_DOWN = 93;
    
    public static final int PAGE_UP = 92;
    
    public static final int PERIOD = 56;
    
    public static final int PICTSYMBOLS = 94;
    
    public static final int PLUS = 81;
    
    public static final int POUND = 18;
    
    public static final int POWER = 26;
    
    public static final int Q = 45;
    
    public static final int R = 46;
    
    public static final int RIGHT = 22;
    
    public static final int RIGHT_BRACKET = 72;
    
    public static final int S = 47;
    
    public static final int SEARCH = 84;
    
    public static final int SEMICOLON = 74;
    
    public static final int SHIFT_LEFT = 59;
    
    public static final int SHIFT_RIGHT = 60;
    
    public static final int SLASH = 76;
    
    public static final int SOFT_LEFT = 1;
    
    public static final int SOFT_RIGHT = 2;
    
    public static final int SPACE = 62;
    
    public static final int STAR = 17;
    
    public static final int SWITCH_CHARSET = 95;
    
    public static final int SYM = 63;
    
    public static final int T = 48;
    
    public static final int TAB = 61;
    
    public static final int U = 49;
    
    public static final int UNKNOWN = 0;
    
    public static final int UP = 19;
    
    public static final int V = 50;
    
    public static final int VOLUME_DOWN = 25;
    
    public static final int VOLUME_UP = 24;
    
    public static final int W = 51;
    
    public static final int X = 52;
    
    public static final int Y = 53;
    
    public static final int Z = 54;
    
    private static ObjectIntMap<String> keyNames;
    
    private static void initializeKeyNames() {
      keyNames = new ObjectIntMap();
      for (byte b = 0; b < 'Ā'; b++) {
        String str = toString(b);
        if (str != null)
          keyNames.put(str, b); 
      } 
    }
    
    public static String toString(int param1Int) {
      if (param1Int >= 0) {
        if (param1Int <= 255) {
          if (param1Int != 112) {
            switch (param1Int) {
              default:
                switch (param1Int) {
                  default:
                    switch (param1Int) {
                      default:
                        switch (param1Int) {
                          default:
                            return null;
                          case 255:
                            return "F12";
                          case 254:
                            return "F11";
                          case 253:
                            return "F10";
                          case 252:
                            return "F9";
                          case 251:
                            return "F8";
                          case 250:
                            return "F7";
                          case 249:
                            return "F6";
                          case 248:
                            return "F5";
                          case 247:
                            return "F4";
                          case 246:
                            return "F3";
                          case 245:
                            return "F2";
                          case 244:
                            return "F1";
                          case 243:
                            break;
                        } 
                        return ":";
                      case 153:
                        return "Numpad 9";
                      case 152:
                        return "Numpad 8";
                      case 151:
                        return "Numpad 7";
                      case 150:
                        return "Numpad 6";
                      case 149:
                        return "Numpad 5";
                      case 148:
                        return "Numpad 4";
                      case 147:
                        return "Numpad 3";
                      case 146:
                        return "Numpad 2";
                      case 145:
                        return "Numpad 1";
                      case 144:
                        break;
                    } 
                    return "Numpad 0";
                  case 133:
                    return "Insert";
                  case 132:
                    return "End";
                  case 131:
                    return "Escape";
                  case 130:
                    return "R-Ctrl";
                  case 129:
                    break;
                } 
                return "L-Ctrl";
              case 110:
                return "Button Mode";
              case 109:
                return "Select";
              case 108:
                return "Start";
              case 107:
                return "Right Thumb";
              case 106:
                return "Left Thumb";
              case 105:
                return "R2 Button";
              case 104:
                return "L2 Button";
              case 103:
                return "R1 Button";
              case 102:
                return "L1 Button";
              case 101:
                return "Z Button";
              case 100:
                return "Y Button";
              case 99:
                return "X Button";
              case 98:
                return "C Button";
              case 97:
                return "B Button";
              case 96:
                return "A Button";
              case 95:
                return "SWITCH_CHARSET";
              case 94:
                return "PICTSYMBOLS";
              case 93:
                return "Page Down";
              case 92:
                return "Page Up";
              case 91:
                return "Mute";
              case 90:
                return "Fast Forward";
              case 89:
                return "Rewind";
              case 88:
                return "Prev Media";
              case 87:
                return "Next Media";
              case 86:
                return "Stop Media";
              case 85:
                return "Play/Pause";
              case 84:
                return "Search";
              case 83:
                return "Notification";
              case 82:
                return "Menu";
              case 81:
                return "Plus";
              case 80:
                return "Focus";
              case 79:
                return "Headset Hook";
              case 78:
                return "Num";
              case 77:
                return "@";
              case 76:
                return "/";
              case 75:
                return "'";
              case 74:
                return ";";
              case 73:
                return "\\";
              case 72:
                return "]";
              case 71:
                return "[";
              case 70:
                return "=";
              case 69:
                return "-";
              case 68:
                return "`";
              case 67:
                return "Delete";
              case 66:
                return "Enter";
              case 65:
                return "Envelope";
              case 64:
                return "Explorer";
              case 63:
                return "SYM";
              case 62:
                return "Space";
              case 61:
                return "Tab";
              case 60:
                return "R-Shift";
              case 59:
                return "L-Shift";
              case 58:
                return "R-Alt";
              case 57:
                return "L-Alt";
              case 56:
                return ".";
              case 55:
                return ",";
              case 54:
                return "Z";
              case 53:
                return "Y";
              case 52:
                return "X";
              case 51:
                return "W";
              case 50:
                return "V";
              case 49:
                return "U";
              case 48:
                return "T";
              case 47:
                return "S";
              case 46:
                return "R";
              case 45:
                return "Q";
              case 44:
                return "P";
              case 43:
                return "O";
              case 42:
                return "N";
              case 41:
                return "M";
              case 40:
                return "L";
              case 39:
                return "K";
              case 38:
                return "J";
              case 37:
                return "I";
              case 36:
                return "H";
              case 35:
                return "G";
              case 34:
                return "F";
              case 33:
                return "E";
              case 32:
                return "D";
              case 31:
                return "C";
              case 30:
                return "B";
              case 29:
                return "A";
              case 28:
                return "Clear";
              case 27:
                return "Camera";
              case 26:
                return "Power";
              case 25:
                return "Volume Down";
              case 24:
                return "Volume Up";
              case 23:
                return "Center";
              case 22:
                return "Right";
              case 21:
                return "Left";
              case 20:
                return "Down";
              case 19:
                return "Up";
              case 18:
                return "#";
              case 17:
                return "*";
              case 16:
                return "9";
              case 15:
                return "8";
              case 14:
                return "7";
              case 13:
                return "6";
              case 12:
                return "5";
              case 11:
                return "4";
              case 10:
                return "3";
              case 9:
                return "2";
              case 8:
                return "1";
              case 7:
                return "0";
              case 6:
                return "End Call";
              case 5:
                return "Call";
              case 4:
                return "Back";
              case 3:
                return "Home";
              case 2:
                return "Soft Right";
              case 1:
                return "Soft Left";
              case 0:
                break;
            } 
            return "Unknown";
          } 
          return "Forward Delete";
        } 
        StringBuilder stringBuilder1 = new StringBuilder();
        stringBuilder1.append("keycode cannot be greater than 255, keycode: ");
        stringBuilder1.append(param1Int);
        throw new IllegalArgumentException(stringBuilder1.toString());
      } 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("keycode cannot be negative, keycode: ");
      stringBuilder.append(param1Int);
      throw new IllegalArgumentException(stringBuilder.toString());
    }
    
    public static int valueOf(String param1String) {
      if (keyNames == null)
        initializeKeyNames(); 
      return keyNames.get(param1String, -1);
    }
  }
  
  public enum Orientation {
    Landscape, Portrait;
    
    static  {
      $VALUES = new Orientation[] { Landscape, Portrait };
    }
  }
  
  public enum Peripheral {
    HardwareKeyboard, MultitouchScreen, Accelerometer, Compass, Gyroscope, OnscreenKeyboard, Pressure, RotationVector, Vibrator;
    
    static  {
      MultitouchScreen = new Peripheral("MultitouchScreen", 2);
      Accelerometer = new Peripheral("Accelerometer", 3);
      Compass = new Peripheral("Compass", 4);
      Vibrator = new Peripheral("Vibrator", 5);
      Gyroscope = new Peripheral("Gyroscope", 6);
      RotationVector = new Peripheral("RotationVector", 7);
      Pressure = new Peripheral("Pressure", 8);
      $VALUES = new Peripheral[] { HardwareKeyboard, OnscreenKeyboard, MultitouchScreen, Accelerometer, Compass, Vibrator, Gyroscope, RotationVector, Pressure };
    }
  }
  
  public static interface TextInputListener {
    void canceled();
    
    void input(String param1String);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/Input.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */