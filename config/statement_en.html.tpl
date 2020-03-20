<!-- LEAGUES level1 level2 level3 -->
<div id="statement_back" class="statement_back" style="display:none"></div>  <div class="statement-body">
    <!-- GOAL -->
    <div class="statement-section statement-goal">
        <h2>
            <span class="icon icon-goal">&nbsp;</span>
            <span>The Goal</span>
        </h2>
        <div class="statement-goal-content">
            You pilot a submarine and you know that an enemy is present near you because you are listening its radio frequency communication.
            You don't know exactly where it is but you can hear all its orders.
            You and your opponent have <const>6</const> hit points. When a player's hit points reach <const>0</const>, the player loses.
        </div>
    </div>
    <!-- RULES -->
    <div class="statement-section statement-rules">
        <h2>
            <span class="icon icon-rules">&nbsp;</span>
            <span>Rules</span>
        </h2>
        <div><div class="statement-rules-content">
            <h2>Definitions</h2>
            <p>
            <ul>
                <li>Submarines move on a map constituted of water and islands. They can only move on cells with water. They can share the same cell without colliding.</li>
                <li>The map is <const>15</const> cells in width and <const>15</const> cells in height. Coordinates start at (0,0) which is the top left cell of the map.</li>
                <li>The map is split in <const>9</const> sectors, which contain <const>25</const> cells each (5x5 blocks of cells). The top left sector is <const>1</const>. The bottom right sector is <const>9</const>.</li>
            </ul>
            </p>

            <h2>Beginning of the game</h2>
            <p>
                At the beginning of the game, you'll receive a map (15x15 cells) that indicates the position of islands.
                Islands are obstacles. You cannot move or fire through islands. Then, you will decide where you want to place your submarine by indicating a coordinate (x,y).
            </p>


            <h2> Each turn</h2>
            <p>This is a turn based game which mean that each player plays a turn one after one. The player with the id 0 begins.
                During your turn, thankfully to your radio frequency analysis, you will receive an indication of what your opponent has done.
                For example, you can receive that it moved to the north. It's up to you to use this valuable information to detect where it is. Then, you must perform at least one action.
            </p>

            <h2>Actions</h2>
            <p>
                Each turn you must perform at least one action. You can do several actions by chaining them using the pipe <const>|</const>.
                But you can use each type of action only once per turn (you can move one time per turn, no more).
                If you fail to output a valid action, you will SURFACE in that turn.
            </p>

            <p><strong>Move</strong></p>
            A move action moves your submarine <const>1</const> cell in a given direction (north, east, south, west) and charges a power of your choice.
            When you move, you must respect the following rules:
            <ul><li> You cannot move through islands</li>
                <li>You cannot move on a cell you already visited before</li>
            </ul>
            You can decide, what to charge. Different devices require a different amount of charges to be ready.
            <!-- BEGIN level1 -->
            In this league you can only charge the torpedo.
            <!-- END -->
            <!-- BEGIN level2 -->
            In this league you can charge the torpedo, the sonar and the silence mode.
            <!-- END -->
            <!-- BEGIN level3 -->
            You can charge the torpedo, the sonar, the silence mode and mines.
            <!-- END -->

            <br><br><p><strong>Surface</strong></p>
            By using surface you will reset your path of visited cells so that you can freely move to a cell that you have previously visited.
            But surfacing has a major impact: your opponent will know in which sector you are surfacing and you lose <const>1</const> hit point.

            <br><br><p><strong>Torpedo</strong></p>
            A torpedo requires <const>3</const> charge actions to be ready.
            When fully charged, the torpedo can be fired at an arbitrary water position within a range of <const>4</const> cells.
            This allows the torpedo's path to contain corners and go around islands, but not through them.
            The damage of the explosion is <const>2</const> on the cell itself and <const>1</const> and all neighbors (including diagonal ones).

            <!-- BEGIN level2 level3 -->
            <br><br><p><strong>Sonar</strong></p>
            Sonar requires <const>4</const> charge actions to load.
            It allows you to check, if the opponent's submarine is in a given sector. You will get the response in your next turn.
            This is in respect to the time of issuing the command, not after the opponent moved.

            <br><br><p><strong>Silence</strong></p>
            Silence requires <const>6</const> charge actions to load.
            This allows you to move <const>0</const> to <const>4</const> cells in a given direction (not visiting already visited cells or islands).
            Your opponent will not know in which direction or how far you've moved.
            <!-- END -->

            <!-- BEGIN level3 -->
            <br><br><p><strong>Mine</strong></p>
            Mine requires <const>3</const> charge actions to load.
            It can be placed on any cell next to you (north, east, south, west).
            You can't place two own mines on the same cell. However it's possible to place your own mine on an opponent mine or the opponent's submarine itself.
            Mines will only detonate when using the trigger command, not when moving onto them.

            <br><br><p><strong>Trigger</strong></p>
            Triggering a mine will cause an explosion. You can only trigger your own mines.
            Like for a torpedo, the explosion has a damage of <const>2</const> on the location of the mine and <const>1</const> damage to nearby cells (including diagonally).
            You can't trigger multiple mines in the same turn.
            <!-- END -->

            <br>
            <br>
            The following table shows, how different actions will be shown to your opponent:
            <br>TODO: along with screenshot, as this table uses concrete examples and isn't abstract?
            <table>
                <tr><th>Your action</th><th>Shown to opponent</th><th>comment</th></tr>
                <tr>
                    <td><action>MOVE N TORPEDO</action></td>
                    <td><action>MOVE N</action></td>
                    <td>The opponent will see the movement direction (in this case: north), but not which power is charged</td>
                </tr>
                <tr>
                    <td><action>SURFACE</action></td>
                    <td><action>SURFACE 3</action></td>
                    <td>The opponent will see, that you surfaced in sector 3</td>
                </tr>
                <tr>
                    <td><action>TORPEDO 3 5</action></td>
                    <td><action>TORPEDO 3 5</action></td>
                    <td>The opponent will see, that you fired a torpedo at the cell (3,5)</td>
                </tr>
                <!-- BEGIN level2 level3 -->
                <tr>
                    <td><action>SONAR 4</action></td>
                    <td><action>SONAR4</action></td>
                    <td>The opponent will see, that you used a sonar on sector 4. You will receive the sonar result (Y/N for yes/no) in the next turn.</td>
                </tr>
                <tr>
                    <td><action>SILENCE N 4</action></td>
                    <td><action>SILENCE</action></td>
                    <td>The opponent will see, that you moved silently - but not where or how far</td>
                </tr>
                <!-- END -->
                <!-- BEGIN level3 -->
                <tr>
                    <td><action>MINE E</action></td>
                    <td><action>MINE</action></td>
                    <td>The opponent will see, that you placed a mine - but not in which direction</td>
                </tr>
                <tr>
                    <td><action>TRIGGER 3 5</action></td>
                    <td><action>TRIGGER 3 5</action></td>
                    <td>The opponent will see, that you trigger a mine at cell (3,5)</td>
                </tr>
                <!-- END -->
            </table>

            </div>
            <!-- Victory conditions -->
            <div class="statement-victory-conditions">
                <div class="icon victory"></div>
                <div class="blk">
                    <div class="title">Victory Conditions</div>
                    <div class="text">Have more lifes than your enemy at the end of the game.</div>
                </div>
            </div>
            <!-- Lose conditions -->
            <div class="statement-lose-conditions">
                <div class="icon lose"></div>
                <div class="blk">
                    <div class="title">Lose Conditions</div>
                    <ul>
                        <li><div class="text">Output an invalid command or don't respond in time.</div></li>
                        <li><div class="text">Reach 0 lives.</div></li>
                        <li><div class="text">Intersect your own path, move into an island or out of the map.</div></li>
                    </ul>
                </div>
            </div>

            <div class="statement-section statement-expertrules">
                <h1>
                    <span class="icon icon-expertrules">&nbsp;</span>
                    <span>Expert Rules</span>
                </h1>

                <div class="statement-expert-rules-content">
                    The source code can be found here: <a href="https://github.com/CodinGameCommunity/ocean-of-code" target="_blank">https://github.com/CodinGameCommunity/ocean-of-code</a>.
                </div>
            </div>
        </div>
    </div>
    <!-- PROTOCOL -->
    <div class="statement-section statement-protocol">
        <h2>
            <span class="icon icon-protocol">&nbsp;</span>
            <span>Game Input</span>
        </h2>
        <!-- Protocol block -->
        <div class="blk">
            <div class="title">Inputs of the first turn</div>
            <div class="text"><span class="statement-lineno">Line 1: </span> a string with 3 space separated integers<br>
                <var>width</var> <var>height</var> <var>myId</var><br>
                <ul><li><var>width</var> and <var>height</var> that indicates the size of the grid in term of cells (15 15)</li>
                    <li><var>myId</var> that indicates your player ID (<const>0</const> or <const>1</const>). The player with ID <const>0</const> begins.</li>
                </ul>
                <span class="statement-lineno">Next <var>height</var> lines:</span> a string of <var>width</var> chars representing the content of each cells of this row. <const>x</const> for an island, <const>.</const> for an empty cell.</div>
        </div>

        <!-- Protocol block -->
        <div class="blk">
            <div class="title">Output for the first turn</div>
            <div class="text">2 space separated integers <var>x</var> <var>y</var> which represent the coordinate of your starting position. The cell at the specified coordinate should be empty which means no island, but the opponent can choose the same cell!</div>
        </div>

        <!-- Protocol block -->
        <div class="blk">
            <div class="title">Inputs for each next turns</div>
            <div class="text"><span class="statement-lineno">Line 1: </span>a string with 8 space separated integers.
                <br> <var>x</var> <var>y</var> <var>myLife</var> <var>oppLife</var> <var>sonarResult</var> <var>torpedoCooldown</var> <var>sonarCooldown</var> <var>silenceCooldown</var> <var>mineCooldown</var><br>
                <ul>
                    <li><var>x</var> and <var>y</var> represents your current position.</li>
                    <li><var>myLife</var> and <var>oppLife</var> gives the number of hit points remaining for, respectively, you and your opponent</li>
                    <li><var>torpedoCooldown</var> <var>sonarCooldown</var> <var>silenceCooldown</var> <var>mineCooldown</var> represent the cooldowns for each device
                    <!-- BEGIN level1 level2 -->
                        Devices unavailable in your league will have <const>-1</const>.
                    <!-- END -->
                    </li>
                </ul>
                <span class="statement-lineno">Line 2: </span> a string <var>sonarResult</var> which gives you the result of the <action>SONAR</action> action: <const>Y</const> for yes, <const>N</const> for no. It is <const>NA</const>, if no sonar was used. <br>
                <span class="statement-lineno">Line 3: </span> a summary of the actions (separated by <const>|</const>) that your opponent has made during its turn.<br>
                Example: <action>MOVE</action> N |<action>TORPEDO</action> 3 5<br>
                This example indicates that your opponent moved to the north and then fire a torpedo at the cell (3, 5).<br>
                <const>NA</const> is used the first turn of the starting player (this is the only case where your opponent has done nothing yet).</div>
        </div>

        <!-- Protocol block -->
        <div class="blk">
            <div class="title">Output for each next turns</div>
            <div class="text">One or multiple commands separated by <const>|</const>. <br />
                e.g.: <var>MOVE N TORPEDO | TORPEDO 3 5</var> These commands move your submarine to the north and then fire a torpedo at the cell 3,5.

                Here are the different available actions:
                <ul>
                    <li><action>MOVE direction POWER</action></li>
                    <li><action>SURFACE</action></li>
                    <li><action>TORPEDO X Y</action></li>
                    <!-- BEGIN level2 level3 -->
                    <li><action>SONAR</action></li>
                    <li><action>SILENCE direction distance</action></li>
                    <!-- END -->
                    <!-- BEGIN level3 -->
                    <li><action>MINE direction</action></li>
                    <li><action>TRIGGER X Y</action></li>
                    <!-- END -->
                    <li><action>MSG message</action></li>
                </ul></div>
        </div>
    </div>
</div>