# Explore: explore_1711
# Auto-generated LookML Explore File

include: "/views/domain_34/view_05134.view.lkml"
include: "/views/domain_36/view_05136.view.lkml"
include: "/views/domain_37/view_05137.view.lkml"
include: "/views/domain_38/view_05138.view.lkml"

explore: explore_1711 {
  label: "Explore Explore 1711"
  description: "Comprehensive analytics explore joining base view_05134 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05134
  
  always_filter: {
    filters: [view_05134.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05134.created_at_date: "7 days"]
    unless: [view_05134.id, view_05134.status]
  }

  join: view_05136 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05134.user_id} = ${view_05136.id} ;;
    required_joins: []
  }

  join: view_05137 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05134.account_id} = ${view_05137.account_id} ;;
    required_joins: [view_05136]
  }

  join: view_05138 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05134.category} = ${view_05138.category} ;;
  }

  access_filter: {
    field: view_05134.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05134.is_deleted} = false ;;
}
