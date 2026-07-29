# Explore: explore_1164
# Auto-generated LookML Explore File

include: "/views/domain_43/view_03493.view.lkml"
include: "/views/domain_45/view_03495.view.lkml"
include: "/views/domain_46/view_03496.view.lkml"
include: "/views/domain_47/view_03497.view.lkml"

explore: explore_1164 {
  label: "Explore Explore 1164"
  description: "Comprehensive analytics explore joining base view_03493 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03493
  
  always_filter: {
    filters: [view_03493.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03493.created_at_date: "7 days"]
    unless: [view_03493.id, view_03493.status]
  }

  join: view_03495 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03493.user_id} = ${view_03495.id} ;;
    required_joins: []
  }

  join: view_03496 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03493.account_id} = ${view_03496.account_id} ;;
    required_joins: [view_03495]
  }

  join: view_03497 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03493.category} = ${view_03497.category} ;;
  }

  access_filter: {
    field: view_03493.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03493.is_deleted} = false ;;
}
