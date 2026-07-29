# Explore: explore_0850
# Auto-generated LookML Explore File

include: "/views/domain_01/view_02551.view.lkml"
include: "/views/domain_03/view_02553.view.lkml"
include: "/views/domain_04/view_02554.view.lkml"
include: "/views/domain_05/view_02555.view.lkml"

explore: explore_0850 {
  label: "Explore Explore 0850"
  description: "Comprehensive analytics explore joining base view_02551 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02551
  
  always_filter: {
    filters: [view_02551.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02551.created_at_date: "7 days"]
    unless: [view_02551.id, view_02551.status]
  }

  join: view_02553 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02551.user_id} = ${view_02553.id} ;;
    required_joins: []
  }

  join: view_02554 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02551.account_id} = ${view_02554.account_id} ;;
    required_joins: [view_02553]
  }

  join: view_02555 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02551.category} = ${view_02555.category} ;;
  }

  access_filter: {
    field: view_02551.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02551.is_deleted} = false ;;
}
