# Explore: explore_3021
# Auto-generated LookML Explore File

include: "/views/domain_14/view_09064.view.lkml"
include: "/views/domain_16/view_09066.view.lkml"
include: "/views/domain_17/view_09067.view.lkml"
include: "/views/domain_18/view_09068.view.lkml"

explore: explore_3021 {
  label: "Explore Explore 3021"
  description: "Comprehensive analytics explore joining base view_09064 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09064
  
  always_filter: {
    filters: [view_09064.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09064.created_at_date: "7 days"]
    unless: [view_09064.id, view_09064.status]
  }

  join: view_09066 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09064.user_id} = ${view_09066.id} ;;
    required_joins: []
  }

  join: view_09067 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09064.account_id} = ${view_09067.account_id} ;;
    required_joins: [view_09066]
  }

  join: view_09068 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09064.category} = ${view_09068.category} ;;
  }

  access_filter: {
    field: view_09064.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09064.is_deleted} = false ;;
}
