# Explore: explore_2924
# Auto-generated LookML Explore File

include: "/views/domain_23/view_08773.view.lkml"
include: "/views/domain_25/view_08775.view.lkml"
include: "/views/domain_26/view_08776.view.lkml"
include: "/views/domain_27/view_08777.view.lkml"

explore: explore_2924 {
  label: "Explore Explore 2924"
  description: "Comprehensive analytics explore joining base view_08773 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08773
  
  always_filter: {
    filters: [view_08773.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08773.created_at_date: "7 days"]
    unless: [view_08773.id, view_08773.status]
  }

  join: view_08775 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08773.user_id} = ${view_08775.id} ;;
    required_joins: []
  }

  join: view_08776 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08773.account_id} = ${view_08776.account_id} ;;
    required_joins: [view_08775]
  }

  join: view_08777 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08773.category} = ${view_08777.category} ;;
  }

  access_filter: {
    field: view_08773.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08773.is_deleted} = false ;;
}
