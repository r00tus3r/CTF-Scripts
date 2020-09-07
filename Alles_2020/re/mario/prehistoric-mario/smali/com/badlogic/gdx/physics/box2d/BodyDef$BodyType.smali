.class public final enum Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;
.super Ljava/lang/Enum;
.source "BodyDef.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/physics/box2d/BodyDef;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BodyType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

.field public static final enum DynamicBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

.field public static final enum KinematicBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

.field public static final enum StaticBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 29
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    const/4 v1, 0x0

    const-string v2, "StaticBody"

    invoke-direct {v0, v2, v1, v1}, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->StaticBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    const/4 v2, 0x1

    const-string v3, "KinematicBody"

    invoke-direct {v0, v3, v2, v2}, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->KinematicBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    const/4 v3, 0x2

    const-string v4, "DynamicBody"

    invoke-direct {v0, v4, v3, v3}, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->DynamicBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    const/4 v0, 0x3

    .line 28
    new-array v0, v0, [Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    sget-object v4, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->StaticBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    aput-object v4, v0, v1

    sget-object v1, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->KinematicBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->DynamicBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->$VALUES:[Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 34
    iput p3, p0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;
    .locals 1

    .line 28
    const-class v0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;
    .locals 1

    .line 28
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->$VALUES:[Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .line 38
    iget v0, p0, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->value:I

    return v0
.end method
