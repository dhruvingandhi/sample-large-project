# Explore: explore_3787
# Auto-generated LookML Explore File

include: "/views/domain_12/view_11362.view.lkml"
include: "/views/domain_14/view_11364.view.lkml"
include: "/views/domain_15/view_11365.view.lkml"
include: "/views/domain_16/view_11366.view.lkml"

explore: explore_3787 {
  label: "Explore Explore 3787"
  description: "Comprehensive analytics explore joining base view_11362 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11362
  
  always_filter: {
    filters: [view_11362.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11362.created_at_date: "7 days"]
    unless: [view_11362.id, view_11362.status]
  }

  join: view_11364 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11362.user_id} = ${view_11364.id} ;;
    required_joins: []
  }

  join: view_11365 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11362.account_id} = ${view_11365.account_id} ;;
    required_joins: [view_11364]
  }

  join: view_11366 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11362.category} = ${view_11366.category} ;;
  }

  access_filter: {
    field: view_11362.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11362.is_deleted} = false ;;
}
