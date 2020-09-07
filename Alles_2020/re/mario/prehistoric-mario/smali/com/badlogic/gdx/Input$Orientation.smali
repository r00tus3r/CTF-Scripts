.class public final enum Lcom/badlogic/gdx/Input$Orientation;
.super Ljava/lang/Enum;
.source "Input.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/Input;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Orientation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/Input$Orientation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/Input$Orientation;

.field public static final enum Landscape:Lcom/badlogic/gdx/Input$Orientation;

.field public static final enum Portrait:Lcom/badlogic/gdx/Input$Orientation;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 809
    new-instance v0, Lcom/badlogic/gdx/Input$Orientation;

    const/4 v1, 0x0

    const-string v2, "Landscape"

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/Input$Orientation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/Input$Orientation;->Landscape:Lcom/badlogic/gdx/Input$Orientation;

    new-instance v0, Lcom/badlogic/gdx/Input$Orientation;

    const/4 v2, 0x1

    const-string v3, "Portrait"

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/Input$Orientation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/Input$Orientation;->Portrait:Lcom/badlogic/gdx/Input$Orientation;

    const/4 v0, 0x2

    .line 808
    new-array v0, v0, [Lcom/badlogic/gdx/Input$Orientation;

    sget-object v3, Lcom/badlogic/gdx/Input$Orientation;->Landscape:Lcom/badlogic/gdx/Input$Orientation;

    aput-object v3, v0, v1

    sget-object v1, Lcom/badlogic/gdx/Input$Orientation;->Portrait:Lcom/badlogic/gdx/Input$Orientation;

    aput-object v1, v0, v2

    sput-object v0, Lcom/badlogic/gdx/Input$Orientation;->$VALUES:[Lcom/badlogic/gdx/Input$Orientation;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 808
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/Input$Orientation;
    .locals 1

    .line 808
    const-class v0, Lcom/badlogic/gdx/Input$Orientation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/Input$Orientation;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/Input$Orientation;
    .locals 1

    .line 808
    sget-object v0, Lcom/badlogic/gdx/Input$Orientation;->$VALUES:[Lcom/badlogic/gdx/Input$Orientation;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/Input$Orientation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/Input$Orientation;

    return-object v0
.end method
