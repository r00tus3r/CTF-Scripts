.class public final enum Lcom/uwsoft/editor/renderer/data/LightVO$LightType;
.super Ljava/lang/Enum;
.source "LightVO.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/uwsoft/editor/renderer/data/LightVO;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LightType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/uwsoft/editor/renderer/data/LightVO$LightType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

.field public static final enum CONE:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

.field public static final enum POINT:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 5
    new-instance v0, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    const/4 v1, 0x0

    const-string v2, "POINT"

    invoke-direct {v0, v2, v1}, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->POINT:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    new-instance v0, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    const/4 v2, 0x1

    const-string v3, "CONE"

    invoke-direct {v0, v3, v2}, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->CONE:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    sget-object v3, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->POINT:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    aput-object v3, v0, v1

    sget-object v1, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->CONE:Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    aput-object v1, v0, v2

    sput-object v0, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->$VALUES:[Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/LightVO$LightType;
    .locals 1

    .line 5
    const-class v0, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    return-object p0
.end method

.method public static values()[Lcom/uwsoft/editor/renderer/data/LightVO$LightType;
    .locals 1

    .line 5
    sget-object v0, Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->$VALUES:[Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    invoke-virtual {v0}, [Lcom/uwsoft/editor/renderer/data/LightVO$LightType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/uwsoft/editor/renderer/data/LightVO$LightType;

    return-object v0
.end method
