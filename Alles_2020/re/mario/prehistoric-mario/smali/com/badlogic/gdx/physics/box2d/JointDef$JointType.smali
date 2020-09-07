.class public final enum Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;
.super Ljava/lang/Enum;
.source "JointDef.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/physics/box2d/JointDef;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "JointType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum DistanceJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum FrictionJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum GearJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum MotorJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum MouseJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum PrismaticJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum PulleyJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum RevoluteJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum RopeJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum Unknown:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum WeldJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static final enum WheelJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

.field public static valueTypes:[Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 26

    .line 21
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/4 v1, 0x0

    const-string v2, "Unknown"

    invoke-direct {v0, v2, v1, v1}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->Unknown:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/4 v2, 0x1

    const-string v3, "RevoluteJoint"

    invoke-direct {v0, v3, v2, v2}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->RevoluteJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/4 v3, 0x2

    const-string v4, "PrismaticJoint"

    invoke-direct {v0, v4, v3, v3}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PrismaticJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/4 v4, 0x3

    const-string v5, "DistanceJoint"

    invoke-direct {v0, v5, v4, v4}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->DistanceJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/4 v5, 0x4

    const-string v6, "PulleyJoint"

    invoke-direct {v0, v6, v5, v5}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PulleyJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/4 v6, 0x5

    const-string v7, "MouseJoint"

    invoke-direct {v0, v7, v6, v6}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->MouseJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/4 v7, 0x6

    const-string v8, "GearJoint"

    invoke-direct {v0, v8, v7, v7}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->GearJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/4 v8, 0x7

    const-string v9, "WheelJoint"

    invoke-direct {v0, v9, v8, v8}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->WheelJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    .line 22
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/16 v9, 0x8

    const-string v10, "WeldJoint"

    invoke-direct {v0, v10, v9, v9}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->WeldJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/16 v10, 0x9

    const-string v11, "FrictionJoint"

    invoke-direct {v0, v11, v10, v10}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->FrictionJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/16 v11, 0xa

    const-string v12, "RopeJoint"

    invoke-direct {v0, v12, v11, v11}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->RopeJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/16 v12, 0xb

    const-string v13, "MotorJoint"

    invoke-direct {v0, v13, v12, v12}, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->MotorJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/16 v0, 0xc

    .line 20
    new-array v13, v0, [Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v14, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->Unknown:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v14, v13, v1

    sget-object v15, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->RevoluteJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v15, v13, v2

    sget-object v16, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PrismaticJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v16, v13, v3

    sget-object v17, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->DistanceJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v17, v13, v4

    sget-object v18, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PulleyJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v18, v13, v5

    sget-object v19, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->MouseJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v19, v13, v6

    sget-object v20, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->GearJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v20, v13, v7

    sget-object v21, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->WheelJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v21, v13, v8

    sget-object v22, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->WeldJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v22, v13, v9

    sget-object v23, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->FrictionJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v23, v13, v10

    sget-object v24, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->RopeJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v24, v13, v11

    sget-object v25, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->MotorJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v25, v13, v12

    sput-object v13, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->$VALUES:[Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    .line 24
    new-array v0, v0, [Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    aput-object v14, v0, v1

    aput-object v15, v0, v2

    aput-object v16, v0, v3

    aput-object v17, v0, v4

    aput-object v18, v0, v5

    aput-object v19, v0, v6

    aput-object v20, v0, v7

    aput-object v21, v0, v8

    aput-object v22, v0, v9

    aput-object v23, v0, v10

    aput-object v24, v0, v11

    aput-object v25, v0, v12

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->valueTypes:[Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 29
    iput p3, p0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;
    .locals 1

    .line 20
    const-class v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;
    .locals 1

    .line 20
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->$VALUES:[Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .line 33
    iget v0, p0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->value:I

    return v0
.end method
