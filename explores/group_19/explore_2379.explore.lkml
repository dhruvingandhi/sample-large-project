# Update for 2000 file diff target
# Explore: explore_2379
# Auto-generated LookML Explore File

include: "/views/domain_38/view_07138.view.lkml"
include: "/views/domain_40/view_07140.view.lkml"
include: "/views/domain_41/view_07141.view.lkml"
include: "/views/domain_42/view_07142.view.lkml"

explore: explore_2379 {
  label: "Explore Explore 2379"
  description: "Comprehensive analytics explore joining base view_07138 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07138
  
  always_filter: {
    filters: [view_07138.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07138.created_at_date: "7 days"]
    unless: [view_07138.id, view_07138.status]
  }

  join: view_07140 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07138.user_id} = ${view_07140.id} ;;
    required_joins: []
  }

  join: view_07141 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07138.account_id} = ${view_07141.account_id} ;;
    required_joins: [view_07140]
  }

  join: view_07142 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07138.category} = ${view_07142.category} ;;
  }

  access_filter: {
    field: view_07138.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07138.is_deleted} = false ;;
}
