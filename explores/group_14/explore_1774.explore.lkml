# Explore: explore_1774
# Auto-generated LookML Explore File

include: "/views/domain_23/view_05323.view.lkml"
include: "/views/domain_25/view_05325.view.lkml"
include: "/views/domain_26/view_05326.view.lkml"
include: "/views/domain_27/view_05327.view.lkml"

explore: explore_1774 {
  label: "Explore Explore 1774"
  description: "Comprehensive analytics explore joining base view_05323 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05323
  
  always_filter: {
    filters: [view_05323.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05323.created_at_date: "7 days"]
    unless: [view_05323.id, view_05323.status]
  }

  join: view_05325 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05323.user_id} = ${view_05325.id} ;;
    required_joins: []
  }

  join: view_05326 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05323.account_id} = ${view_05326.account_id} ;;
    required_joins: [view_05325]
  }

  join: view_05327 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05323.category} = ${view_05327.category} ;;
  }

  access_filter: {
    field: view_05323.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05323.is_deleted} = false ;;
}
