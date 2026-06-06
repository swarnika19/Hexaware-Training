# Part 1 – File Handling
import csv
with open("players.csv","r") as file:
    reader=csv.DictReader(file)
    players=list(reader)

for row in players:
    print(row)

count=len(players)
print("Total Players:",count)

# Part 2 – Player Analytics
highest_runs=0
top_player=""
for row in players:
    if int(row["runs"])>highest_runs:
        highest_runs=int(row["runs"])
        top_player=row["player_name"]
print("Highest Run Scorer:",top_player)

lowest_runs=float("inf")
low_player=""
for row in players:
    if int(row["runs"])<lowest_runs:
        lowest_runs=int(row["runs"])
        low_player=row["player_name"]
print("Lowest Run Scorer:",low_player)

total_runs=0
for row in players:
    total_runs+=int(row["runs"])
print("Average Runs:",total_runs/count)

for row in players:
    if int(row["runs"])>600:
        print(row["player_name"])

for row in players:
    if int(row["runs"])<500:
        print(row["player_name"])

# Part 3 – Team Analytics
team_players={}
for row in players:
    team=row["team"]
    if team in team_players:
        team_players[team]+=1
    else:
        team_players[team]=1
print(team_players)

team_runs={}
for row in players:
    team=row["team"]
    runs=int(row["runs"])
    if team in team_runs:
        team_runs[team]+=runs
    else:
        team_runs[team]=runs
print(team_runs)

top_team=""
highest_runs=0
for team in team_runs:
    if team_runs[team]>highest_runs:
        highest_runs=team_runs[team]
        top_team=team
print("Team With Highest Runs:",top_team)

low_team=""
lowest_runs=float("inf")
for team in team_runs:
    if team_runs[team]<lowest_runs:
        lowest_runs=team_runs[team]
        low_team=team
print("Team With Lowest Runs:",low_team)

# Part 4 – Boundary Analysis
most_fours=0
player=""
for row in players:
    if int(row["fours"])>most_fours:
        most_fours=int(row["fours"])
        player=row["player_name"]
print("Player With Most Fours:",player)

most_sixes=0
player=""
for row in players:
    if int(row["sixes"])>most_sixes:
        most_sixes=int(row["sixes"])
        player=row["player_name"]
print("Player With Most Sixes:",player)

total_fours=0
for row in players:
    total_fours+=int(row["fours"])
print("Total Fours:",total_fours)

total_sixes=0
for row in players:
    total_sixes+=int(row["sixes"])
print("Total Sixes:",total_sixes)

# Part 5 – Lists, Sets and Dictionaries
player_names=[]
for row in players:
    player_names.append(row["player_name"])
player_names.sort()
print(player_names)

teams=set()
for row in players:
    teams.add(row["team"])
print(teams)

team_runs={}
for row in players:
    team=row["team"]
    runs=int(row["runs"])
    if team in team_runs:
        team_runs[team]+=runs
    else:
        team_runs[team]=runs
print(team_runs)

player_runs={}
for row in players:
    player_runs[row["player_name"]]=int(row["runs"])
print(player_runs)

# Part 6 – Functions
def find_top_scorer():
    player=""
    highest_runs=0
    for row in players:
        if int(row["runs"])>highest_runs:
            highest_runs=int(row["runs"])
            player=row["player_name"]
    return player
print(find_top_scorer())

def calculate_average_runs():
    total_runs=0
    for row in players:
        total_runs+=int(row["runs"])
    return total_runs/count
print(calculate_average_runs())

def find_best_team():
    team_runs={}
    for row in players:
        team=row["team"]
        runs=int(row["runs"])
        if team in team_runs:
            team_runs[team]+=runs
        else:
            team_runs[team]=runs
    best_team=""
    highest_runs=0
    for team in team_runs:
        if team_runs[team]>highest_runs:
            highest_runs=team_runs[team]
            best_team=team
    return best_team
print(find_best_team())

