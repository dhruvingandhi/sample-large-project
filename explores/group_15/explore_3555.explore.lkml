# Explore: explore_3555
# Auto-generated LookML Explore File

include: "/views/domain_16/view_10666.view.lkml"
include: "/views/domain_18/view_10668.view.lkml"
include: "/views/domain_19/view_10669.view.lkml"
include: "/views/domain_20/view_10670.view.lkml"

explore: explore_3555 {
  label: "Explore Explore 3555"
  description: "Comprehensive analytics explore joining base view_10666 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10666
  
  always_filter: {
    filters: [view_10666.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10666.created_at_date: "7 days"]
    unless: [view_10666.id, view_10666.status]
  }

  join: view_10668 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10666.user_id} = ${view_10668.id} ;;
    required_joins: []
  }

  join: view_10669 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10666.account_id} = ${view_10669.account_id} ;;
    required_joins: [view_10668]
  }

  join: view_10670 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10666.category} = ${view_10670.category} ;;
  }

  access_filter: {
    field: view_10666.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10666.is_deleted} = false ;;
}
