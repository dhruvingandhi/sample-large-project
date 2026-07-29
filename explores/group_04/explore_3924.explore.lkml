# Explore: explore_3924
# Auto-generated LookML Explore File

include: "/views/domain_23/view_11773.view.lkml"
include: "/views/domain_25/view_11775.view.lkml"
include: "/views/domain_26/view_11776.view.lkml"
include: "/views/domain_27/view_11777.view.lkml"

explore: explore_3924 {
  label: "Explore Explore 3924"
  description: "Comprehensive analytics explore joining base view_11773 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11773
  
  always_filter: {
    filters: [view_11773.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11773.created_at_date: "7 days"]
    unless: [view_11773.id, view_11773.status]
  }

  join: view_11775 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11773.user_id} = ${view_11775.id} ;;
    required_joins: []
  }

  join: view_11776 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11773.account_id} = ${view_11776.account_id} ;;
    required_joins: [view_11775]
  }

  join: view_11777 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11773.category} = ${view_11777.category} ;;
  }

  access_filter: {
    field: view_11773.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11773.is_deleted} = false ;;
}
