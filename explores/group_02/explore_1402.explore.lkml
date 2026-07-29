# Explore: explore_1402
# Auto-generated LookML Explore File

include: "/views/domain_07/view_04207.view.lkml"
include: "/views/domain_09/view_04209.view.lkml"
include: "/views/domain_10/view_04210.view.lkml"
include: "/views/domain_11/view_04211.view.lkml"

explore: explore_1402 {
  label: "Explore Explore 1402"
  description: "Comprehensive analytics explore joining base view_04207 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04207
  
  always_filter: {
    filters: [view_04207.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04207.created_at_date: "7 days"]
    unless: [view_04207.id, view_04207.status]
  }

  join: view_04209 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04207.user_id} = ${view_04209.id} ;;
    required_joins: []
  }

  join: view_04210 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04207.account_id} = ${view_04210.account_id} ;;
    required_joins: [view_04209]
  }

  join: view_04211 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04207.category} = ${view_04211.category} ;;
  }

  access_filter: {
    field: view_04207.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04207.is_deleted} = false ;;
}
