# Update for 2000 file diff target
# Explore: explore_1143
# Auto-generated LookML Explore File

include: "/views/domain_30/view_03430.view.lkml"
include: "/views/domain_32/view_03432.view.lkml"
include: "/views/domain_33/view_03433.view.lkml"
include: "/views/domain_34/view_03434.view.lkml"

explore: explore_1143 {
  label: "Explore Explore 1143"
  description: "Comprehensive analytics explore joining base view_03430 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03430
  
  always_filter: {
    filters: [view_03430.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03430.created_at_date: "7 days"]
    unless: [view_03430.id, view_03430.status]
  }

  join: view_03432 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03430.user_id} = ${view_03432.id} ;;
    required_joins: []
  }

  join: view_03433 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03430.account_id} = ${view_03433.account_id} ;;
    required_joins: [view_03432]
  }

  join: view_03434 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03430.category} = ${view_03434.category} ;;
  }

  access_filter: {
    field: view_03430.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03430.is_deleted} = false ;;
}
