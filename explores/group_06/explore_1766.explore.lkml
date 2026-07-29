# Explore: explore_1766
# Auto-generated LookML Explore File

include: "/views/domain_49/view_05299.view.lkml"
include: "/views/domain_01/view_05301.view.lkml"
include: "/views/domain_02/view_05302.view.lkml"
include: "/views/domain_03/view_05303.view.lkml"

explore: explore_1766 {
  label: "Explore Explore 1766"
  description: "Comprehensive analytics explore joining base view_05299 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05299
  
  always_filter: {
    filters: [view_05299.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05299.created_at_date: "7 days"]
    unless: [view_05299.id, view_05299.status]
  }

  join: view_05301 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05299.user_id} = ${view_05301.id} ;;
    required_joins: []
  }

  join: view_05302 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05299.account_id} = ${view_05302.account_id} ;;
    required_joins: [view_05301]
  }

  join: view_05303 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05299.category} = ${view_05303.category} ;;
  }

  access_filter: {
    field: view_05299.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05299.is_deleted} = false ;;
}
