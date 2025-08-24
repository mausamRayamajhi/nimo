import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/model/coin.dart';
import 'package:flutter/material.dart';

class CoinDetailsWidget extends StatelessWidget {
  final Coin coin;

  const CoinDetailsWidget({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E2A47), Color(0xFF0F1A2A)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildInfoCard(),
            const SizedBox(height: 20),
            _buildSentimentCard(),
            const SizedBox(height: 20),
            _buildDescriptionCard(),
            const SizedBox(height: 20),
            _buildCategoriesCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        if (coin.image?.large != null)
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              child: CachedNetworkImage(
                imageUrl: coin.image!.large!,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.white70),
              ),
            ),
          ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coin.name ?? 'N/A',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                coin.symbol?.toUpperCase() ?? 'N/A',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(Icons.label_important_outline, 'ID', coin.id),
            _buildInfoRow(
              Icons.leaderboard_outlined,
              'Market Cap Rank',
              coin.marketCapRank?.toString(),
            ),
            _buildInfoRow(
              Icons.timeline,
              'Hashing Algorithm',
              coin.hashingAlgorithm,
            ),
            _buildInfoRow(
              Icons.access_time_outlined,
              'Block Time (min)',
              coin.blockTimeInMinutes?.toString(),
            ),
            _buildInfoRow(
              Icons.watch_later_outlined,
              'Genesis Date',
              coin.genesisDate?.toLocal().toString().split(' ')[0],
            ),
            _buildInfoRow(
              Icons.group_add_outlined,
              'Watchlist Users',
              coin.watchlistPortfolioUsers?.toString(),
            ),
            _buildInfoRow(
              Icons.update,
              'Last Updated',
              coin.lastUpdated?.toLocal().toString(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blueAccent, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value ?? 'N/A',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSentimentCard() {
    final upVotes = coin.sentimentVotesUpPercentage ?? 0.0;
    final downVotes = coin.sentimentVotesDownPercentage ?? 0.0;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sentiment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildSentimentRow(
              Icons.thumb_up_alt_outlined,
              'Up Votes',
              upVotes,
              Colors.greenAccent,
            ),
            const SizedBox(height: 12),
            _buildSentimentRow(
              Icons.thumb_down_alt_outlined,
              'Down Votes',
              downVotes,
              Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSentimentRow(
    IconData icon,
    String title,
    double percentage,
    Color color,
  ) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: percentage / 100,
                  backgroundColor: Colors.white.withOpacity(0.1),
                  color: color,
                  minHeight: 10,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '${percentage.toStringAsFixed(2)}%',
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildDescriptionCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              coin.description?.en ?? 'No description available.',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children:
                  coin.categories
                      ?.map(
                        (category) => Chip(
                          label: Text(
                            category,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.blueAccent.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                      .toList() ??
                  [
                    const Text(
                      'No categories available.',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
            ),
          ],
        ),
      ),
    );
  }
}
