# Explore: explore_2787
# Auto-generated LookML Explore File

include: "/views/domain_12/view_08362.view.lkml"
include: "/views/domain_14/view_08364.view.lkml"
include: "/views/domain_15/view_08365.view.lkml"
include: "/views/domain_16/view_08366.view.lkml"

explore: explore_2787 {
  label: "Explore Explore 2787"
  description: "Comprehensive analytics explore joining base view_08362 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08362
  
  always_filter: {
    filters: [view_08362.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08362.created_at_date: "7 days"]
    unless: [view_08362.id, view_08362.status]
  }

  join: view_08364 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08362.user_id} = ${view_08364.id} ;;
    required_joins: []
  }

  join: view_08365 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08362.account_id} = ${view_08365.account_id} ;;
    required_joins: [view_08364]
  }

  join: view_08366 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08362.category} = ${view_08366.category} ;;
  }

  access_filter: {
    field: view_08362.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08362.is_deleted} = false ;;
}
