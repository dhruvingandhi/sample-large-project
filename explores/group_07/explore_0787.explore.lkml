# Explore: explore_0787
# Auto-generated LookML Explore File

include: "/views/domain_12/view_02362.view.lkml"
include: "/views/domain_14/view_02364.view.lkml"
include: "/views/domain_15/view_02365.view.lkml"
include: "/views/domain_16/view_02366.view.lkml"

explore: explore_0787 {
  label: "Explore Explore 0787"
  description: "Comprehensive analytics explore joining base view_02362 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02362
  
  always_filter: {
    filters: [view_02362.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02362.created_at_date: "7 days"]
    unless: [view_02362.id, view_02362.status]
  }

  join: view_02364 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02362.user_id} = ${view_02364.id} ;;
    required_joins: []
  }

  join: view_02365 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02362.account_id} = ${view_02365.account_id} ;;
    required_joins: [view_02364]
  }

  join: view_02366 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02362.category} = ${view_02366.category} ;;
  }

  access_filter: {
    field: view_02362.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02362.is_deleted} = false ;;
}