def find_total_boundaries():
    total=0
    for row in players:
        total+=int(row["fours"])+int(row["sixes"])
    return total
print(find_total_boundaries())

# Part 7 – Exception Handling
try:
    with open("players.csv","r") as file:
        reader=csv.DictReader(file)
        players=list(reader)
except FileNotFoundError:
    print("File not found")

for row in players:
    try:
        runs=int(row["runs"])
    except ValueError:
        print("Invalid run value")

for row in players:
    try:
        matches=int(row["matches"])
    except ValueError:
        print("Invalid match count")

# Part 8 – NumPy
import numpy as np
runs=[]
for row in players:
    runs.append(int(row["runs"]))
runs=np.array(runs)
print("Total Runs:",np.sum(runs))
print("Average Runs:",np.mean(runs))
print("Maximum Runs:",np.max(runs))
print("Minimum Runs:",np.min(runs))
print("Standard Deviation:",np.std(runs))
print("Median:",np.median(runs))

# Part 9 – Pandas
import pandas as pd
df=pd.read_csv("players.csv")
print(df)

print(df.sort_values(by="runs",ascending=False).head())

print(df.sort_values(by="runs",ascending=False))

print(df.groupby("team")["runs"].sum())

print(df.groupby("team")["runs"].mean())

print(df[df["runs"]>600])

print(df.groupby("team")["runs"].sum().idxmax())

# Report Generation
team_runs={}
for row in players:
    team=row["team"]
    runs=int(row["runs"])
    if team in team_runs:
        team_runs[team]+=runs
    else:
        team_runs[team]=runs

top_5=sorted(players,key=lambda x:int(x["runs"]),reverse=True)[:5]

with open("cricket_report.txt","w") as file:
    file.write("CRICKET ANALYTICS REPORT\n")
    file.write(f"Total Players: {count}\n")
    file.write(f"Total Runs: {total_runs}\n")
    file.write(f"Average Runs: {total_runs/count}\n")
    file.write(f"Highest Scorer: {top_player}\n")
    file.write(f"Lowest Scorer: {low_player}\n\n")
    file.write("Team Wise Runs\n")
    for team,runs in team_runs.items():
        file.write(f"{team}: {runs}\n")
    file.write("\nTop 5 Players\n")
    for player in top_5:
        file.write(f"{player['player_name']} - {player['runs']}\n")
    file.write(f"\nMost Fours: {most_fours}\n")
    file.write(f"Most Sixes: {most_sixes}\n")

print("Report Generated Successfully")

# Bonus Tasks
with open("top_players.csv","w",newline="") as file:
    writer=csv.DictWriter(file,fieldnames=players[0].keys())
    writer.writeheader()
    for row in players:
        if int(row["runs"])>600:
            writer.writerow(row)

with open("team_summary.csv","w",newline="") as file:
    fieldnames=["Team","Total Runs","Average Runs","Player Count"]
    writer=csv.DictWriter(file,fieldnames=fieldnames)
    writer.writeheader()
    for team in team_runs:
        total=team_runs[team]
        player_count=team_players[team]
        average=total/player_count
        writer.writerow({"Team":team,"Total Runs":total,"Average Runs":average,"Player Count":player_count})

while True:
    print("1.Player Analysis")
    print("2.Team Analysis")
    print("3.Boundary Analysis")
    print("4.Export Reports")
    print("5.Exit")
    choice=int(input("Enter choice:"))
    if choice==1:
        print("Highest Scorer:",top_player)
        print("Lowest Scorer:",low_player)
        print("Average Runs:",total_runs/count)
    elif choice==2:
        print("Team Runs:",team_runs)
        print("Top Team:",top_team)
        print("Low Team:",low_team)
    elif choice==3:
        print("Most Fours:",most_fours)
        print("Most Sixes:",most_sixes)
        print("Total Fours:",total_fours)
        print("Total Sixes:",total_sixes)
    elif choice==4:
        print("Reports Exported Successfully")
    elif choice==5:
        break
    else:
        print("Invalid Choice")