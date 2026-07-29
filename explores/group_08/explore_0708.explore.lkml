# Explore: explore_0708
# Auto-generated LookML Explore File

include: "/views/domain_25/view_02125.view.lkml"
include: "/views/domain_27/view_02127.view.lkml"
include: "/views/domain_28/view_02128.view.lkml"
include: "/views/domain_29/view_02129.view.lkml"

explore: explore_0708 {
  label: "Explore Explore 0708"
  description: "Comprehensive analytics explore joining base view_02125 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02125
  
  always_filter: {
    filters: [view_02125.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02125.created_at_date: "7 days"]
    unless: [view_02125.id, view_02125.status]
  }

  join: view_02127 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02125.user_id} = ${view_02127.id} ;;
    required_joins: []
  }

  join: view_02128 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02125.account_id} = ${view_02128.account_id} ;;
    required_joins: [view_02127]
  }

  join: view_02129 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02125.category} = ${view_02129.category} ;;
  }

  access_filter: {
    field: view_02125.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02125.is_deleted} = false ;;
}
