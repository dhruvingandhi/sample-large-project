# Explore: explore_3527
# Auto-generated LookML Explore File

include: "/views/domain_32/view_10582.view.lkml"
include: "/views/domain_34/view_10584.view.lkml"
include: "/views/domain_35/view_10585.view.lkml"
include: "/views/domain_36/view_10586.view.lkml"

explore: explore_3527 {
  label: "Explore Explore 3527"
  description: "Comprehensive analytics explore joining base view_10582 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10582
  
  always_filter: {
    filters: [view_10582.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10582.created_at_date: "7 days"]
    unless: [view_10582.id, view_10582.status]
  }

  join: view_10584 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10582.user_id} = ${view_10584.id} ;;
    required_joins: []
  }

  join: view_10585 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10582.account_id} = ${view_10585.account_id} ;;
    required_joins: [view_10584]
  }

  join: view_10586 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10582.category} = ${view_10586.category} ;;
  }

  access_filter: {
    field: view_10582.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10582.is_deleted} = false ;;
}
