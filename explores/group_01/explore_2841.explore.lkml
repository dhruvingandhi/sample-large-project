# Explore: explore_2841
# Auto-generated LookML Explore File

include: "/views/domain_24/view_08524.view.lkml"
include: "/views/domain_26/view_08526.view.lkml"
include: "/views/domain_27/view_08527.view.lkml"
include: "/views/domain_28/view_08528.view.lkml"

explore: explore_2841 {
  label: "Explore Explore 2841"
  description: "Comprehensive analytics explore joining base view_08524 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08524
  
  always_filter: {
    filters: [view_08524.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08524.created_at_date: "7 days"]
    unless: [view_08524.id, view_08524.status]
  }

  join: view_08526 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08524.user_id} = ${view_08526.id} ;;
    required_joins: []
  }

  join: view_08527 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08524.account_id} = ${view_08527.account_id} ;;
    required_joins: [view_08526]
  }

  join: view_08528 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08524.category} = ${view_08528.category} ;;
  }

  access_filter: {
    field: view_08524.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08524.is_deleted} = false ;;
}
