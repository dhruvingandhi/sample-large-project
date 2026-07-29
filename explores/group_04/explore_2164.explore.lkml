# Explore: explore_2164
# Auto-generated LookML Explore File

include: "/views/domain_43/view_06493.view.lkml"
include: "/views/domain_45/view_06495.view.lkml"
include: "/views/domain_46/view_06496.view.lkml"
include: "/views/domain_47/view_06497.view.lkml"

explore: explore_2164 {
  label: "Explore Explore 2164"
  description: "Comprehensive analytics explore joining base view_06493 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06493
  
  always_filter: {
    filters: [view_06493.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06493.created_at_date: "7 days"]
    unless: [view_06493.id, view_06493.status]
  }

  join: view_06495 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06493.user_id} = ${view_06495.id} ;;
    required_joins: []
  }

  join: view_06496 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06493.account_id} = ${view_06496.account_id} ;;
    required_joins: [view_06495]
  }

  join: view_06497 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06493.category} = ${view_06497.category} ;;
  }

  access_filter: {
    field: view_06493.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06493.is_deleted} = false ;;
}
