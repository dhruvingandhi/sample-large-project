# Explore: explore_1787
# Auto-generated LookML Explore File

include: "/views/domain_12/view_05362.view.lkml"
include: "/views/domain_14/view_05364.view.lkml"
include: "/views/domain_15/view_05365.view.lkml"
include: "/views/domain_16/view_05366.view.lkml"

explore: explore_1787 {
  label: "Explore Explore 1787"
  description: "Comprehensive analytics explore joining base view_05362 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05362
  
  always_filter: {
    filters: [view_05362.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05362.created_at_date: "7 days"]
    unless: [view_05362.id, view_05362.status]
  }

  join: view_05364 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05362.user_id} = ${view_05364.id} ;;
    required_joins: []
  }

  join: view_05365 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05362.account_id} = ${view_05365.account_id} ;;
    required_joins: [view_05364]
  }

  join: view_05366 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05362.category} = ${view_05366.category} ;;
  }

  access_filter: {
    field: view_05362.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05362.is_deleted} = false ;;
}
