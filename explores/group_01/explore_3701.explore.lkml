# Explore: explore_3701
# Auto-generated LookML Explore File

include: "/views/domain_04/view_11104.view.lkml"
include: "/views/domain_06/view_11106.view.lkml"
include: "/views/domain_07/view_11107.view.lkml"
include: "/views/domain_08/view_11108.view.lkml"

explore: explore_3701 {
  label: "Explore Explore 3701"
  description: "Comprehensive analytics explore joining base view_11104 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11104
  
  always_filter: {
    filters: [view_11104.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11104.created_at_date: "7 days"]
    unless: [view_11104.id, view_11104.status]
  }

  join: view_11106 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11104.user_id} = ${view_11106.id} ;;
    required_joins: []
  }

  join: view_11107 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11104.account_id} = ${view_11107.account_id} ;;
    required_joins: [view_11106]
  }

  join: view_11108 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11104.category} = ${view_11108.category} ;;
  }

  access_filter: {
    field: view_11104.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11104.is_deleted} = false ;;
}
