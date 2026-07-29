# Explore: explore_1249
# Auto-generated LookML Explore File

include: "/views/domain_48/view_03748.view.lkml"
include: "/views/domain_50/view_03750.view.lkml"
include: "/views/domain_01/view_03751.view.lkml"
include: "/views/domain_02/view_03752.view.lkml"

explore: explore_1249 {
  label: "Explore Explore 1249"
  description: "Comprehensive analytics explore joining base view_03748 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03748
  
  always_filter: {
    filters: [view_03748.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03748.created_at_date: "7 days"]
    unless: [view_03748.id, view_03748.status]
  }

  join: view_03750 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03748.user_id} = ${view_03750.id} ;;
    required_joins: []
  }

  join: view_03751 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03748.account_id} = ${view_03751.account_id} ;;
    required_joins: [view_03750]
  }

  join: view_03752 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03748.category} = ${view_03752.category} ;;
  }

  access_filter: {
    field: view_03748.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03748.is_deleted} = false ;;
}
