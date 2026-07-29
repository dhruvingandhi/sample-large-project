# Explore: explore_0924
# Auto-generated LookML Explore File

include: "/views/domain_23/view_02773.view.lkml"
include: "/views/domain_25/view_02775.view.lkml"
include: "/views/domain_26/view_02776.view.lkml"
include: "/views/domain_27/view_02777.view.lkml"

explore: explore_0924 {
  label: "Explore Explore 0924"
  description: "Comprehensive analytics explore joining base view_02773 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02773
  
  always_filter: {
    filters: [view_02773.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02773.created_at_date: "7 days"]
    unless: [view_02773.id, view_02773.status]
  }

  join: view_02775 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02773.user_id} = ${view_02775.id} ;;
    required_joins: []
  }

  join: view_02776 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02773.account_id} = ${view_02776.account_id} ;;
    required_joins: [view_02775]
  }

  join: view_02777 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02773.category} = ${view_02777.category} ;;
  }

  access_filter: {
    field: view_02773.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02773.is_deleted} = false ;;
}
