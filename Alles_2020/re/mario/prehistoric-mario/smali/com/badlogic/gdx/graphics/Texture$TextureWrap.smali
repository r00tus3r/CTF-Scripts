.class public final enum Lcom/badlogic/gdx/graphics/Texture$TextureWrap;
.super Ljava/lang/Enum;
.source "Texture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/Texture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TextureWrap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/graphics/Texture$TextureWrap;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

.field public static final enum ClampToEdge:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

.field public static final enum MirroredRepeat:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

.field public static final enum Repeat:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;


# instance fields
.field final glEnum:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 94
    new-instance v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    const/4 v1, 0x0

    const-string v2, "MirroredRepeat"

    const v3, 0x8370

    invoke-direct {v0, v2, v1, v3}, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->MirroredRepeat:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    new-instance v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    const/4 v2, 0x1

    const-string v3, "ClampToEdge"

    const v4, 0x812f

    invoke-direct {v0, v3, v2, v4}, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->ClampToEdge:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    new-instance v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    const/4 v3, 0x2

    const-string v4, "Repeat"

    const/16 v5, 0x2901

    invoke-direct {v0, v4, v3, v5}, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->Repeat:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    const/4 v0, 0x3

    .line 93
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    sget-object v4, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->MirroredRepeat:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    aput-object v4, v0, v1

    sget-object v1, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->ClampToEdge:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    aput-object v1, v0, v2

    sget-object v1, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->Repeat:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    aput-object v1, v0, v3

    sput-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->$VALUES:[Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 98
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 99
    iput p3, p0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->glEnum:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/Texture$TextureWrap;
    .locals 1

    .line 93
    const-class v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/graphics/Texture$TextureWrap;
    .locals 1

    .line 93
    sget-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->$VALUES:[Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    return-object v0
.end method


# virtual methods
.method public getGLEnum()I
    .locals 1

    .line 103
    iget v0, p0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->glEnum:I

    return v0
.end method
