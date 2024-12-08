using Godot;
using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Text.Json.Serialization;


public partial class Scenario : Node
{
	public SceneBackground Background { get; set; }
	public List<SceneItem> Itens { get; set; }
	public List<SceneDialogue> Dialogue { get; set; }
	public List<SceneOption> Options { get; set; }
	
	public Scenario(SceneBackground background, List<SceneItem> itens, List<SceneDialogue> dialogue, List<SceneOption> options )
	{
		Background = background;
		Itens = itens;
		Dialogue = dialogue;
		Options = options;
	}
	
	public static List<Scenario> DeserializeScenarios(string jsonString)
	{
		GD.Print("DeserializeScenarios");
		// GD.Print(jsonString);
		List<Scenario> batata = JsonSerializer.Deserialize<List<Scenario>>(jsonString);
		foreach(Scenario scenario in batata){
			GD.Print("scenario");
		}
		
		return batata;
	}
	
	public override string ToString()
	{
		string itensStr = Itens != null ? string.Join(", ", Itens) : "None";
		string dialogueStr = Dialogue != null ? string.Join(", ", Dialogue) : "None";
		string optionsStr = Options != null ? string.Join(", ", Options) : "None";

		return $"Scenario [Background: {Background?.Path ?? "None"}, Itens: [{itensStr}], Dialogue: [{dialogueStr}], Options: [{optionsStr}]]";
	}
	
	public class SceneBackground
	{
		public string Path { get; set; }
	}
	public class SceneItem
	{
		public string Path { get; set; }
		public int PositionX { get; set; }
		public int PositionY { get; set; }
	}

	public class SceneDialogue
	{
		public string Title { get; set; }
		public string Text { get; set; }
	}

	public class SceneOption
	{
		public string File { get; set; }
		public string Text { get; set; }
	}
}
