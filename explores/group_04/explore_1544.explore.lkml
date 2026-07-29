# Explore: explore_1544
# Auto-generated LookML Explore File

include: "/views/domain_33/view_04633.view.lkml"
include: "/views/domain_35/view_04635.view.lkml"
include: "/views/domain_36/view_04636.view.lkml"
include: "/views/domain_37/view_04637.view.lkml"

explore: explore_1544 {
  label: "Explore Explore 1544"
  description: "Comprehensive analytics explore joining base view_04633 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04633
  
  always_filter: {
    filters: [view_04633.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04633.created_at_date: "7 days"]
    unless: [view_04633.id, view_04633.status]
  }

  join: view_04635 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04633.user_id} = ${view_04635.id} ;;
    required_joins: []
  }

  join: view_04636 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04633.account_id} = ${view_04636.account_id} ;;
    required_joins: [view_04635]
  }

  join: view_04637 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04633.category} = ${view_04637.category} ;;
  }

  access_filter: {
    field: view_04633.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04633.is_deleted} = false ;;
}
