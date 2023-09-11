import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wikylyu_xyz/widgets/l10n/switch_language_dialog.dart';
import 'package:wikylyu_xyz/widgets/website_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<String> labels = [
    "Golang",
    "Python",
    "Scrapy",
    "PostgreSQL",
    "Django",
    "Flutter",
    "Angular",
    "LangChain",
    "Nginx",
    "Google Play",
    "App Store"
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Title(
      color: Colors.white,
      title: l10n.appTitle,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(l10n.home),
          actions: const [
            SwitchLanguageButton(),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: [
              buildHeader(),
              const Divider(),
              buildTitle(l10n.websitesIBuild),
              WebsiteItem(
                name: l10n.seogptName,
                description: l10n.seogptDescription,
                icon: "assets/images/seogpt_logo64x64.png",
                url: "https://seogpt.work",
              ),
              WebsiteItem(
                name: l10n.dadachatName,
                description: l10n.dadachatDescription,
                icon: "assets/images/dadachat_logo64x64.png",
                url: "https://dadachat.cn",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String name) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        width: 800,
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 40,
        left: 10,
        right: 10,
      ),
      height: 480,
      child: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            spawnMaxSpeed: 50,
            spawnMinSpeed: 10,
            baseColor: Theme.of(context).colorScheme.primary,
            particleCount: 50,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo150x150.png",
              width: 140,
              height: 140,
              isAntiAlias: true,
              fit: BoxFit.contain,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                l10n.selfName,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Container(
              width: 400,
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                l10n.selfBrief,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              width: 400,
              margin: const EdgeInsets.only(
                top: 20,
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Wrap(
                spacing: 20,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: labels
                    .map(
                      (e) => Badge(
                        padding: const EdgeInsets.only(
                          left: 6,
                          right: 6,
                        ),
                        largeSize: 18,
                        label: Text(e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
