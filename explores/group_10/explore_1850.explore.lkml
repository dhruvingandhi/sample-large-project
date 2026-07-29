# Explore: explore_1850
# Auto-generated LookML Explore File

include: "/views/domain_01/view_05551.view.lkml"
include: "/views/domain_03/view_05553.view.lkml"
include: "/views/domain_04/view_05554.view.lkml"
include: "/views/domain_05/view_05555.view.lkml"

explore: explore_1850 {
  label: "Explore Explore 1850"
  description: "Comprehensive analytics explore joining base view_05551 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05551
  
  always_filter: {
    filters: [view_05551.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05551.created_at_date: "7 days"]
    unless: [view_05551.id, view_05551.status]
  }

  join: view_05553 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05551.user_id} = ${view_05553.id} ;;
    required_joins: []
  }

  join: view_05554 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05551.account_id} = ${view_05554.account_id} ;;
    required_joins: [view_05553]
  }

  join: view_05555 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05551.category} = ${view_05555.category} ;;
  }

  access_filter: {
    field: view_05551.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05551.is_deleted} = false ;;
}
