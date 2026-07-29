# Explore: explore_2021
# Auto-generated LookML Explore File

include: "/views/domain_14/view_06064.view.lkml"
include: "/views/domain_16/view_06066.view.lkml"
include: "/views/domain_17/view_06067.view.lkml"
include: "/views/domain_18/view_06068.view.lkml"

explore: explore_2021 {
  label: "Explore Explore 2021"
  description: "Comprehensive analytics explore joining base view_06064 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06064
  
  always_filter: {
    filters: [view_06064.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06064.created_at_date: "7 days"]
    unless: [view_06064.id, view_06064.status]
  }

  join: view_06066 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06064.user_id} = ${view_06066.id} ;;
    required_joins: []
  }

  join: view_06067 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06064.account_id} = ${view_06067.account_id} ;;
    required_joins: [view_06066]
  }

  join: view_06068 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06064.category} = ${view_06068.category} ;;
  }

  access_filter: {
    field: view_06064.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06064.is_deleted} = false ;;
}
