.class public final enum Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;
.super Ljava/lang/Enum;
.source "PixmapPackerIO.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ImageFormat"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

.field public static final enum CIM:Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

.field public static final enum PNG:Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;


# instance fields
.field private final extension:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 22
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    const/4 v1, 0x0

    const-string v2, "CIM"

    const-string v3, ".cim"

    invoke-direct {v0, v2, v1, v3}, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;->CIM:Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    .line 24
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    const/4 v2, 0x1

    const-string v3, "PNG"

    const-string v4, ".png"

    invoke-direct {v0, v3, v2, v4}, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;->PNG:Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    const/4 v0, 0x2

    .line 20
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    sget-object v3, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;->CIM:Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    aput-object v3, v0, v1

    sget-object v1, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;->PNG:Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    aput-object v1, v0, v2

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;->$VALUES:[Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 34
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;->extension:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;
    .locals 1

    .line 20
    const-class v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;
    .locals 1

    .line 20
    sget-object v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;->$VALUES:[Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;

    return-object v0
.end method


# virtual methods
.method public getExtension()Ljava/lang/String;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PixmapPackerIO$ImageFormat;->extension:Ljava/lang/String;

    return-object v0
.end method
