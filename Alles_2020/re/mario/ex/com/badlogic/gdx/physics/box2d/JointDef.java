package com.badlogic.gdx.physics.box2d;

public class JointDef {
  public Body bodyA = null;
  
  public Body bodyB = null;
  
  public boolean collideConnected = false;
  
  public JointType type = JointType.Unknown;
  
  public enum JointType {
    DistanceJoint,
    FrictionJoint,
    GearJoint,
    MotorJoint,
    MouseJoint,
    PrismaticJoint,
    PulleyJoint,
    RevoluteJoint,
    RopeJoint,
    Unknown(false),
    WeldJoint(false),
    WheelJoint(false);
    
    public static JointType[] valueTypes;
    
    private int value;
    
    static  {
      RevoluteJoint = new JointType("RevoluteJoint", true, true);
      PrismaticJoint = new JointType("PrismaticJoint", 2, 2);
      DistanceJoint = new JointType("DistanceJoint", 3, 3);
      PulleyJoint = new JointType("PulleyJoint", 4, 4);
      MouseJoint = new JointType("MouseJoint", 5, 5);
      GearJoint = new JointType("GearJoint", 6, 6);
      WheelJoint = new JointType("WheelJoint", 7, 7);
      WeldJoint = new JointType("WeldJoint", 8, 8);
      FrictionJoint = new JointType("FrictionJoint", 9, 9);
      RopeJoint = new JointType("RopeJoint", 10, 10);
      MotorJoint = new JointType("MotorJoint", 11, 11);
      JointType jointType1 = Unknown;
      JointType jointType2 = RevoluteJoint;
      JointType jointType3 = PrismaticJoint;
      JointType jointType4 = DistanceJoint;
      JointType jointType5 = PulleyJoint;
      JointType jointType6 = MouseJoint;
      JointType jointType7 = GearJoint;
      JointType jointType8 = WheelJoint;
      JointType jointType9 = WeldJoint;
      JointType jointType10 = FrictionJoint;
      JointType jointType11 = RopeJoint;
      JointType jointType12 = MotorJoint;
      $VALUES = new JointType[] { 
          jointType1, jointType2, jointType3, jointType4, jointType5, jointType6, jointType7, jointType8, jointType9, jointType10, 
          jointType11, jointType12 };
      valueTypes = new JointType[] { 
          jointType1, jointType2, jointType3, jointType4, jointType5, jointType6, jointType7, jointType8, jointType9, jointType10, 
          jointType11, jointType12 };
    }
    
    JointType(int param1Int1) { this.value = param1Int1; }
    
    public int getValue() { return this.value; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/JointDef.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */