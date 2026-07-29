# Explore: explore_2387
# Auto-generated LookML Explore File

include: "/views/domain_12/view_07162.view.lkml"
include: "/views/domain_14/view_07164.view.lkml"
include: "/views/domain_15/view_07165.view.lkml"
include: "/views/domain_16/view_07166.view.lkml"

explore: explore_2387 {
  label: "Explore Explore 2387"
  description: "Comprehensive analytics explore joining base view_07162 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07162
  
  always_filter: {
    filters: [view_07162.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07162.created_at_date: "7 days"]
    unless: [view_07162.id, view_07162.status]
  }

  join: view_07164 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07162.user_id} = ${view_07164.id} ;;
    required_joins: []
  }

  join: view_07165 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07162.account_id} = ${view_07165.account_id} ;;
    required_joins: [view_07164]
  }

  join: view_07166 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07162.category} = ${view_07166.category} ;;
  }

  access_filter: {
    field: view_07162.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07162.is_deleted} = false ;;
}
