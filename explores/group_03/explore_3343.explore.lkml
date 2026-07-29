# Explore: explore_3343
# Auto-generated LookML Explore File

include: "/views/domain_30/view_10030.view.lkml"
include: "/views/domain_32/view_10032.view.lkml"
include: "/views/domain_33/view_10033.view.lkml"
include: "/views/domain_34/view_10034.view.lkml"

explore: explore_3343 {
  label: "Explore Explore 3343"
  description: "Comprehensive analytics explore joining base view_10030 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10030
  
  always_filter: {
    filters: [view_10030.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10030.created_at_date: "7 days"]
    unless: [view_10030.id, view_10030.status]
  }

  join: view_10032 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10030.user_id} = ${view_10032.id} ;;
    required_joins: []
  }

  join: view_10033 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10030.account_id} = ${view_10033.account_id} ;;
    required_joins: [view_10032]
  }

  join: view_10034 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10030.category} = ${view_10034.category} ;;
  }

  access_filter: {
    field: view_10030.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10030.is_deleted} = false ;;
}
