# Antigravity modified: branch dg-3
# Explore: explore_0445
# Auto-generated LookML Explore File

include: "/views/domain_36/view_01336.view.lkml"
include: "/views/domain_38/view_01338.view.lkml"
include: "/views/domain_39/view_01339.view.lkml"
include: "/views/domain_40/view_01340.view.lkml"

explore: explore_0445 {
  label: "Explore Explore 0445"
  description: "Comprehensive analytics explore joining base view_01336 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01336
  
  always_filter: {
    filters: [view_01336.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01336.created_at_date: "7 days"]
    unless: [view_01336.id, view_01336.status]
  }

  join: view_01338 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01336.user_id} = ${view_01338.id} ;;
    required_joins: []
  }

  join: view_01339 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01336.account_id} = ${view_01339.account_id} ;;
    required_joins: [view_01338]
  }

  join: view_01340 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01336.category} = ${view_01340.category} ;;
  }

  access_filter: {
    field: view_01336.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01336.is_deleted} = false ;;
}
