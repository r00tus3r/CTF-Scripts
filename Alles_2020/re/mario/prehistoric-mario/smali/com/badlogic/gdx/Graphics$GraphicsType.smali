.class public final enum Lcom/badlogic/gdx/Graphics$GraphicsType;
.super Ljava/lang/Enum;
.source "Graphics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/Graphics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "GraphicsType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/Graphics$GraphicsType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/Graphics$GraphicsType;

.field public static final enum AndroidGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

.field public static final enum JGLFW:Lcom/badlogic/gdx/Graphics$GraphicsType;

.field public static final enum LWJGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

.field public static final enum LWJGL3:Lcom/badlogic/gdx/Graphics$GraphicsType;

.field public static final enum Mock:Lcom/badlogic/gdx/Graphics$GraphicsType;

.field public static final enum WebGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

.field public static final enum iOSGL:Lcom/badlogic/gdx/Graphics$GraphicsType;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 53
    new-instance v0, Lcom/badlogic/gdx/Graphics$GraphicsType;

    const/4 v1, 0x0

    const-string v2, "AndroidGL"

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/Graphics$GraphicsType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/Graphics$GraphicsType;->AndroidGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

    new-instance v0, Lcom/badlogic/gdx/Graphics$GraphicsType;

    const/4 v2, 0x1

    const-string v3, "LWJGL"

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/Graphics$GraphicsType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/Graphics$GraphicsType;->LWJGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

    new-instance v0, Lcom/badlogic/gdx/Graphics$GraphicsType;

    const/4 v3, 0x2

    const-string v4, "WebGL"

    invoke-direct {v0, v4, v3}, Lcom/badlogic/gdx/Graphics$GraphicsType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/Graphics$GraphicsType;->WebGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

    new-instance v0, Lcom/badlogic/gdx/Graphics$GraphicsType;

    const/4 v4, 0x3

    const-string v5, "iOSGL"

    invoke-direct {v0, v5, v4}, Lcom/badlogic/gdx/Graphics$GraphicsType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/Graphics$GraphicsType;->iOSGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

    new-instance v0, Lcom/badlogic/gdx/Graphics$GraphicsType;

    const/4 v5, 0x4

    const-string v6, "JGLFW"

    invoke-direct {v0, v6, v5}, Lcom/badlogic/gdx/Graphics$GraphicsType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/Graphics$GraphicsType;->JGLFW:Lcom/badlogic/gdx/Graphics$GraphicsType;

    new-instance v0, Lcom/badlogic/gdx/Graphics$GraphicsType;

    const/4 v6, 0x5

    const-string v7, "Mock"

    invoke-direct {v0, v7, v6}, Lcom/badlogic/gdx/Graphics$GraphicsType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/Graphics$GraphicsType;->Mock:Lcom/badlogic/gdx/Graphics$GraphicsType;

    new-instance v0, Lcom/badlogic/gdx/Graphics$GraphicsType;

    const/4 v7, 0x6

    const-string v8, "LWJGL3"

    invoke-direct {v0, v8, v7}, Lcom/badlogic/gdx/Graphics$GraphicsType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/Graphics$GraphicsType;->LWJGL3:Lcom/badlogic/gdx/Graphics$GraphicsType;

    const/4 v0, 0x7

    .line 52
    new-array v0, v0, [Lcom/badlogic/gdx/Graphics$GraphicsType;

    sget-object v8, Lcom/badlogic/gdx/Graphics$GraphicsType;->AndroidGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

    aput-object v8, v0, v1

    sget-object v1, Lcom/badlogic/gdx/Graphics$GraphicsType;->LWJGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/Graphics$GraphicsType;->WebGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/badlogic/gdx/Graphics$GraphicsType;->iOSGL:Lcom/badlogic/gdx/Graphics$GraphicsType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/badlogic/gdx/Graphics$GraphicsType;->JGLFW:Lcom/badlogic/gdx/Graphics$GraphicsType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/badlogic/gdx/Graphics$GraphicsType;->Mock:Lcom/badlogic/gdx/Graphics$GraphicsType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/badlogic/gdx/Graphics$GraphicsType;->LWJGL3:Lcom/badlogic/gdx/Graphics$GraphicsType;

    aput-object v1, v0, v7

    sput-object v0, Lcom/badlogic/gdx/Graphics$GraphicsType;->$VALUES:[Lcom/badlogic/gdx/Graphics$GraphicsType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 52
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/Graphics$GraphicsType;
    .locals 1

    .line 52
    const-class v0, Lcom/badlogic/gdx/Graphics$GraphicsType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/Graphics$GraphicsType;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/Graphics$GraphicsType;
    .locals 1

    .line 52
    sget-object v0, Lcom/badlogic/gdx/Graphics$GraphicsType;->$VALUES:[Lcom/badlogic/gdx/Graphics$GraphicsType;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/Graphics$GraphicsType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/Graphics$GraphicsType;

    return-object v0
.end method
