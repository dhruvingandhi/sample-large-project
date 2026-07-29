# Explore: explore_1440
# Auto-generated LookML Explore File

include: "/views/domain_21/view_04321.view.lkml"
include: "/views/domain_23/view_04323.view.lkml"
include: "/views/domain_24/view_04324.view.lkml"
include: "/views/domain_25/view_04325.view.lkml"

explore: explore_1440 {
  label: "Explore Explore 1440"
  description: "Comprehensive analytics explore joining base view_04321 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04321
  
  always_filter: {
    filters: [view_04321.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04321.created_at_date: "7 days"]
    unless: [view_04321.id, view_04321.status]
  }

  join: view_04323 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04321.user_id} = ${view_04323.id} ;;
    required_joins: []
  }

  join: view_04324 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04321.account_id} = ${view_04324.account_id} ;;
    required_joins: [view_04323]
  }

  join: view_04325 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04321.category} = ${view_04325.category} ;;
  }

  access_filter: {
    field: view_04321.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04321.is_deleted} = false ;;
}
