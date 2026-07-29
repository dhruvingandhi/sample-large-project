# Explore: explore_3771
# Auto-generated LookML Explore File

include: "/views/domain_14/view_11314.view.lkml"
include: "/views/domain_16/view_11316.view.lkml"
include: "/views/domain_17/view_11317.view.lkml"
include: "/views/domain_18/view_11318.view.lkml"

explore: explore_3771 {
  label: "Explore Explore 3771"
  description: "Comprehensive analytics explore joining base view_11314 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11314
  
  always_filter: {
    filters: [view_11314.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11314.created_at_date: "7 days"]
    unless: [view_11314.id, view_11314.status]
  }

  join: view_11316 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11314.user_id} = ${view_11316.id} ;;
    required_joins: []
  }

  join: view_11317 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11314.account_id} = ${view_11317.account_id} ;;
    required_joins: [view_11316]
  }

  join: view_11318 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11314.category} = ${view_11318.category} ;;
  }

  access_filter: {
    field: view_11314.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11314.is_deleted} = false ;;
}
