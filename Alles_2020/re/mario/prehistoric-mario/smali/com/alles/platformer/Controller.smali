.class public Lcom/alles/platformer/Controller;
.super Ljava/lang/Object;
.source "Controller.java"


# instance fields
.field cam:Lcom/badlogic/gdx/graphics/OrthographicCamera;

.field downPressed:Z

.field leftPressed:Z

.field rightPressed:Z

.field stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

.field upPressed:Z

.field viewport:Lcom/badlogic/gdx/utils/viewport/Viewport;


# direct methods
.method public constructor <init>()V
    .locals 9

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/OrthographicCamera;-><init>()V

    iput-object v0, p0, Lcom/alles/platformer/Controller;->cam:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    .line 26
    new-instance v0, Lcom/badlogic/gdx/utils/viewport/FitViewport;

    iget-object v1, p0, Lcom/alles/platformer/Controller;->cam:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    const/high16 v2, 0x44480000    # 800.0f

    const/high16 v3, 0x43f00000    # 480.0f

    invoke-direct {v0, v2, v3, v1}, Lcom/badlogic/gdx/utils/viewport/FitViewport;-><init>(FFLcom/badlogic/gdx/graphics/Camera;)V

    iput-object v0, p0, Lcom/alles/platformer/Controller;->viewport:Lcom/badlogic/gdx/utils/viewport/Viewport;

    .line 27
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/Stage;

    iget-object v1, p0, Lcom/alles/platformer/Controller;->viewport:Lcom/badlogic/gdx/utils/viewport/Viewport;

    sget-object v2, Lcom/alles/platformer/MyPlatformer;->absoluteBatch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/Stage;-><init>(Lcom/badlogic/gdx/utils/viewport/Viewport;Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    iput-object v0, p0, Lcom/alles/platformer/Controller;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    .line 29
    iget-object v0, p0, Lcom/alles/platformer/Controller;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    new-instance v1, Lcom/alles/platformer/Controller$1;

    invoke-direct {v1, p0}, Lcom/alles/platformer/Controller$1;-><init>(Lcom/alles/platformer/Controller;)V

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 70
    sget-object v0, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    iget-object v1, p0, Lcom/alles/platformer/Controller;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Input;->setInputProcessor(Lcom/badlogic/gdx/InputProcessor;)V

    .line 72
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-direct {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;-><init>()V

    .line 73
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->left()Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    move-result-object v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->bottom()Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    .line 75
    new-instance v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-direct {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;-><init>()V

    .line 76
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->left()Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    move-result-object v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->bottom()Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    .line 78
    new-instance v2, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;

    new-instance v3, Lcom/badlogic/gdx/graphics/Texture;

    const-string v4, "flatDark25.png"

    invoke-direct {v3, v4}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    const/high16 v3, 0x42a00000    # 80.0f

    .line 79
    invoke-virtual {v2, v3, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->setSize(FF)V

    .line 80
    new-instance v4, Lcom/alles/platformer/Controller$2;

    invoke-direct {v4, p0}, Lcom/alles/platformer/Controller$2;-><init>(Lcom/alles/platformer/Controller;)V

    invoke-virtual {v2, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 94
    new-instance v4, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;

    new-instance v5, Lcom/badlogic/gdx/graphics/Texture;

    const-string v6, "flatDark26.png"

    invoke-direct {v5, v6}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    .line 95
    invoke-virtual {v4, v3, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->setSize(FF)V

    .line 96
    new-instance v5, Lcom/alles/platformer/Controller$3;

    invoke-direct {v5, p0}, Lcom/alles/platformer/Controller$3;-><init>(Lcom/alles/platformer/Controller;)V

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 110
    new-instance v5, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;

    new-instance v6, Lcom/badlogic/gdx/graphics/Texture;

    const-string v7, "flatDark24.png"

    invoke-direct {v6, v7}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    .line 111
    invoke-virtual {v5, v3, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->setSize(FF)V

    .line 112
    new-instance v6, Lcom/alles/platformer/Controller$4;

    invoke-direct {v6, p0}, Lcom/alles/platformer/Controller$4;-><init>(Lcom/alles/platformer/Controller;)V

    invoke-virtual {v5, v6}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 126
    new-instance v6, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;

    new-instance v7, Lcom/badlogic/gdx/graphics/Texture;

    const-string v8, "flatDark23.png"

    invoke-direct {v7, v8}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    .line 127
    invoke-virtual {v6, v3, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->setSize(FF)V

    .line 128
    new-instance v3, Lcom/alles/platformer/Controller$5;

    invoke-direct {v3, p0}, Lcom/alles/platformer/Controller$5;-><init>(Lcom/alles/platformer/Controller;)V

    invoke-virtual {v6, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 142
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 143
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->row()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v3

    const/high16 v7, 0x40a00000    # 5.0f

    invoke-virtual {v3, v7, v7, v7, v7}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->pad(FFFF)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 144
    invoke-virtual {v1, v6}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v3

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getWidth()F

    move-result v8

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getHeight()F

    move-result v6

    invoke-virtual {v3, v8, v6}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->size(FF)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 145
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 146
    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v3

    invoke-virtual {v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getWidth()F

    move-result v6

    invoke-virtual {v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getHeight()F

    move-result v5

    invoke-virtual {v3, v6, v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->size(FF)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 147
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->row()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v3

    invoke-virtual {v3, v7}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->padBottom(F)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 149
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    const/high16 v3, 0x43fa0000    # 500.0f

    .line 150
    invoke-virtual {v0, v7, v3, v7, v7}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->pad(FFFF)Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    move-result-object v3

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->row()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v3

    invoke-virtual {v3, v7, v7, v7, v7}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->pad(FFFF)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 151
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v3

    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getWidth()F

    move-result v5

    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getHeight()F

    move-result v4

    invoke-virtual {v3, v5, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->size(FF)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 152
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 153
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v3

    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getWidth()F

    move-result v4

    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getHeight()F

    move-result v2

    invoke-virtual {v3, v4, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->size(FF)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 154
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->row()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v2

    invoke-virtual {v2, v7}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->padBottom(F)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 170
    iget-object v2, p0, Lcom/alles/platformer/Controller;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 171
    iget-object v0, p0, Lcom/alles/platformer/Controller;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    return-void
.end method


# virtual methods
.method public draw()V
    .locals 1

    .line 176
    iget-object v0, p0, Lcom/alles/platformer/Controller;->stage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->draw()V

    return-void
.end method

.method public isDownPressed()Z
    .locals 1

    .line 184
    iget-boolean v0, p0, Lcom/alles/platformer/Controller;->downPressed:Z

    return v0
.end method

.method public isLeftPressed()Z
    .locals 1

    .line 188
    iget-boolean v0, p0, Lcom/alles/platformer/Controller;->leftPressed:Z

    return v0
.end method

.method public isRightPressed()Z
    .locals 1

    .line 192
    iget-boolean v0, p0, Lcom/alles/platformer/Controller;->rightPressed:Z

    return v0
.end method

.method public isUpPressed()Z
    .locals 1

    .line 180
    iget-boolean v0, p0, Lcom/alles/platformer/Controller;->upPressed:Z

    return v0
.end method

.method public resize(II)V
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/alles/platformer/Controller;->viewport:Lcom/badlogic/gdx/utils/viewport/Viewport;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/utils/viewport/Viewport;->update(II)V

    return-void
.end method
