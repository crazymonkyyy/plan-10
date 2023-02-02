import raylib;
import std;
enum windowx=800;
enum windowy=600;

Color tocolor(string s){
	import std.range;
	Color output;
	enum zippy= zip(
		[16,1].cycle,
		["r","r","g","g","b","b","a","a"],
		iota(0,100));
	static foreach(digit,mix,i;zippy){ {
		int t;
		if(s[i]>='0' && s[i]<='9'){
			t=s[i]-'0';}
		if(s[i]>='a' && s[i]<='f'){
			t=s[i]-'a'+10;}
		if(s[i]>='A' && s[i]<='F'){
			t=s[i]-'A'+10;}
		t*=digit;
		mixin("output."~mix)+=t;
	} }
	return output;
}

void main(){
	SetTraceLogLevel(int.max);
	InitWindow(windowx, windowy, "Hello, Raylib-D!");
	SetWindowPosition(2000,0);
	int y;
	SetTargetFPS(60);
	BeginDrawing();
	ClearBackground(Colors.BLACK);
	EndDrawing();
	writeln("🕛");
	stdout.flush;
	auto log=File("log","w");
	while (!WindowShouldClose()){
		//log.writeln("in while loop"); log.flush;
		BeginDrawing();
			//log.writeln("started drawing"); log.flush;
			//foreach(dstring a;data_.map!(a=>a.to!dstring)){try{
			//if(!stdin.eof){
				auto data_=readln.to!dstring;
				log.writeln(data_); log.flush;
				try{
				dchar command=data_[0];
				string[] rest=data_[1..$].split(' ').map!(a=>a.to!string).array;
				switch(command){
					case '🟥':
						DrawPixel(rest[0].to!int,rest[1].to!int,rest[2].tocolor);
						break;
					case ' ':
						ClearBackground(rest[1].tocolor);
						break;
					case '⚫':
						DrawCircle(rest[0].to!int,rest[1].to!int,rest[2].to!float,rest[3].tocolor);
						break;
					case '◾':
						DrawRectangle(rest[0].to!int,rest[1].to!int,rest[2].to!int,rest[3].to!int,
								rest[5].tocolor);
						break;
					case '🄰':
						DrawText(rest[3..$-1].joiner(" ").to!string.toStringz
								,rest[0].to!int,rest[1].to!int,rest[2].to!int,
								rest[$-1].tocolor);
						break;
					default:
				}
			}catch(Throwable){}//}
		//log.writeln("left if statement"); log.flush;
		writeln("🕛");
		stdout.flush;
		EndDrawing();
	}
	CloseWindow();
}