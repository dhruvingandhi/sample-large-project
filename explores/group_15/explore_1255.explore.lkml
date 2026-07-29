# Explore: explore_1255
# Auto-generated LookML Explore File

include: "/views/domain_16/view_03766.view.lkml"
include: "/views/domain_18/view_03768.view.lkml"
include: "/views/domain_19/view_03769.view.lkml"
include: "/views/domain_20/view_03770.view.lkml"

explore: explore_1255 {
  label: "Explore Explore 1255"
  description: "Comprehensive analytics explore joining base view_03766 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03766
  
  always_filter: {
    filters: [view_03766.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03766.created_at_date: "7 days"]
    unless: [view_03766.id, view_03766.status]
  }

  join: view_03768 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03766.user_id} = ${view_03768.id} ;;
    required_joins: []
  }

  join: view_03769 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03766.account_id} = ${view_03769.account_id} ;;
    required_joins: [view_03768]
  }

  join: view_03770 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03766.category} = ${view_03770.category} ;;
  }

  access_filter: {
    field: view_03766.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03766.is_deleted} = false ;;
}
