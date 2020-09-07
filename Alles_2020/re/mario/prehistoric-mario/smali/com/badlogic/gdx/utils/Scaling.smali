.class public final enum Lcom/badlogic/gdx/utils/Scaling;
.super Ljava/lang/Enum;
.source "Scaling.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/utils/Scaling;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/utils/Scaling;

.field public static final enum fill:Lcom/badlogic/gdx/utils/Scaling;

.field public static final enum fillX:Lcom/badlogic/gdx/utils/Scaling;

.field public static final enum fillY:Lcom/badlogic/gdx/utils/Scaling;

.field public static final enum fit:Lcom/badlogic/gdx/utils/Scaling;

.field public static final enum none:Lcom/badlogic/gdx/utils/Scaling;

.field public static final enum stretch:Lcom/badlogic/gdx/utils/Scaling;

.field public static final enum stretchX:Lcom/badlogic/gdx/utils/Scaling;

.field public static final enum stretchY:Lcom/badlogic/gdx/utils/Scaling;

.field private static final temp:Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 26
    new-instance v0, Lcom/badlogic/gdx/utils/Scaling;

    const/4 v1, 0x0

    const-string v2, "fit"

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/Scaling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/utils/Scaling;->fit:Lcom/badlogic/gdx/utils/Scaling;

    .line 29
    new-instance v0, Lcom/badlogic/gdx/utils/Scaling;

    const/4 v2, 0x1

    const-string v3, "fill"

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/utils/Scaling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/utils/Scaling;->fill:Lcom/badlogic/gdx/utils/Scaling;

    .line 32
    new-instance v0, Lcom/badlogic/gdx/utils/Scaling;

    const/4 v3, 0x2

    const-string v4, "fillX"

    invoke-direct {v0, v4, v3}, Lcom/badlogic/gdx/utils/Scaling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/utils/Scaling;->fillX:Lcom/badlogic/gdx/utils/Scaling;

    .line 35
    new-instance v0, Lcom/badlogic/gdx/utils/Scaling;

    const/4 v4, 0x3

    const-string v5, "fillY"

    invoke-direct {v0, v5, v4}, Lcom/badlogic/gdx/utils/Scaling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/utils/Scaling;->fillY:Lcom/badlogic/gdx/utils/Scaling;

    .line 37
    new-instance v0, Lcom/badlogic/gdx/utils/Scaling;

    const/4 v5, 0x4

    const-string v6, "stretch"

    invoke-direct {v0, v6, v5}, Lcom/badlogic/gdx/utils/Scaling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/utils/Scaling;->stretch:Lcom/badlogic/gdx/utils/Scaling;

    .line 40
    new-instance v0, Lcom/badlogic/gdx/utils/Scaling;

    const/4 v6, 0x5

    const-string v7, "stretchX"

    invoke-direct {v0, v7, v6}, Lcom/badlogic/gdx/utils/Scaling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/utils/Scaling;->stretchX:Lcom/badlogic/gdx/utils/Scaling;

    .line 43
    new-instance v0, Lcom/badlogic/gdx/utils/Scaling;

    const/4 v7, 0x6

    const-string v8, "stretchY"

    invoke-direct {v0, v8, v7}, Lcom/badlogic/gdx/utils/Scaling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/utils/Scaling;->stretchY:Lcom/badlogic/gdx/utils/Scaling;

    .line 45
    new-instance v0, Lcom/badlogic/gdx/utils/Scaling;

    const/4 v8, 0x7

    const-string v9, "none"

    invoke-direct {v0, v9, v8}, Lcom/badlogic/gdx/utils/Scaling;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/utils/Scaling;->none:Lcom/badlogic/gdx/utils/Scaling;

    const/16 v0, 0x8

    .line 23
    new-array v0, v0, [Lcom/badlogic/gdx/utils/Scaling;

    sget-object v9, Lcom/badlogic/gdx/utils/Scaling;->fit:Lcom/badlogic/gdx/utils/Scaling;

    aput-object v9, v0, v1

    sget-object v1, Lcom/badlogic/gdx/utils/Scaling;->fill:Lcom/badlogic/gdx/utils/Scaling;

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/utils/Scaling;->fillX:Lcom/badlogic/gdx/utils/Scaling;

    aput-object v1, v0, v3

    sget-object v1, Lcom/badlogic/gdx/utils/Scaling;->fillY:Lcom/badlogic/gdx/utils/Scaling;

    aput-object v1, v0, v4

    sget-object v1, Lcom/badlogic/gdx/utils/Scaling;->stretch:Lcom/badlogic/gdx/utils/Scaling;

    aput-object v1, v0, v5

    sget-object v1, Lcom/badlogic/gdx/utils/Scaling;->stretchX:Lcom/badlogic/gdx/utils/Scaling;

    aput-object v1, v0, v6

    sget-object v1, Lcom/badlogic/gdx/utils/Scaling;->stretchY:Lcom/badlogic/gdx/utils/Scaling;

    aput-object v1, v0, v7

    sget-object v1, Lcom/badlogic/gdx/utils/Scaling;->none:Lcom/badlogic/gdx/utils/Scaling;

    aput-object v1, v0, v8

    sput-object v0, Lcom/badlogic/gdx/utils/Scaling;->$VALUES:[Lcom/badlogic/gdx/utils/Scaling;

    .line 47
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/utils/Scaling;->temp:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/utils/Scaling;
    .locals 1

    .line 23
    const-class v0, Lcom/badlogic/gdx/utils/Scaling;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/utils/Scaling;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/utils/Scaling;
    .locals 1

    .line 23
    sget-object v0, Lcom/badlogic/gdx/utils/Scaling;->$VALUES:[Lcom/badlogic/gdx/utils/Scaling;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/utils/Scaling;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/utils/Scaling;

    return-object v0
.end method


# virtual methods
.method public apply(FFFF)Lcom/badlogic/gdx/math/Vector2;
    .locals 2

    .line 52
    sget-object v0, Lcom/badlogic/gdx/utils/Scaling$1;->$SwitchMap$com$badlogic$gdx$utils$Scaling:[I

    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/Scaling;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    .line 94
    :pswitch_0
    sget-object p3, Lcom/badlogic/gdx/utils/Scaling;->temp:Lcom/badlogic/gdx/math/Vector2;

    iput p1, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 95
    iput p2, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_2

    .line 90
    :pswitch_1
    sget-object p2, Lcom/badlogic/gdx/utils/Scaling;->temp:Lcom/badlogic/gdx/math/Vector2;

    iput p1, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 91
    iput p4, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_2

    .line 86
    :pswitch_2
    sget-object p1, Lcom/badlogic/gdx/utils/Scaling;->temp:Lcom/badlogic/gdx/math/Vector2;

    iput p3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 87
    iput p2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_2

    .line 82
    :pswitch_3
    sget-object p1, Lcom/badlogic/gdx/utils/Scaling;->temp:Lcom/badlogic/gdx/math/Vector2;

    iput p3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 83
    iput p4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_2

    :pswitch_4
    div-float/2addr p4, p2

    .line 77
    sget-object p3, Lcom/badlogic/gdx/utils/Scaling;->temp:Lcom/badlogic/gdx/math/Vector2;

    mul-float p1, p1, p4

    iput p1, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float p2, p2, p4

    .line 78
    iput p2, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_2

    :pswitch_5
    div-float/2addr p3, p1

    .line 71
    sget-object p4, Lcom/badlogic/gdx/utils/Scaling;->temp:Lcom/badlogic/gdx/math/Vector2;

    mul-float p1, p1, p3

    iput p1, p4, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float p2, p2, p3

    .line 72
    iput p2, p4, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_2

    :pswitch_6
    div-float v0, p4, p3

    div-float v1, p2, p1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    div-float/2addr p3, p1

    goto :goto_0

    :cond_0
    div-float p3, p4, p2

    .line 65
    :goto_0
    sget-object p4, Lcom/badlogic/gdx/utils/Scaling;->temp:Lcom/badlogic/gdx/math/Vector2;

    mul-float p1, p1, p3

    iput p1, p4, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float p2, p2, p3

    .line 66
    iput p2, p4, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_2

    :pswitch_7
    div-float v0, p4, p3

    div-float v1, p2, p1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    div-float/2addr p3, p1

    goto :goto_1

    :cond_1
    div-float p3, p4, p2

    .line 57
    :goto_1
    sget-object p4, Lcom/badlogic/gdx/utils/Scaling;->temp:Lcom/badlogic/gdx/math/Vector2;

    mul-float p1, p1, p3

    iput p1, p4, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float p2, p2, p3

    .line 58
    iput p2, p4, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 98
    :goto_2
    sget-object p1, Lcom/badlogic/gdx/utils/Scaling;->temp:Lcom/badlogic/gdx/math/Vector2;

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
