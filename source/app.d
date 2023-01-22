import raylib;
import std;
enum windowx=800;
enum windowy=600;

void main(string[] s){
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	SetWindowPosition(2000,0);
	("mkfifo "~s[1]).executeShell;
	File data;
	int y;
	BeginDrawing();
	ClearBackground(Colors.BLACK);
	EndDrawing();
	while (!WindowShouldClose()){
		data.open(s[1]);
		auto data_=data.byLineCopy;
		if(data_.front==""){}
		BeginDrawing();
			
			foreach(a;data_){
				DrawText(a.toStringz, 0,y, 20, Colors.WHITE);
				y+=25;
			}
			//DrawFPS(10,10);
		EndDrawing();
	}
	CloseWindow();
}